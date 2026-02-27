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
import 'attempt.dart' as _i3;
import 'question.dart' as _i4;
import 'package:knowledge_testing_app_client/src/protocol/protocol.dart' as _i5;

abstract class Test implements _i1.SerializableModel {
  Test._({
    this.id,
    required this.title,
    required this.creatorId,
    this.creator,
    this.attempt,
    this.question,
  });

  factory Test({
    int? id,
    required String title,
    required int creatorId,
    _i2.User? creator,
    List<_i3.Attempt>? attempt,
    List<_i4.Question>? question,
  }) = _TestImpl;

  factory Test.fromJson(Map<String, dynamic> jsonSerialization) {
    return Test(
      id: jsonSerialization['id'] as int?,
      title: jsonSerialization['title'] as String,
      creatorId: jsonSerialization['creatorId'] as int,
      creator: jsonSerialization['creator'] == null
          ? null
          : _i5.Protocol().deserialize<_i2.User>(jsonSerialization['creator']),
      attempt: jsonSerialization['attempt'] == null
          ? null
          : _i5.Protocol().deserialize<List<_i3.Attempt>>(
              jsonSerialization['attempt'],
            ),
      question: jsonSerialization['question'] == null
          ? null
          : _i5.Protocol().deserialize<List<_i4.Question>>(
              jsonSerialization['question'],
            ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String title;

  int creatorId;

  _i2.User? creator;

  List<_i3.Attempt>? attempt;

  List<_i4.Question>? question;

  /// Returns a shallow copy of this [Test]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Test copyWith({
    int? id,
    String? title,
    int? creatorId,
    _i2.User? creator,
    List<_i3.Attempt>? attempt,
    List<_i4.Question>? question,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Test',
      if (id != null) 'id': id,
      'title': title,
      'creatorId': creatorId,
      if (creator != null) 'creator': creator?.toJson(),
      if (attempt != null)
        'attempt': attempt?.toJson(valueToJson: (v) => v.toJson()),
      if (question != null)
        'question': question?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TestImpl extends Test {
  _TestImpl({
    int? id,
    required String title,
    required int creatorId,
    _i2.User? creator,
    List<_i3.Attempt>? attempt,
    List<_i4.Question>? question,
  }) : super._(
         id: id,
         title: title,
         creatorId: creatorId,
         creator: creator,
         attempt: attempt,
         question: question,
       );

  /// Returns a shallow copy of this [Test]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Test copyWith({
    Object? id = _Undefined,
    String? title,
    int? creatorId,
    Object? creator = _Undefined,
    Object? attempt = _Undefined,
    Object? question = _Undefined,
  }) {
    return Test(
      id: id is int? ? id : this.id,
      title: title ?? this.title,
      creatorId: creatorId ?? this.creatorId,
      creator: creator is _i2.User? ? creator : this.creator?.copyWith(),
      attempt: attempt is List<_i3.Attempt>?
          ? attempt
          : this.attempt?.map((e0) => e0.copyWith()).toList(),
      question: question is List<_i4.Question>?
          ? question
          : this.question?.map((e0) => e0.copyWith()).toList(),
    );
  }
}
