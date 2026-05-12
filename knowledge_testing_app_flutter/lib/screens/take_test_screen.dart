import 'package:flutter/material.dart';
import 'package:knowledge_testing_app_client/knowledge_testing_app_client.dart';

import '../main.dart';
import 'test_result_screen.dart';

class TakeTestScreen extends StatefulWidget {
  final User currentUser;
  final int testId;

  const TakeTestScreen({
    super.key,
    required this.currentUser,
    required this.testId,
  });

  @override
  State<TakeTestScreen> createState() => _TakeTestScreenState();
}

class _TakeTestScreenState extends State<TakeTestScreen> {
  bool _isLoading = true;
  bool _isStarting = false;
  bool _isSubmitting = false;

  Test? _test;
  Attempt? _attempt;
  int _currentQuestionIndex = 0;
  final Map<int, int> _selectedAnswers = {};

  @override
  void initState() {
    super.initState();
    _loadTest();
  }

  Future<void> _loadTest() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final test = await client.attempt.getTestForPassing(
        testId: widget.testId,
      );

      if (!mounted) return;

      setState(() {
        _test = test;
      });
    } catch (e) {
      if (!mounted) return;
      _showMessage(_readableError(e));
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
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

  void _showMessage(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text)),
    );
  }

  Future<void> _startAttempt() async {
    if (_attempt != null) return;

    setState(() {
      _isStarting = true;
    });

    try {
      final attempt = await client.attempt.startAttempt(
        userId: widget.currentUser.id!,
        testId: widget.testId,
      );

      if (!mounted) return;

      setState(() {
        _attempt = attempt;
      });

      _showMessage('Тест начат');
    } catch (e) {
      if (!mounted) return;
      _showMessage(_readableError(e));
    } finally {
      if (mounted) {
        setState(() {
          _isStarting = false;
        });
      }
    }
  }

  Future<void> _submit() async {
    if (_attempt == null) {
      _showMessage('Сначала начни тест');
      return;
    }

    final test = _test;
    if (test == null || test.question == null || test.question!.isEmpty) {
      _showMessage('Тест пустой');
      return;
    }

    if (_selectedAnswers.length != test.question!.length) {
      _showMessage('Нужно ответить на все вопросы');
      return;
    }

    setState(() {
      _isSubmitting = true;
    });

    try {
      final answerIds = test.question!.map((question) => _selectedAnswers[question.id!]).whereType<int>().toList();

      final result = await client.attempt.submitAttempt(
        attemptId: _attempt!.id!,
        answerIds: answerIds,
      );

      if (!mounted) return;

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => TestResultScreen(
            currentUser: widget.currentUser,
            result: result,
          ),
        ),
      );
    } catch (e) {
      if (!mounted) return;
      _showMessage(_readableError(e));
    } finally {
      if (mounted) {
        setState(() {
          _isSubmitting = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final test = _test;
    final questions = test?.question ?? [];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Прохождение теста'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : test == null
          ? const Center(child: Text('Тест не найден'))
          : questions.isEmpty
          ? const Center(child: Text('В тесте пока нет вопросов'))
          : Padding(
              padding: const EdgeInsets.all(16),
              child: _attempt == null
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  test.title,
                                  style: Theme.of(context).textTheme.headlineSmall,
                                ),
                                const SizedBox(height: 8),
                                if (test.category != null) Text('Категория: ${test.category!.name}'),
                                if (test.creator != null) Text('Автор: ${test.creator!.username}'),
                                const SizedBox(height: 8),
                                Text('Количество вопросов: ${questions.length}'),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        ElevatedButton(
                          onPressed: _isStarting ? null : _startAttempt,
                          child: const Text('Начать тест'),
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        LinearProgressIndicator(
                          value: (_currentQuestionIndex + 1) / questions.length,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Вопрос ${_currentQuestionIndex + 1} из ${questions.length}',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 16),
                        Expanded(
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Builder(
                                builder: (context) {
                                  final question = questions[_currentQuestionIndex];
                                  final answers = question.answer ?? [];

                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        question.text,
                                        style: Theme.of(context).textTheme.titleLarge,
                                      ),
                                      const SizedBox(height: 20),
                                      ...answers.map(
                                        (answer) => RadioListTile<int>(
                                          value: answer.id!,
                                          groupValue: _selectedAnswers[question.id!],
                                          onChanged: (value) {
                                            if (value == null) return;
                                            setState(() {
                                              _selectedAnswers[question.id!] = value;
                                            });
                                          },
                                          title: Text(answer.text),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: _currentQuestionIndex == 0
                                    ? null
                                    : () {
                                        setState(() {
                                          _currentQuestionIndex--;
                                        });
                                      },
                                child: const Text('Назад'),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: _currentQuestionIndex == questions.length - 1
                                  ? ElevatedButton(
                                      onPressed: _isSubmitting ? null : _submit,
                                      child: const Text('Завершить'),
                                    )
                                  : ElevatedButton(
                                      onPressed: () {
                                        final question = questions[_currentQuestionIndex];
                                        if (_selectedAnswers[question.id!] == null) {
                                          _showMessage('Выбери ответ перед переходом дальше');
                                          return;
                                        }

                                        setState(() {
                                          _currentQuestionIndex++;
                                        });
                                      },
                                      child: const Text('Далее'),
                                    ),
                            ),
                          ],
                        ),
                      ],
                    ),
            ),
    );
  }
}
