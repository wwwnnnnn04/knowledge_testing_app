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
import 'attempt.dart' as _i2;
import 'package:knowledge_testing_app_client/src/protocol/protocol.dart' as _i3;

abstract class Result implements _i1.SerializableModel {
  Result._({
    this.id,
    required this.attemptId,
    this.attempt,
    required this.score,
    required this.maxScore,
    required this.percentage,
    required this.passed,
  });

  factory Result({
    int? id,
    required int attemptId,
    _i2.Attempt? attempt,
    required int score,
    required int maxScore,
    required double percentage,
    required bool passed,
  }) = _ResultImpl;

  factory Result.fromJson(Map<String, dynamic> jsonSerialization) {
    return Result(
      id: jsonSerialization['id'] as int?,
      attemptId: jsonSerialization['attemptId'] as int,
      attempt: jsonSerialization['attempt'] == null
          ? null
          : _i3.Protocol().deserialize<_i2.Attempt>(
              jsonSerialization['attempt'],
            ),
      score: jsonSerialization['score'] as int,
      maxScore: jsonSerialization['maxScore'] as int,
      percentage: (jsonSerialization['percentage'] as num).toDouble(),
      passed: jsonSerialization['passed'] as bool,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int attemptId;

  _i2.Attempt? attempt;

  int score;

  int maxScore;

  double percentage;

  bool passed;

  /// Returns a shallow copy of this [Result]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Result copyWith({
    int? id,
    int? attemptId,
    _i2.Attempt? attempt,
    int? score,
    int? maxScore,
    double? percentage,
    bool? passed,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Result',
      if (id != null) 'id': id,
      'attemptId': attemptId,
      if (attempt != null) 'attempt': attempt?.toJson(),
      'score': score,
      'maxScore': maxScore,
      'percentage': percentage,
      'passed': passed,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ResultImpl extends Result {
  _ResultImpl({
    int? id,
    required int attemptId,
    _i2.Attempt? attempt,
    required int score,
    required int maxScore,
    required double percentage,
    required bool passed,
  }) : super._(
         id: id,
         attemptId: attemptId,
         attempt: attempt,
         score: score,
         maxScore: maxScore,
         percentage: percentage,
         passed: passed,
       );

  /// Returns a shallow copy of this [Result]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Result copyWith({
    Object? id = _Undefined,
    int? attemptId,
    Object? attempt = _Undefined,
    int? score,
    int? maxScore,
    double? percentage,
    bool? passed,
  }) {
    return Result(
      id: id is int? ? id : this.id,
      attemptId: attemptId ?? this.attemptId,
      attempt: attempt is _i2.Attempt? ? attempt : this.attempt?.copyWith(),
      score: score ?? this.score,
      maxScore: maxScore ?? this.maxScore,
      percentage: percentage ?? this.percentage,
      passed: passed ?? this.passed,
    );
  }
}
