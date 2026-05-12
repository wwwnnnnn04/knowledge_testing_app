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
import 'user.dart' as _i2;
import 'test.dart' as _i3;
import 'result.dart' as _i4;
import 'answer_attempt.dart' as _i5;
import 'certificate.dart' as _i6;
import 'package:knowledge_testing_app_client/src/protocol/protocol.dart' as _i7;

abstract class Attempt implements _i1.SerializableModel {
  Attempt._({
    this.id,
    required this.userId,
    this.user,
    required this.testId,
    this.test,
    this.result,
    this.answerAttempt,
    this.certificates,
  });

  factory Attempt({
    int? id,
    required int userId,
    _i2.User? user,
    required int testId,
    _i3.Test? test,
    _i4.Result? result,
    List<_i5.AnswerAttempt>? answerAttempt,
    List<_i6.Certificate>? certificates,
  }) = _AttemptImpl;

  factory Attempt.fromJson(Map<String, dynamic> jsonSerialization) {
    return Attempt(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      user: jsonSerialization['user'] == null
          ? null
          : _i7.Protocol().deserialize<_i2.User>(jsonSerialization['user']),
      testId: jsonSerialization['testId'] as int,
      test: jsonSerialization['test'] == null
          ? null
          : _i7.Protocol().deserialize<_i3.Test>(jsonSerialization['test']),
      result: jsonSerialization['result'] == null
          ? null
          : _i7.Protocol().deserialize<_i4.Result>(jsonSerialization['result']),
      answerAttempt: jsonSerialization['answerAttempt'] == null
          ? null
          : _i7.Protocol().deserialize<List<_i5.AnswerAttempt>>(
              jsonSerialization['answerAttempt'],
            ),
      certificates: jsonSerialization['certificates'] == null
          ? null
          : _i7.Protocol().deserialize<List<_i6.Certificate>>(
              jsonSerialization['certificates'],
            ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userId;

  _i2.User? user;

  int testId;

  _i3.Test? test;

  _i4.Result? result;

  List<_i5.AnswerAttempt>? answerAttempt;

  List<_i6.Certificate>? certificates;

  /// Returns a shallow copy of this [Attempt]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Attempt copyWith({
    int? id,
    int? userId,
    _i2.User? user,
    int? testId,
    _i3.Test? test,
    _i4.Result? result,
    List<_i5.AnswerAttempt>? answerAttempt,
    List<_i6.Certificate>? certificates,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Attempt',
      if (id != null) 'id': id,
      'userId': userId,
      if (user != null) 'user': user?.toJson(),
      'testId': testId,
      if (test != null) 'test': test?.toJson(),
      if (result != null) 'result': result?.toJson(),
      if (answerAttempt != null)
        'answerAttempt': answerAttempt?.toJson(valueToJson: (v) => v.toJson()),
      if (certificates != null)
        'certificates': certificates?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AttemptImpl extends Attempt {
  _AttemptImpl({
    int? id,
    required int userId,
    _i2.User? user,
    required int testId,
    _i3.Test? test,
    _i4.Result? result,
    List<_i5.AnswerAttempt>? answerAttempt,
    List<_i6.Certificate>? certificates,
  }) : super._(
         id: id,
         userId: userId,
         user: user,
         testId: testId,
         test: test,
         result: result,
         answerAttempt: answerAttempt,
         certificates: certificates,
       );

  /// Returns a shallow copy of this [Attempt]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Attempt copyWith({
    Object? id = _Undefined,
    int? userId,
    Object? user = _Undefined,
    int? testId,
    Object? test = _Undefined,
    Object? result = _Undefined,
    Object? answerAttempt = _Undefined,
    Object? certificates = _Undefined,
  }) {
    return Attempt(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      user: user is _i2.User? ? user : this.user?.copyWith(),
      testId: testId ?? this.testId,
      test: test is _i3.Test? ? test : this.test?.copyWith(),
      result: result is _i4.Result? ? result : this.result?.copyWith(),
      answerAttempt: answerAttempt is List<_i5.AnswerAttempt>?
          ? answerAttempt
          : this.answerAttempt?.map((e0) => e0.copyWith()).toList(),
      certificates: certificates is List<_i6.Certificate>?
          ? certificates
          : this.certificates?.map((e0) => e0.copyWith()).toList(),
    );
  }
}
