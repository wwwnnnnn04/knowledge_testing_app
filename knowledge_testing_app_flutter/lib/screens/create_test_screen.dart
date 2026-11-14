import 'package:flutter/material.dart';
import 'package:knowledge_testing_app_client/knowledge_testing_app_client.dart';

import '../main.dart';

class CreateTestScreen extends StatefulWidget {
  final User currentUser;

  const CreateTestScreen({
    super.key,
    required this.currentUser,
  });

  @override
  State<CreateTestScreen> createState() => _CreateTestScreenState();
}

class _CreateTestScreenState extends State<CreateTestScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _newCategoryController = TextEditingController();

  bool _isLoading = true;
  bool _isSaving = false;

  List<Category> _categories = [];
  int? _selectedCategoryId;

  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _newCategoryController.dispose();
    super.dispose();
  }

  Future<void> _loadCategories() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final categories = await client.test.getCategories();

      if (!mounted) return;

      setState(() {
        _categories = categories;
        if (categories.isNotEmpty) {
          _selectedCategoryId = categories.first.id;
        }
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

  Future<void> _createCategory() async {
    final name = _newCategoryController.text.trim();

    if (name.isEmpty) {
      _showMessage('Введите название категории');
      return;
    }

    try {
      final category = await client.test.createCategory(name: name);

      if (!mounted) return;

      _newCategoryController.clear();
      await _loadCategories();

      setState(() {
        _selectedCategoryId = category.id;
      });

      _showMessage('Категория сохранена');
    } catch (e) {
      if (!mounted) return;
      _showMessage(_readableError(e));
    }
  }

  Future<void> _saveTest() async {
    if (!_formKey.currentState!.validate()) return;

    if (_selectedCategoryId == null) {
      _showMessage('Сначала выберите или создайте категорию');
      return;
    }

    setState(() {
      _isSaving = true;
    });

    try {
      await client.test.createTest(
        title: _titleController.text.trim(),
        creatorId: widget.currentUser.id!,
        categoryId: _selectedCategoryId!,
      );

      if (!mounted) return;

      _showMessage('Тест успешно создан');
      Navigator.of(context).pop(true);
    } catch (e) {
      if (!mounted) return;
      _showMessage(_readableError(e));
    } finally {
      if (mounted) {
        setState(() {
          _isSaving = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.currentUser.role != Role.author) {
      return Scaffold(
        appBar: AppBar(title: const Text('Создание теста')),
        body: const Center(
          child: Text('Доступно только для автора тестов'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Создание теста')),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Новый тест',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: _titleController,
                            decoration: const InputDecoration(
                              labelText: 'Название теста',
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Введите название теста';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),
                          DropdownButtonFormField<int>(
                            initialValue: _selectedCategoryId,
                            decoration: const InputDecoration(
                              labelText: 'Категория',
                              border: OutlineInputBorder(),
                            ),
                            items: _categories
                                .map(
                                  (category) => DropdownMenuItem<int>(
                                    value: category.id!,
                                    child: Text(category.name),
                                  ),
                                )
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                _selectedCategoryId = value;
                              });
                            },
                          ),
                          const SizedBox(height: 24),
                          Text(
                            'Создать категорию',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            controller: _newCategoryController,
                            decoration: const InputDecoration(
                              labelText: 'Название категории',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 12),
                          OutlinedButton(
                            onPressed: _createCategory,
                            child: const Text('Добавить категорию'),
                          ),
                          const SizedBox(height: 24),
                          ElevatedButton(
                            onPressed: _isSaving ? null : _saveTest,
                            child: const Text('Сохранить тест'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
