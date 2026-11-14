import 'package:flutter/material.dart';
import 'package:knowledge_testing_app_client/knowledge_testing_app_client.dart';

import '../main.dart';
import '../quiz_rules.dart';

class TestEditorScreen extends StatefulWidget {
  final User currentUser;
  final int testId;

  const TestEditorScreen({
    super.key,
    required this.currentUser,
    required this.testId,
  });

  @override
  State<TestEditorScreen> createState() => _TestEditorScreenState();
}

class _TestEditorScreenState extends State<TestEditorScreen> {
  bool _isLoading = true;
  Test? _test;

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
      final test = await client.test.getTestById(widget.testId);

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

  Future<bool> _confirmAction({
    required String title,
    required String message,
    String confirmText = 'Удалить',
  }) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Отмена'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(confirmText),
          ),
        ],
      ),
    );

    return confirmed ?? false;
  }

  Future<void> _addQuestion() async {
    final controller = TextEditingController();

    final text = await showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Добавить вопрос'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(
              labelText: 'Текст вопроса',
              border: OutlineInputBorder(),
            ),
            maxLines: 3,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Отмена'),
            ),
            ElevatedButton(
              onPressed: () =>
                  Navigator.of(context).pop(controller.text.trim()),
              child: const Text('Сохранить'),
            ),
          ],
        );
      },
    );

    if (text == null || text.isEmpty) return;

    try {
      await client.test.addQuestion(
        creatorId: widget.currentUser.id!,
        testId: widget.testId,
        text: text,
      );

      await _loadTest();
      if (!mounted) return;
      _showMessage('Вопрос добавлен');
    } catch (e) {
      if (!mounted) return;
      _showMessage(_readableError(e));
    }
  }

  Future<void> _addAnswer(Question question) async {
    final textController = TextEditingController();
    bool isCorrect = false;
    final hasCorrectAnswer = (question.answer ?? []).any(
      (answer) => answer.isCorrect,
    );

    final result = await showDialog<Map<String, dynamic>?>(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setLocalState) {
            return AlertDialog(
              title: Text('Добавить ответ к вопросу #${question.order}'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: textController,
                    decoration: const InputDecoration(
                      labelText: 'Текст ответа',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 2,
                  ),
                  const SizedBox(height: 12),
                  CheckboxListTile(
                    value: isCorrect,
                    onChanged: (value) {
                      setLocalState(() {
                        isCorrect = value ?? false;
                      });
                    },
                    title: const Text('Правильный ответ'),
                    contentPadding: EdgeInsets.zero,
                  ),
                  if (hasCorrectAnswer)
                    const Text(
                      'Если отметить новый ответ правильным, он заменит текущий правильный ответ.',
                    ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Отмена'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop({
                      'text': textController.text.trim(),
                      'isCorrect': isCorrect,
                    });
                  },
                  child: const Text('Сохранить'),
                ),
              ],
            );
          },
        );
      },
    );

    if (result == null) return;

    final text = (result['text'] as String?)?.trim() ?? '';
    final isCorrectValue = result['isCorrect'] as bool? ?? false;

    if (text.isEmpty) return;

    try {
      await client.test.addAnswer(
        creatorId: widget.currentUser.id!,
        questionId: question.id!,
        text: text,
        isCorrect: isCorrectValue,
      );

      await _loadTest();
      if (!mounted) return;
      _showMessage('Ответ добавлен');
    } catch (e) {
      if (!mounted) return;
      _showMessage(_readableError(e));
    }
  }

  Future<void> _duplicateQuestion(Question question) async {
    try {
      await client.test.duplicateQuestion(
        creatorId: widget.currentUser.id!,
        questionId: question.id!,
      );

      await _loadTest();
      if (!mounted) return;
      _showMessage('Вопрос скопирован');
    } catch (e) {
      if (!mounted) return;
      _showMessage(_readableError(e));
    }
  }

  Future<void> _deleteQuestion(Question question) async {
    final confirmed = await _confirmAction(
      title: 'Удалить вопрос?',
      message:
          'Вопрос #${question.order} и все его варианты ответа будут удалены.',
    );

    if (!confirmed) return;

    try {
      await client.test.deleteQuestion(
        creatorId: widget.currentUser.id!,
        questionId: question.id!,
      );

      await _loadTest();
      if (!mounted) return;
      _showMessage('Вопрос удален');
    } catch (e) {
      if (!mounted) return;
      _showMessage(_readableError(e));
    }
  }

  Future<void> _deleteAnswer(Answer answer) async {
    final confirmed = await _confirmAction(
      title: 'Удалить вариант ответа?',
      message: 'Вариант "${answer.text}" будет удален.',
    );

    if (!confirmed) return;

    try {
      await client.test.deleteAnswer(
        creatorId: widget.currentUser.id!,
        answerId: answer.id!,
      );

      await _loadTest();
      if (!mounted) return;
      _showMessage('Ответ удален');
    } catch (e) {
      if (!mounted) return;
      _showMessage(_readableError(e));
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.currentUser.role != Role.author) {
      return Scaffold(
        appBar: AppBar(title: const Text('Редактирование теста')),
        body: const Center(
          child: Text('Доступно только для автора тестов'),
        ),
      );
    }

    final test = _test;
    final questions = test?.question ?? [];
    final readyQuestions = questions.where((question) {
      final answers = question.answer ?? [];
      return answers.isNotEmpty &&
          answers.where((answer) => answer.isCorrect).length == 1;
    }).length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Редактирование теста'),
        actions: [
          IconButton(
            onPressed: _loadTest,
            icon: const Icon(Icons.refresh),
            tooltip: 'Обновить',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _addQuestion,
        icon: const Icon(Icons.add),
        label: const Text('Добавить вопрос'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : test == null
          ? const Center(child: Text('Тест не найден'))
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          test.title,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 8),
                        if (test.category != null)
                          Text('Категория: ${test.category!.name}'),
                        if (test.creator != null)
                          Text('Автор: ${test.creator!.username}'),
                        const SizedBox(height: 8),
                        Text(QuizRules.summaryFor(questions.length)),
                        const SizedBox(height: 8),
                        Text(
                          'Готово к прохождению: $readyQuestions из ${questions.length} вопросов с одним правильным ответом.',
                        ),
                        if (questions.length !=
                            QuizRules.recommendedQuestionCount)
                          Text(
                            'Рекомендуемый объем: ${QuizRules.recommendedQuestionCount} вопросов.',
                          ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                if (questions.isEmpty)
                  const Card(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Text('Пока нет вопросов. Добавь первый вопрос.'),
                    ),
                  )
                else
                  ...questions.map((question) {
                    final answers = question.answer ?? [];

                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  child: Text('${question.order}'),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    question.text,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                PopupMenuButton<String>(
                                  icon: const Icon(Icons.more_vert),
                                  onSelected: (value) {
                                    switch (value) {
                                      case 'duplicate':
                                        _duplicateQuestion(question);
                                      case 'delete':
                                        _deleteQuestion(question);
                                    }
                                  },
                                  itemBuilder: (context) => const [
                                    PopupMenuItem(
                                      value: 'duplicate',
                                      child: ListTile(
                                        leading: Icon(Icons.copy_outlined),
                                        title: Text('Дублировать'),
                                        contentPadding: EdgeInsets.zero,
                                      ),
                                    ),
                                    PopupMenuItem(
                                      value: 'delete',
                                      child: ListTile(
                                        leading: Icon(Icons.delete_outline),
                                        title: Text('Удалить'),
                                        contentPadding: EdgeInsets.zero,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            if (answers.isEmpty)
                              const Padding(
                                padding: EdgeInsets.only(bottom: 8),
                                child: Text('Ответы еще не добавлены'),
                              )
                            else
                              ...answers.map(
                                (answer) => ListTile(
                                  dense: true,
                                  contentPadding: EdgeInsets.zero,
                                  leading: Icon(
                                    answer.isCorrect
                                        ? Icons.check_circle
                                        : Icons.radio_button_unchecked,
                                  ),
                                  title: Text(answer.text),
                                  subtitle: Text(
                                    answer.isCorrect
                                        ? 'Правильный ответ'
                                        : 'Неправильный ответ',
                                  ),
                                  trailing: IconButton(
                                    onPressed: () => _deleteAnswer(answer),
                                    icon: const Icon(Icons.delete_outline),
                                    tooltip: 'Удалить ответ',
                                  ),
                                ),
                              ),
                            const SizedBox(height: 8),
                            Align(
                              alignment: Alignment.centerRight,
                              child: OutlinedButton.icon(
                                onPressed: () => _addAnswer(question),
                                icon: const Icon(Icons.add),
                                label: const Text('Добавить ответ'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                const SizedBox(height: 80),
              ],
            ),
    );
  }
}
