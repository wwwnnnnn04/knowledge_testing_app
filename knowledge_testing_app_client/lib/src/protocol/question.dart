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
import 'test.dart' as _i2;
import 'answer.dart' as _i3;
import 'answer_attempt.dart' as _i4;
import 'package:knowledge_testing_app_client/src/protocol/protocol.dart' as _i5;

abstract class Question implements _i1.SerializableModel {
  Question._({
    this.id,
    required this.text,
    required this.order,
    required this.testId,
    this.test,
    this.answer,
    this.answerAttempt,
  });

  factory Question({
    int? id,
    required String text,
    required int order,
    required int testId,
    _i2.Test? test,
    List<_i3.Answer>? answer,
    List<_i4.AnswerAttempt>? answerAttempt,
  }) = _QuestionImpl;

  factory Question.fromJson(Map<String, dynamic> jsonSerialization) {
    return Question(
      id: jsonSerialization['id'] as int?,
      text: jsonSerialization['text'] as String,
      order: jsonSerialization['order'] as int,
      testId: jsonSerialization['testId'] as int,
      test: jsonSerialization['test'] == null
          ? null
          : _i5.Protocol().deserialize<_i2.Test>(jsonSerialization['test']),
      answer: jsonSerialization['answer'] == null
          ? null
          : _i5.Protocol().deserialize<List<_i3.Answer>>(
              jsonSerialization['answer'],
            ),
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

  String text;

  int order;

  int testId;

  _i2.Test? test;

  List<_i3.Answer>? answer;

  List<_i4.AnswerAttempt>? answerAttempt;

  /// Returns a shallow copy of this [Question]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Question copyWith({
    int? id,
    String? text,
    int? order,
    int? testId,
    _i2.Test? test,
    List<_i3.Answer>? answer,
    List<_i4.AnswerAttempt>? answerAttempt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Question',
      if (id != null) 'id': id,
      'text': text,
      'order': order,
      'testId': testId,
      if (test != null) 'test': test?.toJson(),
      if (answer != null)
        'answer': answer?.toJson(valueToJson: (v) => v.toJson()),
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

class _QuestionImpl extends Question {
  _QuestionImpl({
    int? id,
    required String text,
    required int order,
    required int testId,
    _i2.Test? test,
    List<_i3.Answer>? answer,
    List<_i4.AnswerAttempt>? answerAttempt,
  }) : super._(
         id: id,
         text: text,
         order: order,
         testId: testId,
         test: test,
         answer: answer,
         answerAttempt: answerAttempt,
       );

  /// Returns a shallow copy of this [Question]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Question copyWith({
    Object? id = _Undefined,
    String? text,
    int? order,
    int? testId,
    Object? test = _Undefined,
    Object? answer = _Undefined,
    Object? answerAttempt = _Undefined,
  }) {
    return Question(
      id: id is int? ? id : this.id,
      text: text ?? this.text,
      order: order ?? this.order,
      testId: testId ?? this.testId,
      test: test is _i2.Test? ? test : this.test?.copyWith(),
      answer: answer is List<_i3.Answer>?
          ? answer
          : this.answer?.map((e0) => e0.copyWith()).toList(),
      answerAttempt: answerAttempt is List<_i4.AnswerAttempt>?
          ? answerAttempt
          : this.answerAttempt?.map((e0) => e0.copyWith()).toList(),
    );
  }
}
