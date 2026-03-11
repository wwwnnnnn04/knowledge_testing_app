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
import 'attempt.dart' as _i4;
import 'package:knowledge_testing_app_client/src/protocol/protocol.dart' as _i5;

abstract class Certificate implements _i1.SerializableModel {
  Certificate._({
    this.id,
    required this.userId,
    this.user,
    required this.testId,
    this.test,
    required this.attemptId,
    this.attempt,
    required this.percentage,
  });

  factory Certificate({
    int? id,
    required int userId,
    _i2.User? user,
    required int testId,
    _i3.Test? test,
    required int attemptId,
    _i4.Attempt? attempt,
    required double percentage,
  }) = _CertificateImpl;

  factory Certificate.fromJson(Map<String, dynamic> jsonSerialization) {
    return Certificate(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      user: jsonSerialization['user'] == null
          ? null
          : _i5.Protocol().deserialize<_i2.User>(jsonSerialization['user']),
      testId: jsonSerialization['testId'] as int,
      test: jsonSerialization['test'] == null
          ? null
          : _i5.Protocol().deserialize<_i3.Test>(jsonSerialization['test']),
      attemptId: jsonSerialization['attemptId'] as int,
      attempt: jsonSerialization['attempt'] == null
          ? null
          : _i5.Protocol().deserialize<_i4.Attempt>(
              jsonSerialization['attempt'],
            ),
      percentage: (jsonSerialization['percentage'] as num).toDouble(),
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

  int attemptId;

  _i4.Attempt? attempt;

  double percentage;

  /// Returns a shallow copy of this [Certificate]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Certificate copyWith({
    int? id,
    int? userId,
    _i2.User? user,
    int? testId,
    _i3.Test? test,
    int? attemptId,
    _i4.Attempt? attempt,
    double? percentage,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Certificate',
      if (id != null) 'id': id,
      'userId': userId,
      if (user != null) 'user': user?.toJson(),
      'testId': testId,
      if (test != null) 'test': test?.toJson(),
      'attemptId': attemptId,
      if (attempt != null) 'attempt': attempt?.toJson(),
      'percentage': percentage,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CertificateImpl extends Certificate {
  _CertificateImpl({
    int? id,
    required int userId,
    _i2.User? user,
    required int testId,
    _i3.Test? test,
    required int attemptId,
    _i4.Attempt? attempt,
    required double percentage,
  }) : super._(
         id: id,
         userId: userId,
         user: user,
         testId: testId,
         test: test,
         attemptId: attemptId,
         attempt: attempt,
         percentage: percentage,
       );

  /// Returns a shallow copy of this [Certificate]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Certificate copyWith({
    Object? id = _Undefined,
    int? userId,
    Object? user = _Undefined,
    int? testId,
    Object? test = _Undefined,
    int? attemptId,
    Object? attempt = _Undefined,
    double? percentage,
  }) {
    return Certificate(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      user: user is _i2.User? ? user : this.user?.copyWith(),
      testId: testId ?? this.testId,
      test: test is _i3.Test? ? test : this.test?.copyWith(),
      attemptId: attemptId ?? this.attemptId,
      attempt: attempt is _i4.Attempt? ? attempt : this.attempt?.copyWith(),
      percentage: percentage ?? this.percentage,
    );
  }
}
