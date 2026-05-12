import 'package:flutter/material.dart';
import 'package:knowledge_testing_app_client/knowledge_testing_app_client.dart';

import '../main.dart';

class CertificatesScreen extends StatefulWidget {
  final User currentUser;

  const CertificatesScreen({
    super.key,
    required this.currentUser,
  });

  @override
  State<CertificatesScreen> createState() => _CertificatesScreenState();
}

class _CertificatesScreenState extends State<CertificatesScreen> {
  bool _isLoading = true;
  List<Certificate> _certificates = [];

  @override
  void initState() {
    super.initState();
    _loadCertificates();
  }

  Future<void> _loadCertificates() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final certificates = await client.attempt.getUserCertificates(
        userId: widget.currentUser.id!,
      );

      if (!mounted) return;

      setState(() {
        _certificates = certificates;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Сертификаты'),
      ),
      body: RefreshIndicator(
        onRefresh: _loadCertificates,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            if (_isLoading)
              const Center(child: CircularProgressIndicator())
            else if (_certificates.isEmpty)
              const Card(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('Сертификаты пока отсутствуют.'),
                ),
              )
            else
              ..._certificates.map(
                (certificate) => Card(
                  child: ListTile(
                    leading: const Icon(Icons.workspace_premium),
                    title: Text(
                      certificate.test?.title ?? 'Тест без названия',
                    ),
                    subtitle: Text(
                      'Процент выполнения: ${certificate.percentage.toStringAsFixed(1)}%',
                    ),
                    trailing: Text('Попытка #${certificate.attemptId}'),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
