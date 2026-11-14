import 'package:flutter/material.dart';
import 'package:knowledge_testing_app_client/knowledge_testing_app_client.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

import 'config/app_config.dart';
import 'screens/auth_screen.dart';

late final Client client;
late String serverUrl;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final config = await AppConfig.loadConfig();

  debugPrint('CONFIG API URL: ${config.apiUrl}');

  serverUrl = (config.apiUrl ?? 'http://192.168.1.13:8080').trim();

  if (!serverUrl.endsWith('/')) {
    serverUrl = '$serverUrl/';
  }

  debugPrint('FINAL SERVER URL: $serverUrl');

  client = Client(serverUrl)..connectivityMonitor = FlutterConnectivityMonitor();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Система тестирования знаний',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const AuthScreen(),
    );
  }
}
