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
      throw Exception(
        'Создавать тесты может только пользователь с ролью author.',
      );
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

  Future<Test> duplicateTest(
    Session session, {
    required int creatorId,
    required int testId,
  }) async {
    final sourceTest = await Test.db.findById(session, testId);

    if (sourceTest == null) {
      throw Exception('Тест не найден.');
    }

    await _ensureAuthorOwnsTest(
      session,
      creatorId: creatorId,
      testId: testId,
    );

    return await session.db.transaction((transaction) async {
      final copiedTest = await Test.db.insertRow(
        session,
        Test(
          title: '${sourceTest.title} (копия)',
          creatorId: creatorId,
          categoryId: sourceTest.categoryId,
        ),
        transaction: transaction,
      );

      final questions = await Question.db.find(
        session,
        where: (q) => q.testId.equals(testId),
        orderBy: (q) => q.order,
        transaction: transaction,
      );

      for (final question in questions) {
        final copiedQuestion = await Question.db.insertRow(
          session,
          Question(
            text: question.text,
            order: question.order,
            testId: copiedTest.id!,
          ),
          transaction: transaction,
        );

        final answers = await Answer.db.find(
          session,
          where: (a) => a.questionId.equals(question.id!),
          orderBy: (a) => a.id,
          transaction: transaction,
        );

        for (final answer in answers) {
          await Answer.db.insertRow(
            session,
            Answer(
              text: answer.text,
              isCorrect: answer.isCorrect,
              questionId: copiedQuestion.id!,
            ),
            transaction: transaction,
          );
        }
      }

      return copiedTest;
    });
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

    final nextOrder = existingQuestions.isEmpty
        ? 1
        : existingQuestions.first.order + 1;

    final question = Question(
      text: normalizedText,
      order: nextOrder,
      testId: testId,
    );

    return await Question.db.insertRow(session, question);
  }

  Future<Question> duplicateQuestion(
    Session session, {
    required int creatorId,
    required int questionId,
  }) async {
    final question = await Question.db.findById(session, questionId);

    if (question == null) {
      throw Exception('Вопрос не найден.');
    }

    await _ensureAuthorOwnsTest(
      session,
      creatorId: creatorId,
      testId: question.testId,
    );

    return await session.db.transaction((transaction) async {
      final existingQuestions = await Question.db.find(
        session,
        where: (q) => q.testId.equals(question.testId),
        orderBy: (q) => q.order,
        orderDescending: true,
        limit: 1,
        transaction: transaction,
      );

      final nextOrder = existingQuestions.isEmpty
          ? 1
          : existingQuestions.first.order + 1;

      final copiedQuestion = await Question.db.insertRow(
        session,
        Question(
          text: '${question.text} (копия)',
          order: nextOrder,
          testId: question.testId,
        ),
        transaction: transaction,
      );

      final answers = await Answer.db.find(
        session,
        where: (a) => a.questionId.equals(questionId),
        orderBy: (a) => a.id,
        transaction: transaction,
      );

      for (final answer in answers) {
        await Answer.db.insertRow(
          session,
          Answer(
            text: answer.text,
            isCorrect: answer.isCorrect,
            questionId: copiedQuestion.id!,
          ),
          transaction: transaction,
        );
      }

      return copiedQuestion;
    });
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

    return await session.db.transaction((transaction) async {
      if (isCorrect) {
        await Answer.db.updateWhere(
          session,
          columnValues: (a) => [
            a.isCorrect(false),
          ],
          where: (a) => a.questionId.equals(questionId),
          transaction: transaction,
        );
      }

      final answer = Answer(
        text: normalizedText,
        isCorrect: isCorrect,
        questionId: questionId,
      );

      return await Answer.db.insertRow(
        session,
        answer,
        transaction: transaction,
      );
    });
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

  Future<void> deleteAnswer(
    Session session, {
    required int creatorId,
    required int answerId,
  }) async {
    final answer = await Answer.db.findById(session, answerId);

    if (answer == null) {
      throw Exception('Ответ не найден.');
    }

    final question = await Question.db.findById(session, answer.questionId);

    if (question == null) {
      throw Exception('Вопрос не найден.');
    }

    await _ensureAuthorOwnsTest(
      session,
      creatorId: creatorId,
      testId: question.testId,
    );

    final answerAttemptsCount = await AnswerAttempt.db.count(
      session,
      where: (a) => a.answerId.equals(answerId),
    );

    if (answerAttemptsCount > 0) {
      throw Exception(
        'Ответ уже использовался в попытках. Его нельзя удалить без потери истории результатов.',
      );
    }

    await Answer.db.deleteRow(session, answer);
  }

  Future<void> deleteQuestion(
    Session session, {
    required int creatorId,
    required int questionId,
  }) async {
    final question = await Question.db.findById(session, questionId);

    if (question == null) {
      throw Exception('Вопрос не найден.');
    }

    await _ensureAuthorOwnsTest(
      session,
      creatorId: creatorId,
      testId: question.testId,
    );

    final answerAttemptsCount = await AnswerAttempt.db.count(
      session,
      where: (a) => a.questionId.equals(questionId),
    );

    if (answerAttemptsCount > 0) {
      throw Exception(
        'Вопрос уже использовался в попытках. Его нельзя удалить без потери истории результатов.',
      );
    }

    await session.db.transaction((transaction) async {
      await Answer.db.deleteWhere(
        session,
        where: (a) => a.questionId.equals(questionId),
        transaction: transaction,
      );

      await Question.db.deleteRow(
        session,
        question,
        transaction: transaction,
      );

      await _renumberQuestions(
        session,
        testId: question.testId,
        transaction: transaction,
      );
    });
  }

  Future<void> deleteTest(
    Session session, {
    required int creatorId,
    required int testId,
  }) async {
    final test = await Test.db.findById(session, testId);

    if (test == null) {
      throw Exception('Тест не найден.');
    }

    await _ensureAuthorOwnsTest(
      session,
      creatorId: creatorId,
      testId: testId,
    );

    final attemptsCount = await Attempt.db.count(
      session,
      where: (a) => a.testId.equals(testId),
    );

    if (attemptsCount > 0) {
      throw Exception(
        'Тест уже проходили пользователи. Его нельзя удалить без потери истории результатов.',
      );
    }

    await session.db.transaction((transaction) async {
      final questions = await Question.db.find(
        session,
        where: (q) => q.testId.equals(testId),
        transaction: transaction,
      );

      for (final question in questions) {
        await Answer.db.deleteWhere(
          session,
          where: (a) => a.questionId.equals(question.id!),
          transaction: transaction,
        );
      }

      await Question.db.deleteWhere(
        session,
        where: (q) => q.testId.equals(testId),
        transaction: transaction,
      );

      await TestTag.db.deleteWhere(
        session,
        where: (t) => t.testId.equals(testId),
        transaction: transaction,
      );

      await Test.db.deleteRow(
        session,
        test,
        transaction: transaction,
      );
    });
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

  Future<void> _renumberQuestions(
    Session session, {
    required int testId,
    required Transaction transaction,
  }) async {
    final questions = await Question.db.find(
      session,
      where: (q) => q.testId.equals(testId),
      orderBy: (q) => q.order,
      transaction: transaction,
    );

    for (var index = 0; index < questions.length; index++) {
      final nextOrder = index + 1;
      final question = questions[index];

      if (question.order == nextOrder) continue;

      await Question.db.updateRow(
        session,
        question.copyWith(order: nextOrder),
        columns: (q) => [q.order],
        transaction: transaction,
      );
    }
  }
}
