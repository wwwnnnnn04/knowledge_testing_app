/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'answer.dart' as _i2;
import 'answer_attempt.dart' as _i3;
import 'attempt.dart' as _i4;
import 'greetings/greeting.dart' as _i5;
import 'question.dart' as _i6;
import 'role.dart' as _i7;
import 'test.dart' as _i8;
import 'user.dart' as _i9;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _i10;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _i11;
export 'answer.dart';
export 'answer_attempt.dart';
export 'attempt.dart';
export 'greetings/greeting.dart';
export 'question.dart';
export 'role.dart';
export 'test.dart';
export 'user.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static String? getClassNameFromObjectJson(dynamic data) {
    if (data is! Map) return null;
    final className = data['__className__'] as String?;
    return className;
  }

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;

    final dataClassName = getClassNameFromObjectJson(data);
    if (dataClassName != null && dataClassName != getClassNameForType(t)) {
      try {
        return deserializeByClassName({
          'className': dataClassName,
          'data': data,
        });
      } on FormatException catch (_) {
        // If the className is not recognized (e.g., older client receiving
        // data with a new subtype), fall back to deserializing without the
        // className, using the expected type T.
      }
    }

    if (t == _i2.Answer) {
      return _i2.Answer.fromJson(data) as T;
    }
    if (t == _i3.AnswerAttempt) {
      return _i3.AnswerAttempt.fromJson(data) as T;
    }
    if (t == _i4.Attempt) {
      return _i4.Attempt.fromJson(data) as T;
    }
    if (t == _i5.Greeting) {
      return _i5.Greeting.fromJson(data) as T;
    }
    if (t == _i6.Question) {
      return _i6.Question.fromJson(data) as T;
    }
    if (t == _i7.Role) {
      return _i7.Role.fromJson(data) as T;
    }
    if (t == _i8.Test) {
      return _i8.Test.fromJson(data) as T;
    }
    if (t == _i9.User) {
      return _i9.User.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Answer?>()) {
      return (data != null ? _i2.Answer.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.AnswerAttempt?>()) {
      return (data != null ? _i3.AnswerAttempt.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.Attempt?>()) {
      return (data != null ? _i4.Attempt.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.Greeting?>()) {
      return (data != null ? _i5.Greeting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.Question?>()) {
      return (data != null ? _i6.Question.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.Role?>()) {
      return (data != null ? _i7.Role.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.Test?>()) {
      return (data != null ? _i8.Test.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.User?>()) {
      return (data != null ? _i9.User.fromJson(data) : null) as T;
    }
    if (t == List<_i3.AnswerAttempt>) {
      return (data as List)
              .map((e) => deserialize<_i3.AnswerAttempt>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i3.AnswerAttempt>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i3.AnswerAttempt>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i2.Answer>) {
      return (data as List).map((e) => deserialize<_i2.Answer>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i2.Answer>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<_i2.Answer>(e)).toList()
              : null)
          as T;
    }
    if (t == List<_i4.Attempt>) {
      return (data as List).map((e) => deserialize<_i4.Attempt>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i4.Attempt>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<_i4.Attempt>(e)).toList()
              : null)
          as T;
    }
    if (t == List<_i6.Question>) {
      return (data as List).map((e) => deserialize<_i6.Question>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i6.Question>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<_i6.Question>(e)).toList()
              : null)
          as T;
    }
    if (t == List<_i8.Test>) {
      return (data as List).map((e) => deserialize<_i8.Test>(e)).toList() as T;
    }
    if (t == _i1.getType<List<_i8.Test>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<_i8.Test>(e)).toList()
              : null)
          as T;
    }
    try {
      return _i10.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i11.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i2.Answer => 'Answer',
      _i3.AnswerAttempt => 'AnswerAttempt',
      _i4.Attempt => 'Attempt',
      _i5.Greeting => 'Greeting',
      _i6.Question => 'Question',
      _i7.Role => 'Role',
      _i8.Test => 'Test',
      _i9.User => 'User',
      _ => null,
    };
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;

    if (data is Map<String, dynamic> && data['__className__'] is String) {
      return (data['__className__'] as String).replaceFirst(
        'knowledge_testing_app.',
        '',
      );
    }

    switch (data) {
      case _i2.Answer():
        return 'Answer';
      case _i3.AnswerAttempt():
        return 'AnswerAttempt';
      case _i4.Attempt():
        return 'Attempt';
      case _i5.Greeting():
        return 'Greeting';
      case _i6.Question():
        return 'Question';
      case _i7.Role():
        return 'Role';
      case _i8.Test():
        return 'Test';
      case _i9.User():
        return 'User';
    }
    className = _i10.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_idp.$className';
    }
    className = _i11.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_core.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'Answer') {
      return deserialize<_i2.Answer>(data['data']);
    }
    if (dataClassName == 'AnswerAttempt') {
      return deserialize<_i3.AnswerAttempt>(data['data']);
    }
    if (dataClassName == 'Attempt') {
      return deserialize<_i4.Attempt>(data['data']);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_i5.Greeting>(data['data']);
    }
    if (dataClassName == 'Question') {
      return deserialize<_i6.Question>(data['data']);
    }
    if (dataClassName == 'Role') {
      return deserialize<_i7.Role>(data['data']);
    }
    if (dataClassName == 'Test') {
      return deserialize<_i8.Test>(data['data']);
    }
    if (dataClassName == 'User') {
      return deserialize<_i9.User>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _i10.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _i11.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }
}
