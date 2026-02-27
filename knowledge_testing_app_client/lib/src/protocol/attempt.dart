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
import 'answer_attempt.dart' as _i4;
import 'package:knowledge_testing_app_client/src/protocol/protocol.dart' as _i5;

abstract class Attempt implements _i1.SerializableModel {
  Attempt._({
    this.id,
    required this.score,
    required this.maxScore,
    required this.userId,
    this.user,
    required this.testId,
    this.test,
    this.answerAttempt,
  });

  factory Attempt({
    int? id,
    required int score,
    required int maxScore,
    required int userId,
    _i2.User? user,
    required int testId,
    _i3.Test? test,
    List<_i4.AnswerAttempt>? answerAttempt,
  }) = _AttemptImpl;

  factory Attempt.fromJson(Map<String, dynamic> jsonSerialization) {
    return Attempt(
      id: jsonSerialization['id'] as int?,
      score: jsonSerialization['score'] as int,
      maxScore: jsonSerialization['maxScore'] as int,
      userId: jsonSerialization['userId'] as int,
      user: jsonSerialization['user'] == null
          ? null
          : _i5.Protocol().deserialize<_i2.User>(jsonSerialization['user']),
      testId: jsonSerialization['testId'] as int,
      test: jsonSerialization['test'] == null
          ? null
          : _i5.Protocol().deserialize<_i3.Test>(jsonSerialization['test']),
      answerAttempt: jsonSerialization['answerAttempt'] == null
          ? null
          : _i5.Protocol().deserialize<List<_i4.AnswerAttempt>>(
              jsonSerialization['answerAttempt'],
            ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int score;

  int maxScore;

  int userId;

  _i2.User? user;

  int testId;

  _i3.Test? test;

  List<_i4.AnswerAttempt>? answerAttempt;

  /// Returns a shallow copy of this [Attempt]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Attempt copyWith({
    int? id,
    int? score,
    int? maxScore,
    int? userId,
    _i2.User? user,
    int? testId,
    _i3.Test? test,
    List<_i4.AnswerAttempt>? answerAttempt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Attempt',
      if (id != null) 'id': id,
      'score': score,
      'maxScore': maxScore,
      'userId': userId,
      if (user != null) 'user': user?.toJson(),
      'testId': testId,
      if (test != null) 'test': test?.toJson(),
      if (answerAttempt != null)
        'answerAttempt': answerAttempt?.toJson(valueToJson: (v) => v.toJson()),
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
    required int score,
    required int maxScore,
    required int userId,
    _i2.User? user,
    required int testId,
    _i3.Test? test,
    List<_i4.AnswerAttempt>? answerAttempt,
  }) : super._(
         id: id,
         score: score,
         maxScore: maxScore,
         userId: userId,
         user: user,
         testId: testId,
         test: test,
         answerAttempt: answerAttempt,
       );

  /// Returns a shallow copy of this [Attempt]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Attempt copyWith({
    Object? id = _Undefined,
    int? score,
    int? maxScore,
    int? userId,
    Object? user = _Undefined,
    int? testId,
    Object? test = _Undefined,
    Object? answerAttempt = _Undefined,
  }) {
    return Attempt(
      id: id is int? ? id : this.id,
      score: score ?? this.score,
      maxScore: maxScore ?? this.maxScore,
      userId: userId ?? this.userId,
      user: user is _i2.User? ? user : this.user?.copyWith(),
      testId: testId ?? this.testId,
      test: test is _i3.Test? ? test : this.test?.copyWith(),
      answerAttempt: answerAttempt is List<_i4.AnswerAttempt>?
          ? answerAttempt
          : this.answerAttempt?.map((e0) => e0.copyWith()).toList(),
    );
  }
}
