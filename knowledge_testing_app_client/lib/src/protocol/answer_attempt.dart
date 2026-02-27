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
import 'question.dart' as _i2;
import 'answer.dart' as _i3;
import 'attempt.dart' as _i4;
import 'package:knowledge_testing_app_client/src/protocol/protocol.dart' as _i5;

abstract class AnswerAttempt implements _i1.SerializableModel {
  AnswerAttempt._({
    this.id,
    required this.isCorrect,
    required this.questionId,
    this.question,
    required this.answerId,
    this.answer,
    required this.attemptId,
    this.attempt,
  });

  factory AnswerAttempt({
    int? id,
    required bool isCorrect,
    required int questionId,
    _i2.Question? question,
    required int answerId,
    _i3.Answer? answer,
    required int attemptId,
    _i4.Attempt? attempt,
  }) = _AnswerAttemptImpl;

  factory AnswerAttempt.fromJson(Map<String, dynamic> jsonSerialization) {
    return AnswerAttempt(
      id: jsonSerialization['id'] as int?,
      isCorrect: jsonSerialization['isCorrect'] as bool,
      questionId: jsonSerialization['questionId'] as int,
      question: jsonSerialization['question'] == null
          ? null
          : _i5.Protocol().deserialize<_i2.Question>(
              jsonSerialization['question'],
            ),
      answerId: jsonSerialization['answerId'] as int,
      answer: jsonSerialization['answer'] == null
          ? null
          : _i5.Protocol().deserialize<_i3.Answer>(jsonSerialization['answer']),
      attemptId: jsonSerialization['attemptId'] as int,
      attempt: jsonSerialization['attempt'] == null
          ? null
          : _i5.Protocol().deserialize<_i4.Attempt>(
              jsonSerialization['attempt'],
            ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  bool isCorrect;

  int questionId;

  _i2.Question? question;

  int answerId;

  _i3.Answer? answer;

  int attemptId;

  _i4.Attempt? attempt;

  /// Returns a shallow copy of this [AnswerAttempt]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  AnswerAttempt copyWith({
    int? id,
    bool? isCorrect,
    int? questionId,
    _i2.Question? question,
    int? answerId,
    _i3.Answer? answer,
    int? attemptId,
    _i4.Attempt? attempt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'AnswerAttempt',
      if (id != null) 'id': id,
      'isCorrect': isCorrect,
      'questionId': questionId,
      if (question != null) 'question': question?.toJson(),
      'answerId': answerId,
      if (answer != null) 'answer': answer?.toJson(),
      'attemptId': attemptId,
      if (attempt != null) 'attempt': attempt?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AnswerAttemptImpl extends AnswerAttempt {
  _AnswerAttemptImpl({
    int? id,
    required bool isCorrect,
    required int questionId,
    _i2.Question? question,
    required int answerId,
    _i3.Answer? answer,
    required int attemptId,
    _i4.Attempt? attempt,
  }) : super._(
         id: id,
         isCorrect: isCorrect,
         questionId: questionId,
         question: question,
         answerId: answerId,
         answer: answer,
         attemptId: attemptId,
         attempt: attempt,
       );

  /// Returns a shallow copy of this [AnswerAttempt]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  AnswerAttempt copyWith({
    Object? id = _Undefined,
    bool? isCorrect,
    int? questionId,
    Object? question = _Undefined,
    int? answerId,
    Object? answer = _Undefined,
    int? attemptId,
    Object? attempt = _Undefined,
  }) {
    return AnswerAttempt(
      id: id is int? ? id : this.id,
      isCorrect: isCorrect ?? this.isCorrect,
      questionId: questionId ?? this.questionId,
      question: question is _i2.Question?
          ? question
          : this.question?.copyWith(),
      answerId: answerId ?? this.answerId,
      answer: answer is _i3.Answer? ? answer : this.answer?.copyWith(),
      attemptId: attemptId ?? this.attemptId,
      attempt: attempt is _i4.Attempt? ? attempt : this.attempt?.copyWith(),
    );
  }
}
