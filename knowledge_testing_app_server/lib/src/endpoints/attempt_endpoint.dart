import 'package:serverpod/serverpod.dart' hide Result;
import '../generated/protocol.dart';

class AttemptEndpoint extends Endpoint {
  Future<Test?> getTestForPassing(
    Session session, {
    required int testId,
  }) async {
    final test = await Test.db.findById(
      session,
      testId,
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
      where: (q) => q.testId.equals(testId),
      orderBy: (q) => q.order,
    );

    final sanitizedQuestions = <Question>[];

    for (final question in questions) {
      final answers = await Answer.db.find(
        session,
        where: (a) => a.questionId.equals(question.id!),
        orderBy: (a) => a.id,
      );

      final sanitizedAnswers = answers
          .map(
            (answer) => answer.copyWith(
              isCorrect: false,
            ),
          )
          .toList();

      sanitizedQuestions.add(
        question.copyWith(
          answer: sanitizedAnswers,
        ),
      );
    }

    return test.copyWith(
      question: sanitizedQuestions,
    );
  }

  Future<Attempt> startAttempt(
    Session session, {
    required int userId,
    required int testId,
  }) async {
    final user = await User.db.findById(session, userId);
    if (user == null) {
      throw Exception('Пользователь не найден.');
    }

    if (user.role != Role.user) {
      throw Exception('Проходить тесты может только пользователь с ролью user.');
    }

    final test = await Test.db.findById(session, testId);
    if (test == null) {
      throw Exception('Тест не найден.');
    }

    final attempt = Attempt(
      userId: userId,
      testId: testId,
    );

    return await Attempt.db.insertRow(session, attempt);
  }

  Future<Result> submitAttempt(
    Session session, {
    required int attemptId,
    required List<int> answerIds,
  }) async {
    if (answerIds.isEmpty) {
      throw Exception('Список ответов не может быть пустым.');
    }

    final attempt = await Attempt.db.findById(session, attemptId);
    if (attempt == null) {
      throw Exception('Попытка не найдена.');
    }

    final existingResult = await Result.db.findFirstRow(
      session,
      where: (r) => r.attemptId.equals(attemptId),
    );

    if (existingResult != null) {
      throw Exception('Результат для этой попытки уже был рассчитан.');
    }

    final questions = await Question.db.find(
      session,
      where: (q) => q.testId.equals(attempt.testId),
      orderBy: (q) => q.order,
    );

    if (questions.isEmpty) {
      throw Exception('В тесте нет вопросов.');
    }

    if (answerIds.length != questions.length) {
      throw Exception('Нужно выбрать по одному ответу на каждый вопрос.');
    }

    final validQuestionIds = questions.map((q) => q.id!).toSet();
    final usedQuestionIds = <int>{};
    final selectedAnswers = <Answer>[];

    for (final answerId in answerIds) {
      final answer = await Answer.db.findById(session, answerId);

      if (answer == null) {
        throw Exception('Один из выбранных ответов не найден.');
      }

      if (!validQuestionIds.contains(answer.questionId)) {
        throw Exception('Один из ответов не относится к данному тесту.');
      }

      if (!usedQuestionIds.add(answer.questionId)) {
        throw Exception('Для одного вопроса выбрано больше одного ответа.');
      }

      selectedAnswers.add(answer);
    }

    if (usedQuestionIds.length != questions.length) {
      throw Exception('Нужно ответить на все вопросы теста.');
    }

    final result = await session.db.transaction((transaction) async {
      int score = 0;
      final int maxScore = questions.length;

      for (final answer in selectedAnswers) {
        final answerAttempt = AnswerAttempt(
          attemptId: attemptId,
          questionId: answer.questionId,
          answerId: answer.id!,
          isCorrect: answer.isCorrect,
        );

        await AnswerAttempt.db.insertRow(
          session,
          answerAttempt,
          transaction: transaction,
        );

        if (answer.isCorrect) {
          score++;
        }
      }

      final double percentage = maxScore == 0 ? 0 : (score / maxScore) * 100;
      final bool passed = percentage >= 70;

      final insertedResult = await Result.db.insertRow(
        session,
        Result(
          attemptId: attemptId,
          score: score,
          maxScore: maxScore,
          percentage: percentage,
          passed: passed,
        ),
        transaction: transaction,
      );

      if (passed) {
        final existingCertificate = await Certificate.db.findFirstRow(
          session,
          where: (c) => c.attemptId.equals(attemptId),
          transaction: transaction,
        );

        if (existingCertificate == null) {
          await Certificate.db.insertRow(
            session,
            Certificate(
              userId: attempt.userId,
              testId: attempt.testId,
              attemptId: attemptId,
              percentage: percentage,
            ),
            transaction: transaction,
          );
        }
      }

      return insertedResult;
    });

    return result;
  }

  Future<List<Result>> getUserResults(
    Session session, {
    required int userId,
  }) async {
    final attempts = await Attempt.db.find(
      session,
      where: (a) => a.userId.equals(userId),
      orderBy: (a) => a.id,
      orderDescending: true,
    );

    final results = <Result>[];

    for (final attempt in attempts) {
      final result = await Result.db.findFirstRow(
        session,
        where: (r) => r.attemptId.equals(attempt.id!),
        include: Result.include(
          attempt: Attempt.include(
            test: Test.include(),
          ),
        ),
      );

      if (result != null) {
        results.add(result);
      }
    }

    return results;
  }

  Future<List<Certificate>> getUserCertificates(
    Session session, {
    required int userId,
  }) async {
    return await Certificate.db.find(
      session,
      where: (c) => c.userId.equals(userId),
      include: Certificate.include(
        test: Test.include(),
        attempt: Attempt.include(),
      ),
      orderBy: (c) => c.id,
      orderDescending: true,
    );
  }
}
