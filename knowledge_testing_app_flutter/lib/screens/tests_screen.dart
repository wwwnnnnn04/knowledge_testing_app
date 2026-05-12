import 'package:flutter/material.dart';
import 'package:knowledge_testing_app_client/knowledge_testing_app_client.dart';

import '../main.dart';
import 'auth_screen.dart';
import 'certificates_screen.dart';
import 'create_test_screen.dart';
import 'take_test_screen.dart';
import 'test_editor_screen.dart';

class TestsScreen extends StatefulWidget {
  final User currentUser;

  const TestsScreen({
    super.key,
    required this.currentUser,
  });

  @override
  State<TestsScreen> createState() => _TestsScreenState();
}

class _TestsScreenState extends State<TestsScreen> {
  bool _isLoading = true;
  List<Test> _tests = [];
  List<Category> _categories = [];
  int? _selectedCategoryId;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final categories = await client.test.getCategories();
      final tests = await client.test.getTests(
        categoryId: _selectedCategoryId,
      );

      if (!mounted) return;

      setState(() {
        _categories = categories;
        _tests = tests;
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

  Future<void> _openCreateTestScreen() async {
    final created = await Navigator.of(context).push<bool>(
      MaterialPageRoute(
        builder: (_) => CreateTestScreen(currentUser: widget.currentUser),
      ),
    );

    if (created == true) {
      await _loadData();
    }
  }

  Future<void> _openTestEditor(Test test) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => TestEditorScreen(
          currentUser: widget.currentUser,
          testId: test.id!,
        ),
      ),
    );

    await _loadData();
  }

  Future<void> _openTakeTest(Test test) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => TakeTestScreen(
          currentUser: widget.currentUser,
          testId: test.id!,
        ),
      ),
    );

    await _loadData();
  }

  void _openCertificates() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => CertificatesScreen(
          currentUser: widget.currentUser,
        ),
      ),
    );
  }

  void _logout() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const AuthScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isAuthor = widget.currentUser.role == Role.author;
    final isUser = widget.currentUser.role == Role.user;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Список тестов'),
        actions: [
          if (isUser)
            IconButton(
              onPressed: _openCertificates,
              icon: const Icon(Icons.workspace_premium),
              tooltip: 'Сертификаты',
            ),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Center(
              child: Text(
                widget.currentUser.username,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
          ),
          IconButton(
            onPressed: _logout,
            icon: const Icon(Icons.logout),
            tooltip: 'Выйти',
          ),
        ],
      ),
      floatingActionButton: isAuthor
          ? FloatingActionButton.extended(
              onPressed: _openCreateTestScreen,
              icon: const Icon(Icons.add),
              label: const Text('Создать тест'),
            )
          : null,
      body: RefreshIndicator(
        onRefresh: _loadData,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Пользователь: ${widget.currentUser.username}',
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Роль: ${isAuthor ? 'Автор тестов' : 'Обычный пользователь'}',
                    ),
                    const SizedBox(height: 12),
                    DropdownButtonFormField<int?>(
                      value: _selectedCategoryId,
                      decoration: const InputDecoration(
                        labelText: 'Фильтр по категории',
                        border: OutlineInputBorder(),
                      ),
                      items: [
                        const DropdownMenuItem<int?>(
                          value: null,
                          child: Text('Все категории'),
                        ),
                        ..._categories.map(
                          (category) => DropdownMenuItem<int?>(
                            value: category.id,
                            child: Text(category.name),
                          ),
                        ),
                      ],
                      onChanged: (value) async {
                        setState(() {
                          _selectedCategoryId = value;
                        });
                        await _loadData();
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            if (_isLoading)
              const Center(child: CircularProgressIndicator())
            else if (_tests.isEmpty)
              const Card(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('Тесты не найдены.'),
                ),
              )
            else
              ..._tests.map(
                (test) => Card(
                  child: ListTile(
                    leading: const Icon(Icons.quiz_outlined),
                    title: Text(test.title),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (test.category != null) Text('Категория: ${test.category!.name}'),
                        if (test.creator != null) Text('Автор: ${test.creator!.username}'),
                      ],
                    ),
                    trailing: isAuthor ? const Icon(Icons.edit_outlined) : const Icon(Icons.play_arrow_outlined),
                    onTap: () {
                      if (isAuthor) {
                        _openTestEditor(test);
                      } else {
                        _openTakeTest(test);
                      }
                    },
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
