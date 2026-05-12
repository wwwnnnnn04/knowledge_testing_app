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
import 'role.dart' as _i2;
import 'test.dart' as _i3;
import 'attempt.dart' as _i4;
import 'certificate.dart' as _i5;
import 'package:knowledge_testing_app_client/src/protocol/protocol.dart' as _i6;

abstract class User implements _i1.SerializableModel {
  User._({
    this.id,
    required this.username,
    required this.email,
    required this.password,
    required this.role,
    this.test,
    this.attempt,
    this.certificates,
  });

  factory User({
    int? id,
    required String username,
    required String email,
    required String password,
    required _i2.Role role,
    List<_i3.Test>? test,
    List<_i4.Attempt>? attempt,
    List<_i5.Certificate>? certificates,
  }) = _UserImpl;

  factory User.fromJson(Map<String, dynamic> jsonSerialization) {
    return User(
      id: jsonSerialization['id'] as int?,
      username: jsonSerialization['username'] as String,
      email: jsonSerialization['email'] as String,
      password: jsonSerialization['password'] as String,
      role: _i2.Role.fromJson((jsonSerialization['role'] as String)),
      test: jsonSerialization['test'] == null
          ? null
          : _i6.Protocol().deserialize<List<_i3.Test>>(
              jsonSerialization['test'],
            ),
      attempt: jsonSerialization['attempt'] == null
          ? null
          : _i6.Protocol().deserialize<List<_i4.Attempt>>(
              jsonSerialization['attempt'],
            ),
      certificates: jsonSerialization['certificates'] == null
          ? null
          : _i6.Protocol().deserialize<List<_i5.Certificate>>(
              jsonSerialization['certificates'],
            ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String username;

  String email;

  String password;

  _i2.Role role;

  List<_i3.Test>? test;

  List<_i4.Attempt>? attempt;

  List<_i5.Certificate>? certificates;

  /// Returns a shallow copy of this [User]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  User copyWith({
    int? id,
    String? username,
    String? email,
    String? password,
    _i2.Role? role,
    List<_i3.Test>? test,
    List<_i4.Attempt>? attempt,
    List<_i5.Certificate>? certificates,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'User',
      if (id != null) 'id': id,
      'username': username,
      'email': email,
      'password': password,
      'role': role.toJson(),
      if (test != null) 'test': test?.toJson(valueToJson: (v) => v.toJson()),
      if (attempt != null)
        'attempt': attempt?.toJson(valueToJson: (v) => v.toJson()),
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

class _UserImpl extends User {
  _UserImpl({
    int? id,
    required String username,
    required String email,
    required String password,
    required _i2.Role role,
    List<_i3.Test>? test,
    List<_i4.Attempt>? attempt,
    List<_i5.Certificate>? certificates,
  }) : super._(
         id: id,
         username: username,
         email: email,
         password: password,
         role: role,
         test: test,
         attempt: attempt,
         certificates: certificates,
       );

  /// Returns a shallow copy of this [User]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  User copyWith({
    Object? id = _Undefined,
    String? username,
    String? email,
    String? password,
    _i2.Role? role,
    Object? test = _Undefined,
    Object? attempt = _Undefined,
    Object? certificates = _Undefined,
  }) {
    return User(
      id: id is int? ? id : this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      role: role ?? this.role,
      test: test is List<_i3.Test>?
          ? test
          : this.test?.map((e0) => e0.copyWith()).toList(),
      attempt: attempt is List<_i4.Attempt>?
          ? attempt
          : this.attempt?.map((e0) => e0.copyWith()).toList(),
      certificates: certificates is List<_i5.Certificate>?
          ? certificates
          : this.certificates?.map((e0) => e0.copyWith()).toList(),
    );
  }
}
