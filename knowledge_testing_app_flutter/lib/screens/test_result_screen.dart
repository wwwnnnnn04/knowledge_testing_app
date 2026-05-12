import 'package:flutter/material.dart';
import 'package:knowledge_testing_app_client/knowledge_testing_app_client.dart';

import 'certificates_screen.dart';

class TestResultScreen extends StatelessWidget {
  final User currentUser;
  final Result result;

  const TestResultScreen({
    super.key,
    required this.currentUser,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    final percentage = result.percentage.toStringAsFixed(1);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Результат тестирования'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Icon(
                      result.passed ? Icons.emoji_events : Icons.info_outline,
                      size: 72,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      result.passed ? 'Тест пройден успешно' : 'Тест не пройден',
                      style: Theme.of(context).textTheme.headlineSmall,
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
                      title: const Text('Статус'),
                      trailing: Text(result.passed ? 'Успешно' : 'Неуспешно'),
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
                      builder: (_) => CertificatesScreen(currentUser: currentUser),
                    ),
                  );
                },
                icon: const Icon(Icons.workspace_premium),
                label: const Text('Перейти к сертификатам'),
              ),
          ],
        ),
      ),
    );
  }
}
