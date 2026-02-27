BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "answer" (
    "id" bigserial PRIMARY KEY,
    "text" text NOT NULL,
    "isCorrect" boolean NOT NULL,
    "questionId" bigint NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "answer_attempt" (
    "id" bigserial PRIMARY KEY,
    "isCorrect" boolean NOT NULL,
    "questionId" bigint NOT NULL,
    "answerId" bigint NOT NULL,
    "attemptId" bigint NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "attempt" (
    "id" bigserial PRIMARY KEY,
    "score" bigint NOT NULL,
    "maxScore" bigint NOT NULL,
    "userId" bigint NOT NULL,
    "testId" bigint NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "question" (
    "id" bigserial PRIMARY KEY,
    "text" text NOT NULL,
    "order" bigint NOT NULL,
    "testId" bigint NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "test" (
    "id" bigserial PRIMARY KEY,
    "title" text NOT NULL,
    "creatorId" bigint NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "user" (
    "id" bigserial PRIMARY KEY,
    "username" text NOT NULL,
    "email" text NOT NULL,
    "password" text NOT NULL,
    "role" text NOT NULL
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "answer"
    ADD CONSTRAINT "answer_fk_0"
    FOREIGN KEY("questionId")
    REFERENCES "question"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "answer_attempt"
    ADD CONSTRAINT "answer_attempt_fk_0"
    FOREIGN KEY("questionId")
    REFERENCES "question"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "answer_attempt"
    ADD CONSTRAINT "answer_attempt_fk_1"
    FOREIGN KEY("answerId")
    REFERENCES "answer"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "answer_attempt"
    ADD CONSTRAINT "answer_attempt_fk_2"
    FOREIGN KEY("attemptId")
    REFERENCES "attempt"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "attempt"
    ADD CONSTRAINT "attempt_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "user"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "attempt"
    ADD CONSTRAINT "attempt_fk_1"
    FOREIGN KEY("testId")
    REFERENCES "test"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "question"
    ADD CONSTRAINT "question_fk_0"
    FOREIGN KEY("testId")
    REFERENCES "test"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "test"
    ADD CONSTRAINT "test_fk_0"
    FOREIGN KEY("creatorId")
    REFERENCES "user"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR knowledge_testing_app
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('knowledge_testing_app', '20260107120426529', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260107120426529', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20251208110333922-v3-0-0', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251208110333922-v3-0-0', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_idp
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_idp', '20251208110420531-v3-0-0', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251208110420531-v3-0-0', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_core
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_core', '20251208110412389-v3-0-0', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251208110412389-v3-0-0', "timestamp" = now();


COMMIT;
