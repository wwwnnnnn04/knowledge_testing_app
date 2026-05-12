BEGIN;

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM pg_type
        WHERE typname = 'answer_input'
    ) THEN
        CREATE TYPE answer_input AS (
            question_id BIGINT,
            answer_id BIGINT
        );
    END IF;
END $$;

CREATE OR REPLACE FUNCTION validate_single_correct_answer()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    IF NEW."isCorrect" = TRUE THEN
        IF EXISTS (
            SELECT 1
            FROM answer a
            WHERE a."questionId" = NEW."questionId"
              AND a."isCorrect" = TRUE
              AND (TG_OP = 'INSERT' OR a.id <> NEW.id)
        ) THEN
            RAISE EXCEPTION 'У одного вопроса может быть только один правильный ответ';
        END IF;
    END IF;

    RETURN NEW;
END;
$$;

DROP TRIGGER IF EXISTS trg_validate_single_correct_answer ON answer;

CREATE TRIGGER trg_validate_single_correct_answer
BEFORE INSERT OR UPDATE ON answer
FOR EACH ROW
EXECUTE FUNCTION validate_single_correct_answer();


CREATE OR REPLACE FUNCTION validate_answer_attempt_pair()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
DECLARE
    v_answer_question_id BIGINT;
BEGIN
    SELECT "questionId"
    INTO v_answer_question_id
    FROM answer
    WHERE id = NEW."answerId";

    IF v_answer_question_id IS NULL THEN
        RAISE EXCEPTION 'Ответ с id=% не найден', NEW."answerId";
    END IF;

    IF v_answer_question_id <> NEW."questionId" THEN
        RAISE EXCEPTION 'Выбранный answerId не принадлежит questionId';
    END IF;

    RETURN NEW;
END;
$$;

DROP TRIGGER IF EXISTS trg_validate_answer_attempt_pair ON answer_attempt;

CREATE TRIGGER trg_validate_answer_attempt_pair
BEFORE INSERT OR UPDATE ON answer_attempt
FOR EACH ROW
EXECUTE FUNCTION validate_answer_attempt_pair();

CREATE OR REPLACE FUNCTION create_attempt(
    p_user_id BIGINT,
    p_test_id BIGINT
)
RETURNS BIGINT
LANGUAGE plpgsql
AS $$
DECLARE
    v_attempt_id BIGINT;
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM "user" u WHERE u.id = p_user_id
    ) THEN
        RAISE EXCEPTION 'Пользователь не найден';
    END IF;

    IF NOT EXISTS (
        SELECT 1 FROM test t WHERE t.id = p_test_id
    ) THEN
        RAISE EXCEPTION 'Тест не найден';
    END IF;

    INSERT INTO attempt ("userId", "testId")
    VALUES (p_user_id, p_test_id)
    RETURNING id INTO v_attempt_id;

    RETURN v_attempt_id;
END;
$$;

CREATE OR REPLACE FUNCTION submit_answers(
    p_attempt_id BIGINT,
    p_answers answer_input[]
)
RETURNS VOID
LANGUAGE plpgsql
AS $$
DECLARE
    item answer_input;
    v_answer_question_id BIGINT;
    v_answer_is_correct BOOLEAN;
    v_attempt_test_id BIGINT;
    v_question_test_id BIGINT;
BEGIN
    SELECT "testId"
    INTO v_attempt_test_id
    FROM attempt
    WHERE id = p_attempt_id;

    IF v_attempt_test_id IS NULL THEN
        RAISE EXCEPTION 'Попытка не найдена';
    END IF;

    FOREACH item IN ARRAY p_answers LOOP
        SELECT a."questionId", a."isCorrect"
        INTO v_answer_question_id, v_answer_is_correct
        FROM answer a
        WHERE a.id = item.answer_id;

        IF v_answer_question_id IS NULL THEN
            RAISE EXCEPTION 'Ответ с id=% не найден', item.answer_id;
        END IF;

        IF v_answer_question_id <> item.question_id THEN
            RAISE EXCEPTION 'answer_id=% не принадлежит question_id=%',
                item.answer_id, item.question_id;
        END IF;

        SELECT q."testId"
        INTO v_question_test_id
        FROM question q
        WHERE q.id = item.question_id;

        IF v_question_test_id IS NULL THEN
            RAISE EXCEPTION 'Вопрос с id=% не найден', item.question_id;
        END IF;

        IF v_question_test_id <> v_attempt_test_id THEN
            RAISE EXCEPTION 'Вопрос не относится к тесту данной попытки';
        END IF;

        INSERT INTO answer_attempt ("attemptId", "questionId", "answerId", "isCorrect")
        VALUES (p_attempt_id, item.question_id, item.answer_id, v_answer_is_correct);
    END LOOP;
