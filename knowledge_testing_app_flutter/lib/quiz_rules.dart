class QuizRules {
  const QuizRules._();

  static const recommendedQuestionCount = 25;

  static int passingScore(int questionCount) {
    return (questionCount * 0.8).ceil();
  }

  static int goodScore(int questionCount) {
    return (questionCount * 0.88).ceil();
  }

  static int repeatTopicScore(int questionCount) {
    return (questionCount * 0.72).ceil();
  }

  static ScoreBand bandFor({
    required int score,
    required int maxScore,
  }) {
    if (score >= goodScore(maxScore)) {
      return const ScoreBand(
        title: 'Хороший результат',
        description: 'Тема усвоена уверенно',
        certificateStatus: 'Сертификат доступен',
        iconName: ScoreIconName.trophy,
      );
    }

    if (score >= passingScore(maxScore)) {
      return const ScoreBand(
        title: 'Тест пройден',
        description: 'Проходной балл набран',
        certificateStatus: 'Сертификат доступен',
        iconName: ScoreIconName.verified,
      );
    }

    if (score < repeatTopicScore(maxScore)) {
      return const ScoreBand(
        title: 'Нужно повторить тему',
        description: 'Вернись к материалу и попробуй еще раз',
        certificateStatus: 'Сертификат пока недоступен',
        iconName: ScoreIconName.refresh,
      );
    }

    return const ScoreBand(
      title: 'Почти получилось',
      description: 'До проходного балла осталось немного',
      certificateStatus: 'Сертификат пока недоступен',
      iconName: ScoreIconName.info,
    );
  }

  static String summaryFor(int questionCount) {
    return 'Вопросов: $questionCount. Один правильный ответ. '
        'Проходной балл: ${passingScore(questionCount)}/$questionCount. '
        'Хороший результат: ${goodScore(questionCount)}/$questionCount и выше. '
        'Повторить тему: меньше ${repeatTopicScore(questionCount)}/$questionCount.';
  }
}

class ScoreBand {
  final String title;
  final String description;
  final String certificateStatus;
  final ScoreIconName iconName;

  const ScoreBand({
    required this.title,
    required this.description,
    required this.certificateStatus,
    required this.iconName,
  });
}

enum ScoreIconName {
  trophy,
  verified,
  refresh,
  info,
}
