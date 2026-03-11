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

abstract class Log implements _i1.SerializableModel {
  Log._({
    this.id,
    required this.userId,
    required this.action,
    required this.createdAt,
  });

  factory Log({
    int? id,
    required int userId,
    required String action,
    required DateTime createdAt,
  }) = _LogImpl;

  factory Log.fromJson(Map<String, dynamic> jsonSerialization) {
    return Log(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      action: jsonSerialization['action'] as String,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userId;

  String action;

  DateTime createdAt;

  /// Returns a shallow copy of this [Log]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Log copyWith({
    int? id,
    int? userId,
    String? action,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Log',
      if (id != null) 'id': id,
      'userId': userId,
      'action': action,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _LogImpl extends Log {
  _LogImpl({
    int? id,
    required int userId,
    required String action,
    required DateTime createdAt,
  }) : super._(
         id: id,
         userId: userId,
         action: action,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [Log]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Log copyWith({
    Object? id = _Undefined,
    int? userId,
    String? action,
    DateTime? createdAt,
  }) {
    return Log(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      action: action ?? this.action,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