END;
$$;

CREATE OR REPLACE FUNCTION calculate_result(
    p_attempt_id BIGINT
)
RETURNS BIGINT
LANGUAGE plpgsql
AS $$
DECLARE
    v_score BIGINT;
    v_max BIGINT;
    v_percentage DOUBLE PRECISION;
    v_passed BOOLEAN;
BEGIN
    IF EXISTS (
        SELECT 1
        FROM result r
        WHERE r."attemptId" = p_attempt_id
    ) THEN
        RAISE EXCEPTION 'Результат для данной попытки уже существует';
    END IF;

    SELECT COUNT(*)
    INTO v_score
    FROM answer_attempt aa
    WHERE aa."attemptId" = p_attempt_id
      AND aa."isCorrect" = TRUE;

    SELECT COUNT(*)
    INTO v_max
    FROM question q
    JOIN attempt a ON a."testId" = q."testId"
    WHERE a.id = p_attempt_id;

    IF v_max = 0 THEN
        RAISE EXCEPTION 'Невозможно вычислить результат: у теста нет вопросов';
    END IF;

    v_percentage := ROUND((v_score::NUMERIC * 100.0 / v_max), 2)::DOUBLE PRECISION;
    v_passed := v_percentage >= 70.0;

    INSERT INTO result ("attemptId", "score", "maxScore", "percentage", "passed")
    VALUES (p_attempt_id, v_score, v_max, v_percentage, v_passed);

    RETURN v_score;
END;
$$;

CREATE OR REPLACE FUNCTION generate_certificate(
    p_attempt_id BIGINT
)
RETURNS VOID
LANGUAGE plpgsql
AS $$
DECLARE
    v_user_id BIGINT;
    v_test_id BIGINT;
    v_percentage DOUBLE PRECISION;
    v_passed BOOLEAN;
BEGIN
    SELECT a."userId", a."testId"
    INTO v_user_id, v_test_id
    FROM attempt a
    WHERE a.id = p_attempt_id;

    IF v_user_id IS NULL OR v_test_id IS NULL THEN
        RAISE EXCEPTION 'Попытка не найдена';
    END IF;

    SELECT r."percentage", r."passed"
    INTO v_percentage, v_passed
    FROM result r
    WHERE r."attemptId" = p_attempt_id;

    IF v_percentage IS NULL THEN
        RAISE EXCEPTION 'Сначала необходимо рассчитать результат';
    END IF;

    IF v_passed = TRUE THEN
        IF NOT EXISTS (
            SELECT 1
            FROM certificate c
            WHERE c."attemptId" = p_attempt_id
        ) THEN
            INSERT INTO certificate ("userId", "testId", "attemptId", "percentage")
            VALUES (v_user_id, v_test_id, p_attempt_id, v_percentage);
        END IF;
    END IF;
END;
$$;

CREATE OR REPLACE PROCEDURE complete_attempt(
    p_attempt_id BIGINT,
    p_answers answer_input[]
)
LANGUAGE plpgsql
AS $$
BEGIN
    PERFORM submit_answers(p_attempt_id, p_answers);
    PERFORM calculate_result(p_attempt_id);
    PERFORM generate_certificate(p_attempt_id);
END;
$$;


CREATE OR REPLACE VIEW v_test_stats AS
SELECT
    t.id,
    t.title,
    COUNT(a.id) AS attempts_count,
    COUNT(r.id) AS results_count,
    COUNT(c.id) AS certificates_count
