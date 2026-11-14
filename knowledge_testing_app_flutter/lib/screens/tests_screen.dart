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
  final _searchController = TextEditingController();

  bool _isLoading = true;
  List<Test> _tests = [];
  List<Category> _categories = [];
  int? _selectedCategoryId;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
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

  Future<void> _duplicateTest(Test test) async {
    try {
      await client.test.duplicateTest(
        creatorId: widget.currentUser.id!,
        testId: test.id!,
      );

      await _loadData();
      if (!mounted) return;
      _showMessage('Тест скопирован');
    } catch (e) {
      if (!mounted) return;
      _showMessage(_readableError(e));
    }
  }

  Future<void> _deleteTest(Test test) async {
    final confirmed = await _confirmAction(
      title: 'Удалить тест?',
      message: 'Тест "${test.title}" и все его вопросы будут удалены.',
    );

    if (!confirmed) return;

    try {
      await client.test.deleteTest(
        creatorId: widget.currentUser.id!,
        testId: test.id!,
      );

      await _loadData();
      if (!mounted) return;
      _showMessage('Тест удален');
    } catch (e) {
      if (!mounted) return;
      _showMessage(_readableError(e));
    }
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
    final normalizedSearchQuery = _searchQuery.trim().toLowerCase();
    final visibleTests = normalizedSearchQuery.isEmpty
        ? _tests
        : _tests.where((test) {
            final category = test.category?.name.toLowerCase() ?? '';
            final creator = test.creator?.username.toLowerCase() ?? '';
            final title = test.title.toLowerCase();

            return title.contains(normalizedSearchQuery) ||
                category.contains(normalizedSearchQuery) ||
                creator.contains(normalizedSearchQuery);
          }).toList();

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
                      initialValue: _selectedCategoryId,
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
                    const SizedBox(height: 12),
                    TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        labelText: 'Поиск',
                        border: const OutlineInputBorder(),
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: _searchQuery.isEmpty
                            ? null
                            : IconButton(
                                onPressed: () {
                                  _searchController.clear();
                                  setState(() {
                                    _searchQuery = '';
                                  });
                                },
                                icon: const Icon(Icons.close),
                                tooltip: 'Очистить поиск',
                              ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _searchQuery = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            if (_isLoading)
              const Center(child: CircularProgressIndicator())
            else if (visibleTests.isEmpty)
              const Card(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('Тесты не найдены.'),
                ),
              )
            else
              ...visibleTests.map(
                (test) => Card(
                  child: ListTile(
                    leading: const Icon(Icons.quiz_outlined),
                    title: Text(test.title),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (test.category != null)
                          Text('Категория: ${test.category!.name}'),
                        if (test.creator != null)
                          Text('Автор: ${test.creator!.username}'),
                      ],
                    ),
                    trailing: isAuthor
                        ? PopupMenuButton<String>(
                            icon: const Icon(Icons.more_vert),
                            onSelected: (value) {
                              switch (value) {
                                case 'edit':
                                  _openTestEditor(test);
                                case 'duplicate':
                                  _duplicateTest(test);
                                case 'delete':
                                  _deleteTest(test);
                              }
                            },
                            itemBuilder: (context) => const [
                              PopupMenuItem(
                                value: 'edit',
                                child: ListTile(
                                  leading: Icon(Icons.edit_outlined),
                                  title: Text('Редактировать'),
                                  contentPadding: EdgeInsets.zero,
                                ),
                              ),
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
                          )
                        : const Icon(Icons.play_arrow_outlined),
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
