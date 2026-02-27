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
import 'answer_attempt.dart' as _i3;
import 'package:knowledge_testing_app_client/src/protocol/protocol.dart' as _i4;

abstract class Answer implements _i1.SerializableModel {
  Answer._({
    this.id,
    required this.text,
    required this.isCorrect,
    required this.questionId,
    this.question,
    this.answerAttempt,
  });

  factory Answer({
    int? id,
    required String text,
    required bool isCorrect,
    required int questionId,
    _i2.Question? question,
    List<_i3.AnswerAttempt>? answerAttempt,
  }) = _AnswerImpl;

  factory Answer.fromJson(Map<String, dynamic> jsonSerialization) {
    return Answer(
      id: jsonSerialization['id'] as int?,
      text: jsonSerialization['text'] as String,
      isCorrect: jsonSerialization['isCorrect'] as bool,
      questionId: jsonSerialization['questionId'] as int,
      question: jsonSerialization['question'] == null
          ? null
          : _i4.Protocol().deserialize<_i2.Question>(
              jsonSerialization['question'],
            ),
      answerAttempt: jsonSerialization['answerAttempt'] == null
          ? null
          : _i4.Protocol().deserialize<List<_i3.AnswerAttempt>>(
              jsonSerialization['answerAttempt'],
            ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String text;

  bool isCorrect;

  int questionId;

  _i2.Question? question;

  List<_i3.AnswerAttempt>? answerAttempt;

  /// Returns a shallow copy of this [Answer]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Answer copyWith({
    int? id,
    String? text,
    bool? isCorrect,
    int? questionId,
    _i2.Question? question,
    List<_i3.AnswerAttempt>? answerAttempt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Answer',
      if (id != null) 'id': id,
      'text': text,
      'isCorrect': isCorrect,
      'questionId': questionId,
      if (question != null) 'question': question?.toJson(),
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

class _AnswerImpl extends Answer {
  _AnswerImpl({
    int? id,
    required String text,
    required bool isCorrect,
    required int questionId,
    _i2.Question? question,
    List<_i3.AnswerAttempt>? answerAttempt,
  }) : super._(
         id: id,
         text: text,
         isCorrect: isCorrect,
         questionId: questionId,
         question: question,
         answerAttempt: answerAttempt,
       );

  /// Returns a shallow copy of this [Answer]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Answer copyWith({
    Object? id = _Undefined,
    String? text,
    bool? isCorrect,
    int? questionId,
    Object? question = _Undefined,
    Object? answerAttempt = _Undefined,
  }) {
    return Answer(
      id: id is int? ? id : this.id,
      text: text ?? this.text,
      isCorrect: isCorrect ?? this.isCorrect,
      questionId: questionId ?? this.questionId,
      question: question is _i2.Question?
          ? question
          : this.question?.copyWith(),
      answerAttempt: answerAttempt is List<_i3.AnswerAttempt>?
          ? answerAttempt
          : this.answerAttempt?.map((e0) => e0.copyWith()).toList(),
    );
  }
}