FROM test t
LEFT JOIN attempt a ON a."testId" = t.id
LEFT JOIN result r ON r."attemptId" = a.id
LEFT JOIN certificate c ON c."attemptId" = a.id
GROUP BY t.id, t.title;

CREATE OR REPLACE VIEW v_user_results AS
SELECT
    u.id AS user_id,
    u.username,
    t.id AS test_id,
    t.title AS test_title,
    a.id AS attempt_id,
    r.score,
    r."maxScore" AS max_score,
    r.percentage,
    r.passed
FROM result r
JOIN attempt a ON a.id = r."attemptId"
JOIN "user" u ON u.id = a."userId"
JOIN test t ON t.id = a."testId";

CREATE OR REPLACE VIEW v_test_structure AS
SELECT
    t.id AS test_id,
    t.title AS test_title,
    COUNT(DISTINCT q.id) AS questions_count,
    COUNT(a.id) AS answers_count
FROM test t
LEFT JOIN question q ON q."testId" = t.id
LEFT JOIN answer a ON a."questionId" = q.id
GROUP BY t.id, t.title;

CREATE OR REPLACE VIEW v_user_certificates AS
SELECT
    c.id AS certificate_id,
    u.id AS user_id,
    u.username,
    t.id AS test_id,
    t.title AS test_title,
    c.percentage
FROM certificate c
JOIN "user" u ON u.id = c."userId"
JOIN test t ON t.id = c."testId";

CREATE OR REPLACE VIEW v_author_tests AS
SELECT
    u.id AS author_id,
    u.username AS author_name,
    t.id AS test_id,
    t.title AS test_title,
    cat.id AS category_id,
    cat.name AS category_name
FROM test t
JOIN "user" u ON u.id = t."creatorId"
LEFT JOIN category cat ON cat.id = t."categoryId"
WHERE u.role = 'author';


CREATE OR REPLACE FUNCTION write_log_entry()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
DECLARE
    v_user_id BIGINT;
    v_action TEXT;
BEGIN
    IF TG_TABLE_NAME = 'test' THEN
        v_user_id := NEW."creatorId";
        v_action := 'Создан тест: ' || NEW.title;

    ELSIF TG_TABLE_NAME = 'attempt' THEN
        v_user_id := NEW."userId";
        v_action := 'Начата попытка по тесту id=' || NEW."testId";

    ELSIF TG_TABLE_NAME = 'result' THEN
        SELECT a."userId"
        INTO v_user_id
        FROM attempt a
        WHERE a.id = NEW."attemptId";

        v_action := 'Рассчитан результат: ' || NEW.score || '/' || NEW."maxScore";

    ELSIF TG_TABLE_NAME = 'certificate' THEN
        v_user_id := NEW."userId";
        v_action := 'Выдан сертификат по тесту id=' || NEW."testId";

    ELSE
        RETURN NEW;
    END IF;

    INSERT INTO log ("userId", action, "createdAt")
    VALUES (v_user_id, v_action, NOW());

    RETURN NEW;
END;
$$;

DROP TRIGGER IF EXISTS trg_log_test_insert ON test;
CREATE TRIGGER trg_log_test_insert
AFTER INSERT ON test
FOR EACH ROW
EXECUTE FUNCTION write_log_entry();

DROP TRIGGER IF EXISTS trg_log_attempt_insert ON attempt;
CREATE TRIGGER trg_log_attempt_insert
AFTER INSERT ON attempt
FOR EACH ROW
EXECUTE FUNCTION write_log_entry();

DROP TRIGGER IF EXISTS trg_log_result_insert ON result;
CREATE TRIGGER trg_log_result_insert
AFTER INSERT ON result
FOR EACH ROW
EXECUTE FUNCTION write_log_entry();

DROP TRIGGER IF EXISTS trg_log_certificate_insert ON certificate;
CREATE TRIGGER trg_log_certificate_insert
AFTER INSERT ON certificate
FOR EACH ROW
EXECUTE FUNCTION write_log_entry();

COMMIT;