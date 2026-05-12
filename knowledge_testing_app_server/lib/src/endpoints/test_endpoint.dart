import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';

class TestEndpoint extends Endpoint {
  Future<List<Category>> getCategories(Session session) async {
    return await Category.db.find(
      session,
      orderBy: (t) => t.name,
    );
  }

  Future<Category> createCategory(
    Session session, {
    required String name,
  }) async {
    final normalizedName = name.trim();

    if (normalizedName.isEmpty) {
      throw Exception('Название категории не может быть пустым.');
    }

    final existingCategory = await Category.db.findFirstRow(
      session,
      where: (t) => t.name.equals(normalizedName),
    );

    if (existingCategory != null) {
      return existingCategory;
    }

    final category = Category(name: normalizedName);
    return await Category.db.insertRow(session, category);
  }

  Future<List<Test>> getTests(
    Session session, {
    int? categoryId,
  }) async {
    if (categoryId != null) {
      return await Test.db.find(
        session,
        where: (t) => t.categoryId.equals(categoryId),
        include: Test.include(
          category: Category.include(),
          creator: User.include(),
        ),
        orderBy: (t) => t.id,
        orderDescending: true,
      );
    }

    return await Test.db.find(
      session,
      include: Test.include(
        category: Category.include(),
        creator: User.include(),
      ),
      orderBy: (t) => t.id,
      orderDescending: true,
    );
  }

  Future<List<Test>> getTestsByCreator(
    Session session,
    int creatorId,
  ) async {
    return await Test.db.find(
      session,
      where: (t) => t.creatorId.equals(creatorId),
      include: Test.include(
        category: Category.include(),
        creator: User.include(),
      ),
      orderBy: (t) => t.id,
      orderDescending: true,
    );
  }

  Future<Test> createTest(
    Session session, {
    required String title,
    required int creatorId,
    required int categoryId,
  }) async {
    final normalizedTitle = title.trim();

    if (normalizedTitle.isEmpty) {
      throw Exception('Название теста не может быть пустым.');
    }

    final creator = await User.db.findById(session, creatorId);
    if (creator == null) {
      throw Exception('Пользователь-автор не найден.');
    }

    if (creator.role != Role.author) {
      throw Exception('Создавать тесты может только пользователь с ролью author.');
    }

    final category = await Category.db.findById(session, categoryId);
    if (category == null) {
      throw Exception('Категория не найдена.');
    }

    final test = Test(
      title: normalizedTitle,
      creatorId: creatorId,
      categoryId: categoryId,
    );

    return await Test.db.insertRow(session, test);
  }

  Future<Question> addQuestion(
    Session session, {
    required int creatorId,
    required int testId,
    required String text,
  }) async {
    final normalizedText = text.trim();

    if (normalizedText.isEmpty) {
      throw Exception('Текст вопроса не может быть пустым.');
    }

    await _ensureAuthorOwnsTest(
      session,
      creatorId: creatorId,
      testId: testId,
    );

    final existingQuestions = await Question.db.find(
      session,
      where: (q) => q.testId.equals(testId),
      orderBy: (q) => q.order,
      orderDescending: true,
      limit: 1,
    );

    final nextOrder = existingQuestions.isEmpty ? 1 : existingQuestions.first.order + 1;

    final question = Question(
      text: normalizedText,
      order: nextOrder,
      testId: testId,
    );

    return await Question.db.insertRow(session, question);
  }

  Future<Answer> addAnswer(
    Session session, {
    required int creatorId,
    required int questionId,
    required String text,
    required bool isCorrect,
  }) async {
    final normalizedText = text.trim();

    if (normalizedText.isEmpty) {
      throw Exception('Текст ответа не может быть пустым.');
    }

    final question = await Question.db.findById(session, questionId);

    if (question == null) {
      throw Exception('Вопрос не найден.');
    }

    await _ensureAuthorOwnsTest(
      session,
      creatorId: creatorId,
      testId: question.testId,
    );

    final answer = Answer(
      text: normalizedText,
      isCorrect: isCorrect,
      questionId: questionId,
    );

    return await Answer.db.insertRow(session, answer);
  }

  Future<Test?> getTestById(Session session, int id) async {
    final test = await Test.db.findById(
      session,
      id,
      include: Test.include(
        category: Category.include(),
        creator: User.include(),
      ),
    );

    if (test == null) {
      return null;
    }

    final questions = await Question.db.find(
      session,
      where: (q) => q.testId.equals(id),
      orderBy: (q) => q.order,
    );

    final questionsWithAnswers = <Question>[];

    for (final question in questions) {
      final answers = await Answer.db.find(
        session,
        where: (a) => a.questionId.equals(question.id!),
        orderBy: (a) => a.id,
      );

      questionsWithAnswers.add(
        question.copyWith(answer: answers),
      );
    }

    return test.copyWith(question: questionsWithAnswers);
  }

  Future<void> _ensureAuthorOwnsTest(
    Session session, {
    required int creatorId,
    required int testId,
  }) async {
    final creator = await User.db.findById(session, creatorId);

    if (creator == null) {
      throw Exception('Автор не найден.');
    }

    if (creator.role != Role.author) {
      throw Exception('Только author может изменять тесты.');
    }

    final test = await Test.db.findById(session, testId);

    if (test == null) {
      throw Exception('Тест не найден.');
    }

    if (test.creatorId != creatorId) {
      throw Exception('Нельзя изменять чужой тест.');
    }
  }
}
