-- Dart core + OOP basics seed.
-- Можно целиком вставить и выполнить в Postico.
-- Скрипт сам создаст категорию и автора, если они еще не существуют.

DO $$
DECLARE
  v_base_title text := 'Dart core + OOP basics';
  v_title text := v_base_title;
  v_category_id bigint;
  v_creator_id bigint;
  v_test_id bigint;
  v_existing_test_id bigint;
  v_existing_attempts_count bigint;
  q record;
BEGIN
  SELECT id
  INTO v_creator_id
  FROM "user"
  WHERE role = 'author'
  ORDER BY id
  LIMIT 1;

  IF v_creator_id IS NULL THEN
    INSERT INTO "user" (username, email, password, role)
    VALUES ('Seed author', 'seed_author@example.com', '1234', 'author')
    RETURNING id INTO v_creator_id;
  END IF;

  SELECT id
  INTO v_category_id
  FROM category
  WHERE name = 'Dart'
  ORDER BY id
  LIMIT 1;

  IF v_category_id IS NULL THEN
    INSERT INTO category (name)
    VALUES ('Dart')
    RETURNING id INTO v_category_id;
  END IF;

  SELECT id
  INTO v_existing_test_id
  FROM test
  WHERE title = v_base_title
    AND "creatorId" = v_creator_id
  ORDER BY id DESC
  LIMIT 1;

  IF v_existing_test_id IS NOT NULL THEN
    SELECT count(*)
    INTO v_existing_attempts_count
    FROM attempt
    WHERE "testId" = v_existing_test_id;

    IF v_existing_attempts_count = 0 THEN
      DELETE FROM answer
      WHERE "questionId" IN (
        SELECT id FROM question WHERE "testId" = v_existing_test_id
      );
      DELETE FROM question WHERE "testId" = v_existing_test_id;
      DELETE FROM test_tag WHERE "testId" = v_existing_test_id;
      DELETE FROM test WHERE id = v_existing_test_id;
    ELSE
      v_title := v_base_title || ' ' || to_char(now(), 'YYYY-MM-DD HH24:MI');
    END IF;
  END IF;

  INSERT INTO test (title, "creatorId", "categoryId")
  VALUES (v_title, v_creator_id, v_category_id)
  RETURNING id INTO v_test_id;

  CREATE TEMP TABLE seed_question (
    order_no int,
    question_text text,
    correct_letter text,
    answer_a text,
    answer_b text,
    answer_c text,
    answer_d text
  ) ON COMMIT DROP;

  INSERT INTO seed_question (
    order_no,
    question_text,
    correct_letter,
    answer_a,
    answer_b,
    answer_c,
    answer_d
  )
  VALUES
    (1, $q$Что такое функция в Dart?$q$, 'B',
      $a$Переменная, которая хранит список$a$,
      $a$Блок кода, который можно вызвать по имени$a$,
      $a$Только команда `print`$a$,
      $a$Тип данных для текста$a$),
    (2, $q$Что делает `return` в функции?$q$, 'B',
      $a$Выводит текст в консоль$a$,
      $a$Завершает функцию и возвращает результат$a$,
      $a$Создает новую переменную$a$,
      $a$Запускает цикл$a$),
    (3, $q$Что значит `void`?$q$, 'C',
      $a$Функция возвращает `String`$a$,
      $a$Функция возвращает `int`$a$,
      $a$Функция ничего не возвращает$a$,
      $a$Функция обязательно принимает параметры$a$),
    (4, $q$Чем `print` отличается от `return`?$q$, 'C',
      $a$`print` возвращает значение, а `return` печатает$a$,
      $a$Они делают одно и то же$a$,
      $a$`print` выводит в консоль, а `return` возвращает результат из функции$a$,
      $a$`return` можно использовать только в циклах$a$),
    (5, $q$Что вернет функция?

```dart
int sum(int a, int b) {
  return a + b;
}

void main() {
  final result = sum(2, 3);
}
```$q$, 'C',
      $a$`2`$a$,
      $a$`3`$a$,
      $a$`5`$a$,
      $a$Ничего, потому что нет `print`$a$),
    (6, $q$Что такое параметр функции?$q$, 'B',
      $a$Значение, которое функция выводит в консоль$a$,
      $a$Переменная, которую функция принимает на вход$a$,
      $a$Название файла$a$,
      $a$Тип цикла$a$),
    (7, $q$Что такое аргумент?$q$, 'A',
      $a$Конкретное значение, которое передали в функцию при вызове$a$,
      $a$Название класса$a$,
      $a$Ошибка в коде$a$,
      $a$Только строка$a$),
    (8, $q$Что такое named parameter?$q$, 'A',
      $a$Параметр, который передается по имени$a$,
      $a$Параметр, который всегда равен `null`$a$,
      $a$Параметр без типа$a$,
      $a$Параметр только для списков$a$),
    (9, $q$Что значит `required`?

```dart
void greet({required String name}) {}
```$q$, 'B',
      $a$Параметр можно не передавать$a$,
      $a$Параметр обязательно нужно передать$a$,
      $a$Параметр всегда будет `null`$a$,
      $a$Параметр нельзя использовать внутри функции$a$),
    (10, $q$Что такое default value?$q$, 'A',
      $a$Значение, которое используется, если аргумент не передали$a$,
      $a$Ошибка компиляции$a$,
      $a$Значение, которое всегда равно `null`$a$,
      $a$Значение, которое нельзя изменить внутри функции$a$),
    (11, $q$Что выведет код?

```dart
void printUser({String name = 'Guest'}) {
  print(name);
}

void main() {
  printUser();
}
```$q$, 'B',
      $a$`null`$a$,
      $a$`Guest`$a$,
      $a$Ошибка$a$,
      $a$Ничего$a$),
    (12, $q$Что такое `null`?$q$, 'C',
      $a$Число 0$a$,
      $a$Пустая строка$a$,
      $a$Отсутствие значения$a$,
      $a$Список без элементов$a$),
    (13, $q$Что означает тип `String?`?$q$, 'B',
      $a$Строка не может быть `null`$a$,
      $a$Значение может быть строкой или `null`$a$,
      $a$Значение обязательно число$a$,
      $a$Это ошибка синтаксиса$a$),
    (14, $q$Какой вариант безопасно проверяет nullable строку?

```dart
String? name;
```$q$, 'B',
      $a$`print(name.length);`$a$,
      $a$`if (name != null) { print(name.length); }`$a$,
      $a$`print(name + 1);`$a$,
      $a$`name();`$a$),
    (15, $q$Что делает оператор `??`?$q$, 'B',
      $a$Всегда возвращает `null`$a$,
      $a$Возвращает значение слева, если оно не `null`, иначе значение справа$a$,
      $a$Удаляет переменную$a$,
      $a$Создает список$a$),
    (16, $q$Что выведет код?

```dart
String? name;
print(name ?? 'No name');
```$q$, 'C',
      $a$`null`$a$,
      $a$`name`$a$,
      $a$`No name`$a$,
      $a$Ошибка$a$),
    (17, $q$Что такое arrow function?$q$, 'B',
      $a$Функция, которая всегда ничего не возвращает$a$,
      $a$Короткая запись функции с одним выражением$a$,
      $a$Функция только для классов$a$,
      $a$Функция без имени$a$),
    (18, $q$Какой вариант является arrow function?$q$, 'A',
      $a$`int sum(int a, int b) => a + b;`$a$,
      $a$`int sum(int a, int b) { print(a + b); }`$a$,
      $a$`sum = int;`$a$,
      $a$`return => sum;`$a$),
    (19, $q$Что такое anonymous function?$q$, 'A',
      $a$Функция без имени$a$,
      $a$Функция, которая всегда возвращает `null`$a$,
      $a$Класс без конструктора$a$,
      $a$Список функций$a$),
    (20, $q$Что такое callback?$q$, 'A',
      $a$Функция, которую передают как аргумент в другую функцию$a$,
      $a$Тип строки$a$,
      $a$Ошибка в цикле$a$,
      $a$Метод для удаления списка$a$),
    (21, $q$Что означает тип `void Function()`?$q$, 'A',
      $a$Функция без параметров, которая ничего не возвращает$a$,
      $a$Строка$a$,
      $a$Список чисел$a$,
      $a$Функция, которая обязательно возвращает `int`$a$),
    (22, $q$Какой тип подойдет для функции, которая принимает `String` и возвращает `bool`?$q$, 'B',
      $a$`String Function(bool)`$a$,
      $a$`bool Function(String)`$a$,
      $a$`void Function(String)`$a$,
      $a$`int Function()`$a$),
    (23, $q$Что делает `map` у списка?$q$, 'B',
      $a$Удаляет все элементы$a$,
      $a$Преобразует каждый элемент списка$a$,
      $a$Оставляет только подходящие элементы$a$,
      $a$Считает сумму$a$),
    (24, $q$Что делает `where`?$q$, 'A',
      $a$Фильтрует элементы по условию$a$,
      $a$Преобразует каждый элемент$a$,
      $a$Создает класс$a$,
      $a$Останавливает функцию$a$),
    (25, $q$Что делает `fold`?$q$, 'B',
      $a$Создает enum$a$,
      $a$Накопительно считает результат по элементам списка$a$,
      $a$Удаляет nullable значения$a$,
      $a$Делает строку большой$a$),
    (26, $q$Что делает `any`?$q$, 'A',
      $a$Проверяет, есть ли хотя бы один элемент, подходящий под условие$a$,
      $a$Проверяет, что все элементы подходят$a$,
      $a$Сортирует список$a$,
      $a$Создает объект$a$),
    (27, $q$Что делает `every`?$q$, 'A',
      $a$Проверяет, что все элементы подходят под условие$a$,
      $a$Проверяет только первый элемент$a$,
      $a$Удаляет элементы$a$,
      $a$Возвращает сумму$a$),
    (28, $q$Что делает `.toList()` после `map` или `where`?$q$, 'A',
      $a$Превращает результат обратно в список$a$,
      $a$Удаляет список$a$,
      $a$Создает `null`$a$,
      $a$Запускает функцию `main`$a$),
    (29, $q$Что такое класс?$q$, 'B',
      $a$Конкретный объект$a$,
      $a$Чертеж/описание будущих объектов$a$,
      $a$Только список переменных$a$,
      $a$Только функция `main`$a$),
    (30, $q$Что такое объект?$q$, 'A',
      $a$Конкретный экземпляр класса$a$,
      $a$Только название класса$a$,
      $a$Только метод$a$,
      $a$Только enum$a$),
    (31, $q$Что такое поле класса?$q$, 'A',
      $a$Данные, которые хранит объект$a$,
      $a$Функция без имени$a$,
      $a$Ошибка компиляции$a$,
      $a$Только `print`$a$),
    (32, $q$Что такое метод класса?$q$, 'A',
      $a$Функция, которая принадлежит классу или объекту$a$,
      $a$Поле без типа$a$,
      $a$Список объектов$a$,
      $a$Значение `null`$a$),
    (33, $q$Что такое constructor?$q$, 'A',
      $a$Метод, который создает объект и заполняет его поля$a$,
      $a$Метод, который всегда удаляет объект$a$,
      $a$Тип данных для enum$a$,
      $a$Функция только для списков$a$),
    (34, $q$Что значит `required this.name` в конструкторе?$q$, 'B',
      $a$Создать локальную переменную и забыть ее$a$,
      $a$Обязательный параметр записывается в поле `name` текущего объекта$a$,
      $a$Поле всегда будет `null`$a$,
      $a$Это можно использовать только во Flutter$a$),
    (35, $q$Что такое named constructor?$q$, 'A',
      $a$Дополнительный конструктор с именем$a$,
      $a$Getter$a$,
      $a$Setter$a$,
      $a$Nullable переменная$a$),
    (36, $q$Что означает `: price = 0` в named constructor?$q$, 'A',
      $a$Значение записывается в final поле при создании объекта$a$,
      $a$Значение печатается в консоль$a$,
      $a$Создается enum$a$,
      $a$Удаляется поле `price`$a$),
    (37, $q$Что такое инкапсуляция?$q$, 'A',
      $a$Когда объект скрывает внутренние данные и дает безопасный доступ к ним$a$,
      $a$Когда все поля делают public$a$,
      $a$Когда код пишется только в `main`$a$,
      $a$Когда все значения равны `null`$a$),
    (38, $q$Что означает поле `_price` в Dart?$q$, 'A',
      $a$Это private field$a$,
      $a$Это enum$a$,
      $a$Это ошибка$a$,
      $a$Это обязательный параметр$a$),
    (39, $q$Зачем нужны private fields?$q$, 'A',
      $a$Чтобы скрыть внутренние данные и не давать менять их напрямую$a$,
      $a$Чтобы объект нельзя было создать$a$,
      $a$Чтобы все значения стали `null`$a$,
      $a$Чтобы заменить функцию `main`$a$),
    (40, $q$Что такое getter?$q$, 'A',
      $a$Способ безопасно прочитать значение$a$,
      $a$Способ удалить объект$a$,
      $a$Только named constructor$a$,
      $a$Только callback$a$),
    (41, $q$Что такое computed getter?$q$, 'A',
      $a$Getter, который вычисляет значение, а не просто возвращает поле$a$,
      $a$Getter, который всегда возвращает `null`$a$,
      $a$Getter, который ничего не возвращает$a$,
      $a$Getter, который можно использовать только в enum$a$),
    (42, $q$Когда лучше использовать метод вместо setter?$q$, 'A',
      $a$Когда действие имеет смысл, например `increaseCount()` или `complete()`$a$,
      $a$Когда нужно просто прочитать значение$a$,
      $a$Когда нужно создать enum$a$,
      $a$Когда функция ничего не возвращает$a$),
    (43, $q$Зачем нужен `toString()`?$q$, 'A',
      $a$Чтобы дать объекту понятное строковое описание$a$,
      $a$Чтобы создать объект$a$,
      $a$Чтобы сделать поле private$a$,
      $a$Чтобы удалить список$a$),
    (44, $q$Что значит `@override`?$q$, 'A',
      $a$Мы переопределяем уже существующий метод$a$,
      $a$Мы создаем nullable переменную$a$,
      $a$Мы запускаем цикл$a$,
      $a$Мы создаем список$a$),
    (45, $q$Что такое enum?$q$, 'A',
      $a$Тип с ограниченным набором значений$a$,
      $a$Список строк$a$,
      $a$Функция без имени$a$,
      $a$Класс без полей$a$),
    (46, $q$Почему enum лучше строки для статуса?$q$, 'A',
      $a$Нельзя случайно написать несуществующий статус без ошибки$a$,
      $a$Enum всегда быстрее `print`$a$,
      $a$Enum автоматически создает UI$a$,
      $a$Enum нельзя использовать в классе$a$),
    (47, $q$Что означает `TaskStatus.done`?$q$, 'A',
      $a$Конкретное значение enum `TaskStatus`$a$,
      $a$Строка$a$,
      $a$Nullable поле$a$,
      $a$Constructor класса `Task`$a$),
    (48, $q$Что такое extension в Dart?$q$, 'A',
      $a$Способ добавить удобные методы или getters к уже существующему типу$a$,
      $a$Способ удалить класс$a$,
      $a$Способ сделать все поля public$a$,
      $a$Способ остановить программу$a$),
    (49, $q$Что значит `extension StringExtension on String`?$q$, 'A',
      $a$Мы добавляем дополнительные возможности для типа `String`$a$,
      $a$Мы создаем новый тип `int`$a$,
      $a$Мы удаляем стандартный класс `String`$a$,
      $a$Мы создаем enum$a$),
    (50, $q$Почему `price.rubles` пишется без скобок, а `name.capitalized()` со скобками?$q$, 'A',
      $a$`rubles` — getter, а `capitalized()` — method$a$,
      $a$Потому что `rubles` — enum$a$,
      $a$Потому что `capitalized` всегда ошибка$a$,
      $a$Потому что скобки в Dart не используются$a$);

  FOR q IN
    SELECT *
    FROM seed_question
    ORDER BY order_no
  LOOP
    INSERT INTO question (text, "order", "testId")
    VALUES (q.question_text, q.order_no, v_test_id)
    RETURNING id INTO STRICT v_existing_test_id;

    INSERT INTO answer (text, "isCorrect", "questionId")
    VALUES
      (q.answer_a, q.correct_letter = 'A', v_existing_test_id),
      (q.answer_b, q.correct_letter = 'B', v_existing_test_id),
      (q.answer_c, q.correct_letter = 'C', v_existing_test_id),
      (q.answer_d, q.correct_letter = 'D', v_existing_test_id);
  END LOOP;

  RAISE NOTICE 'Создан тест "%" id=% с 50 вопросами. Автор id=%, категория id=%',
    v_title, v_test_id, v_creator_id, v_category_id;
END $$;
