import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class AuthEndpoint extends Endpoint {
  /// Регистрация
  Future<User> register(
    Session session, {
    required String username,
    required String email,
    required String password,
    required Role role,
  }) async {
    // Проверка: есть ли пользователь
    final existingUser = await User.db.findFirstRow(
      session,
      where: (u) => u.email.equals(email),
    );

    if (existingUser != null) {
      throw Exception('User already exists');
    }

    // Создаем пользователя
    final user = User(
      username: username,
      email: email,
      password: password,
      role: role,
    );

    return await User.db.insertRow(session, user);
  }

  /// Логин
  Future<User?> login(
    Session session, {
    required String email,
    required String password,
  }) async {
    final user = await User.db.findFirstRow(
      session,
      where: (u) => u.email.equals(email) & u.password.equals(password),
    );

    return user;
  }
}
