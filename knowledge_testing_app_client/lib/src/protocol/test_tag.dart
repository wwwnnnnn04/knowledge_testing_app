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
import 'tag.dart' as _i3;
import 'package:knowledge_testing_app_client/src/protocol/protocol.dart' as _i4;

abstract class TestTag implements _i1.SerializableModel {
  TestTag._({
    this.id,
    required this.testId,
    this.test,
    required this.tagId,
    this.tag,
  });

  factory TestTag({
    int? id,
    required int testId,
    _i2.Test? test,
    required int tagId,
    _i3.Tag? tag,
  }) = _TestTagImpl;

  factory TestTag.fromJson(Map<String, dynamic> jsonSerialization) {
    return TestTag(
      id: jsonSerialization['id'] as int?,
      testId: jsonSerialization['testId'] as int,
      test: jsonSerialization['test'] == null
          ? null
          : _i4.Protocol().deserialize<_i2.Test>(jsonSerialization['test']),
      tagId: jsonSerialization['tagId'] as int,
      tag: jsonSerialization['tag'] == null
          ? null
          : _i4.Protocol().deserialize<_i3.Tag>(jsonSerialization['tag']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int testId;

  _i2.Test? test;

  int tagId;

  _i3.Tag? tag;

  /// Returns a shallow copy of this [TestTag]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  TestTag copyWith({
    int? id,
    int? testId,
    _i2.Test? test,
    int? tagId,
    _i3.Tag? tag,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'TestTag',
      if (id != null) 'id': id,
      'testId': testId,
      if (test != null) 'test': test?.toJson(),
      'tagId': tagId,
      if (tag != null) 'tag': tag?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TestTagImpl extends TestTag {
  _TestTagImpl({
    int? id,
    required int testId,
    _i2.Test? test,
    required int tagId,
    _i3.Tag? tag,
  }) : super._(
         id: id,
         testId: testId,
         test: test,
         tagId: tagId,
         tag: tag,
       );

  /// Returns a shallow copy of this [TestTag]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  TestTag copyWith({
    Object? id = _Undefined,
    int? testId,
    Object? test = _Undefined,
    int? tagId,
    Object? tag = _Undefined,
  }) {
    return TestTag(
      id: id is int? ? id : this.id,
      testId: testId ?? this.testId,
      test: test is _i2.Test? ? test : this.test?.copyWith(),
      tagId: tagId ?? this.tagId,
      tag: tag is _i3.Tag? ? tag : this.tag?.copyWith(),
    );
  }
}
