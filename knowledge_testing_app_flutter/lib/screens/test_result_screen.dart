import 'package:flutter/material.dart';
import 'package:knowledge_testing_app_client/knowledge_testing_app_client.dart';

import '../main.dart';
import '../quiz_rules.dart';
import 'certificates_screen.dart';

class TestResultScreen extends StatefulWidget {
  final User currentUser;
  final Result result;

  const TestResultScreen({
    super.key,
    required this.currentUser,
    required this.result,
  });

  @override
  State<TestResultScreen> createState() => _TestResultScreenState();
}

class _TestResultScreenState extends State<TestResultScreen> {
  bool _isLoadingReview = true;
  Test? _reviewTest;
  String? _reviewError;

  @override
  void initState() {
    super.initState();
    _loadReview();
  }

  Future<void> _loadReview() async {
    setState(() {
      _isLoadingReview = true;
      _reviewError = null;
    });

    try {
      final reviewTest = await client.attempt.getAttemptReview(
        userId: widget.currentUser.id!,
        attemptId: widget.result.attemptId,
      );

      if (!mounted) return;

      setState(() {
        _reviewTest = reviewTest;
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        _reviewError = _readableError(e);
      });
    } finally {
      if (mounted) {
        setState(() {
          _isLoadingReview = false;
        });
      }
    }
  }

  String _readableError(Object error) {
    final text = error.toString();
    if (text.startsWith('Exception: ')) {
      return text.replaceFirst('Exception: ', '');
    }
    return text;
  }

  @override
  Widget build(BuildContext context) {
    final result = widget.result;
    final percentage = result.percentage.toStringAsFixed(1);
    final band = QuizRules.bandFor(
      score: result.score,
      maxScore: result.maxScore,
    );
    final icon = switch (band.iconName) {
      ScoreIconName.trophy => Icons.emoji_events,
      ScoreIconName.verified => Icons.verified,
      ScoreIconName.refresh => Icons.refresh,
      ScoreIconName.info => Icons.info_outline,
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Результат тестирования'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Icon(
                    icon,
                    size: 72,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    band.title,
                    style: Theme.of(context).textTheme.headlineSmall,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    band.description,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ListTile(
                    leading: const Icon(Icons.score),
                    title: const Text('Набрано баллов'),
                    trailing: Text('${result.score} / ${result.maxScore}'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.percent),
                    title: const Text('Процент правильных ответов'),
                    trailing: Text('$percentage%'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.verified),
                    title: const Text('Проходной балл'),
                    trailing: Text(
                      '${QuizRules.passingScore(result.maxScore)} / ${result.maxScore}',
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.trending_up),
                    title: const Text('Хороший результат'),
                    trailing: Text(
                      '${QuizRules.goodScore(result.maxScore)} / ${result.maxScore}',
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.menu_book_outlined),
                    title: const Text('Повторить тему'),
                    trailing: Text(
                      'меньше ${QuizRules.repeatTopicScore(result.maxScore)} / ${result.maxScore}',
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.workspace_premium),
                    title: const Text('Сертификат'),
                    trailing: Text(band.certificateStatus),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          if (result.passed)
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) =>
                        CertificatesScreen(currentUser: widget.currentUser),
                  ),
                );
              },
              icon: const Icon(Icons.workspace_premium),
              label: const Text('Перейти к сертификатам'),
            ),
          const SizedBox(height: 16),
          Text(
            'Разбор ответов',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          if (_isLoadingReview)
            const Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Center(child: CircularProgressIndicator()),
              ),
            )
          else if (_reviewError != null)
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(_reviewError!),
                    const SizedBox(height: 12),
                    OutlinedButton.icon(
                      onPressed: _loadReview,
                      icon: const Icon(Icons.refresh),
                      label: const Text('Повторить загрузку'),
                    ),
                  ],
                ),
              ),
            )
          else
            ..._buildReviewQuestions(context),
        ],
      ),
    );
  }

  List<Widget> _buildReviewQuestions(BuildContext context) {
    final questions = _reviewTest?.question ?? [];

    if (questions.isEmpty) {
      return [
        const Card(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Text('Разбор для этой попытки не найден.'),
          ),
        ),
      ];
    }

    return questions.map((question) {
      final selectedAttempt = (question.answerAttempt ?? []).isEmpty
          ? null
          : question.answerAttempt!.first;
      final isCorrect = selectedAttempt?.isCorrect ?? false;

      return Card(
        child: ExpansionTile(
          leading: Icon(
            isCorrect ? Icons.check_circle : Icons.cancel_outlined,
            color: isCorrect ? Colors.green : Colors.red,
          ),
          title: Text('Вопрос ${question.order}'),
          subtitle: Text(
            isCorrect ? 'Правильно' : 'Неправильно',
          ),
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                question.text,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const SizedBox(height: 12),
            ..._buildAnswerRows(
              answers: question.answer ?? [],
              selectedAnswerId: selectedAttempt?.answerId,
            ),
          ],
        ),
      );
    }).toList();
  }

  List<Widget> _buildAnswerRows({
    required List<Answer> answers,
    required int? selectedAnswerId,
  }) {
    return answers.map((answer) {
      final isSelected = answer.id == selectedAnswerId;
      final isCorrectAnswer = answer.isCorrect;
      final icon = isCorrectAnswer
          ? Icons.check_circle
          : isSelected
          ? Icons.cancel_outlined
          : Icons.radio_button_unchecked;
      final color = isCorrectAnswer
          ? Colors.green
          : isSelected
          ? Colors.red
          : null;
      final labels = [
        if (isSelected) 'твой ответ',
        if (isCorrectAnswer) 'правильный ответ',
      ];

      return ListTile(
        dense: true,
        contentPadding: EdgeInsets.zero,
        leading: Icon(icon, color: color),
        title: Text(answer.text),
        subtitle: labels.isEmpty ? null : Text(labels.join(' · ')),
      );
    }).toList();
  }
}
