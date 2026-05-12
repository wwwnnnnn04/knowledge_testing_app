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
import 'category.dart' as _i5;
import 'certificate.dart' as _i6;
import 'greetings/greeting.dart' as _i7;
import 'log.dart' as _i8;
import 'question.dart' as _i9;
import 'result.dart' as _i10;
import 'role.dart' as _i11;
import 'tag.dart' as _i12;
import 'test.dart' as _i13;
import 'test_tag.dart' as _i14;
import 'user.dart' as _i15;
import 'package:knowledge_testing_app_client/src/protocol/result.dart' as _i16;
import 'package:knowledge_testing_app_client/src/protocol/certificate.dart'
    as _i17;
import 'package:knowledge_testing_app_client/src/protocol/category.dart'
    as _i18;
import 'package:knowledge_testing_app_client/src/protocol/test.dart' as _i19;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _i20;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _i21;
export 'answer.dart';
export 'answer_attempt.dart';
export 'attempt.dart';
export 'category.dart';
export 'certificate.dart';
export 'greetings/greeting.dart';
export 'log.dart';
export 'question.dart';
export 'result.dart';
export 'role.dart';
export 'tag.dart';
export 'test.dart';
export 'test_tag.dart';
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
    if (t == _i5.Category) {
      return _i5.Category.fromJson(data) as T;
    }
    if (t == _i6.Certificate) {
      return _i6.Certificate.fromJson(data) as T;
    }
    if (t == _i7.Greeting) {
      return _i7.Greeting.fromJson(data) as T;
    }
    if (t == _i8.Log) {
      return _i8.Log.fromJson(data) as T;
    }
    if (t == _i9.Question) {
      return _i9.Question.fromJson(data) as T;
    }
    if (t == _i10.Result) {
      return _i10.Result.fromJson(data) as T;
    }
    if (t == _i11.Role) {
      return _i11.Role.fromJson(data) as T;
    }
    if (t == _i12.Tag) {
      return _i12.Tag.fromJson(data) as T;
    }
    if (t == _i13.Test) {
      return _i13.Test.fromJson(data) as T;
    }
    if (t == _i14.TestTag) {
      return _i14.TestTag.fromJson(data) as T;
    }
    if (t == _i15.User) {
      return _i15.User.fromJson(data) as T;
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
    if (t == _i1.getType<_i5.Category?>()) {
      return (data != null ? _i5.Category.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.Certificate?>()) {
      return (data != null ? _i6.Certificate.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.Greeting?>()) {
      return (data != null ? _i7.Greeting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.Log?>()) {
      return (data != null ? _i8.Log.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.Question?>()) {
      return (data != null ? _i9.Question.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.Result?>()) {
      return (data != null ? _i10.Result.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.Role?>()) {
      return (data != null ? _i11.Role.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.Tag?>()) {
      return (data != null ? _i12.Tag.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.Test?>()) {
      return (data != null ? _i13.Test.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.TestTag?>()) {
      return (data != null ? _i14.TestTag.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.User?>()) {
      return (data != null ? _i15.User.fromJson(data) : null) as T;
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
    if (t == List<_i6.Certificate>) {
      return (data as List).map((e) => deserialize<_i6.Certificate>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i6.Certificate>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i6.Certificate>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i13.Test>) {
      return (data as List).map((e) => deserialize<_i13.Test>(e)).toList() as T;
    }
    if (t == _i1.getType<List<_i13.Test>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<_i13.Test>(e)).toList()
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
    if (t == List<_i14.TestTag>) {
      return (data as List).map((e) => deserialize<_i14.TestTag>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i14.TestTag>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<_i14.TestTag>(e)).toList()
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
    if (t == List<_i9.Question>) {
      return (data as List).map((e) => deserialize<_i9.Question>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i9.Question>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<_i9.Question>(e)).toList()
              : null)
          as T;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as T;
    }
    if (t == List<_i16.Result>) {
      return (data as List).map((e) => deserialize<_i16.Result>(e)).toList()
          as T;
    }
    if (t == List<_i17.Certificate>) {
      return (data as List)
              .map((e) => deserialize<_i17.Certificate>(e))
              .toList()
          as T;
    }
    if (t == List<_i18.Category>) {
      return (data as List).map((e) => deserialize<_i18.Category>(e)).toList()
          as T;
    }
    if (t == List<_i19.Test>) {
      return (data as List).map((e) => deserialize<_i19.Test>(e)).toList() as T;
    }
    try {
      return _i20.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i21.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i2.Answer => 'Answer',
      _i3.AnswerAttempt => 'AnswerAttempt',
      _i4.Attempt => 'Attempt',
      _i5.Category => 'Category',
      _i6.Certificate => 'Certificate',
      _i7.Greeting => 'Greeting',
      _i8.Log => 'Log',
      _i9.Question => 'Question',
      _i10.Result => 'Result',
      _i11.Role => 'Role',
      _i12.Tag => 'Tag',
      _i13.Test => 'Test',
      _i14.TestTag => 'TestTag',
      _i15.User => 'User',
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
      case _i5.Category():
        return 'Category';
      case _i6.Certificate():
        return 'Certificate';
      case _i7.Greeting():
        return 'Greeting';
      case _i8.Log():
        return 'Log';
      case _i9.Question():
        return 'Question';
      case _i10.Result():
        return 'Result';
      case _i11.Role():
        return 'Role';
      case _i12.Tag():
        return 'Tag';
      case _i13.Test():
        return 'Test';
      case _i14.TestTag():
        return 'TestTag';
      case _i15.User():
        return 'User';
    }
    className = _i20.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_idp.$className';
    }
    className = _i21.Protocol().getClassNameForObject(data);
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
    if (dataClassName == 'Category') {
      return deserialize<_i5.Category>(data['data']);
    }
    if (dataClassName == 'Certificate') {
      return deserialize<_i6.Certificate>(data['data']);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_i7.Greeting>(data['data']);
    }
    if (dataClassName == 'Log') {
      return deserialize<_i8.Log>(data['data']);
    }
    if (dataClassName == 'Question') {
      return deserialize<_i9.Question>(data['data']);
    }
    if (dataClassName == 'Result') {
      return deserialize<_i10.Result>(data['data']);
    }
    if (dataClassName == 'Role') {
      return deserialize<_i11.Role>(data['data']);
    }
    if (dataClassName == 'Tag') {
      return deserialize<_i12.Tag>(data['data']);
    }
    if (dataClassName == 'Test') {
      return deserialize<_i13.Test>(data['data']);
    }
    if (dataClassName == 'TestTag') {
      return deserialize<_i14.TestTag>(data['data']);
    }
    if (dataClassName == 'User') {
      return deserialize<_i15.User>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _i20.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _i21.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }
}
