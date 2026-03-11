/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: unnecessary_null_comparison

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'role.dart' as _i2;
import 'test.dart' as _i3;
import 'attempt.dart' as _i4;
import 'certificate.dart' as _i5;
import 'package:knowledge_testing_app_server/src/generated/protocol.dart'
    as _i6;

abstract class User implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = UserTable();

  static const db = UserRepository._();

  @override
  int? id;

  String username;

  String email;

  String password;

  _i2.Role role;

  List<_i3.Test>? test;

  List<_i4.Attempt>? attempt;

  List<_i5.Certificate>? certificates;

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'User',
      if (id != null) 'id': id,
      'username': username,
      'email': email,
      'password': password,
      'role': role.toJson(),
      if (test != null)
        'test': test?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (attempt != null)
        'attempt': attempt?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (certificates != null)
        'certificates': certificates?.toJson(
          valueToJson: (v) => v.toJsonForProtocol(),
        ),
    };
  }

  static UserInclude include({
    _i3.TestIncludeList? test,
    _i4.AttemptIncludeList? attempt,
    _i5.CertificateIncludeList? certificates,
  }) {
    return UserInclude._(
      test: test,
      attempt: attempt,
      certificates: certificates,
    );
  }

  static UserIncludeList includeList({
    _i1.WhereExpressionBuilder<UserTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserTable>? orderByList,
    UserInclude? include,
  }) {
    return UserIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(User.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(User.t),
      include: include,
    );
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

class UserUpdateTable extends _i1.UpdateTable<UserTable> {
  UserUpdateTable(super.table);

  _i1.ColumnValue<String, String> username(String value) => _i1.ColumnValue(
    table.username,
    value,
  );

  _i1.ColumnValue<String, String> email(String value) => _i1.ColumnValue(
    table.email,
    value,
  );

  _i1.ColumnValue<String, String> password(String value) => _i1.ColumnValue(
    table.password,
    value,
  );

  _i1.ColumnValue<_i2.Role, _i2.Role> role(_i2.Role value) => _i1.ColumnValue(
    table.role,
    value,
  );
}

class UserTable extends _i1.Table<int?> {
  UserTable({super.tableRelation}) : super(tableName: 'user') {
    updateTable = UserUpdateTable(this);
    username = _i1.ColumnString(
      'username',
      this,
    );
    email = _i1.ColumnString(
      'email',
      this,
    );
    password = _i1.ColumnString(
      'password',
      this,
    );
    role = _i1.ColumnEnum(
      'role',
      this,
      _i1.EnumSerialization.byName,
    );
  }

  late final UserUpdateTable updateTable;

  late final _i1.ColumnString username;

  late final _i1.ColumnString email;

  late final _i1.ColumnString password;

  late final _i1.ColumnEnum<_i2.Role> role;

  _i3.TestTable? ___test;

  _i1.ManyRelation<_i3.TestTable>? _test;

  _i4.AttemptTable? ___attempt;

  _i1.ManyRelation<_i4.AttemptTable>? _attempt;

  _i5.CertificateTable? ___certificates;

  _i1.ManyRelation<_i5.CertificateTable>? _certificates;

  _i3.TestTable get __test {
    if (___test != null) return ___test!;
    ___test = _i1.createRelationTable(
      relationFieldName: '__test',
      field: User.t.id,
      foreignField: _i3.Test.t.creatorId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.TestTable(tableRelation: foreignTableRelation),
    );
    return ___test!;
  }

  _i4.AttemptTable get __attempt {
    if (___attempt != null) return ___attempt!;
    ___attempt = _i1.createRelationTable(
      relationFieldName: '__attempt',
      field: User.t.id,
      foreignField: _i4.Attempt.t.userId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.AttemptTable(tableRelation: foreignTableRelation),
    );
    return ___attempt!;
  }

  _i5.CertificateTable get __certificates {
    if (___certificates != null) return ___certificates!;
    ___certificates = _i1.createRelationTable(
      relationFieldName: '__certificates',
      field: User.t.id,
      foreignField: _i5.Certificate.t.userId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i5.CertificateTable(tableRelation: foreignTableRelation),
    );
    return ___certificates!;
  }

  _i1.ManyRelation<_i3.TestTable> get test {
    if (_test != null) return _test!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'test',
      field: User.t.id,
      foreignField: _i3.Test.t.creatorId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.TestTable(tableRelation: foreignTableRelation),
    );
    _test = _i1.ManyRelation<_i3.TestTable>(
      tableWithRelations: relationTable,
      table: _i3.TestTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _test!;
  }

  _i1.ManyRelation<_i4.AttemptTable> get attempt {
    if (_attempt != null) return _attempt!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'attempt',
      field: User.t.id,
      foreignField: _i4.Attempt.t.userId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.AttemptTable(tableRelation: foreignTableRelation),
    );
    _attempt = _i1.ManyRelation<_i4.AttemptTable>(
      tableWithRelations: relationTable,
      table: _i4.AttemptTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _attempt!;
  }

  _i1.ManyRelation<_i5.CertificateTable> get certificates {
    if (_certificates != null) return _certificates!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'certificates',
      field: User.t.id,
      foreignField: _i5.Certificate.t.userId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i5.CertificateTable(tableRelation: foreignTableRelation),
    );
    _certificates = _i1.ManyRelation<_i5.CertificateTable>(
      tableWithRelations: relationTable,
      table: _i5.CertificateTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _certificates!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    username,
    email,
    password,
    role,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'test') {
      return __test;
    }
    if (relationField == 'attempt') {
      return __attempt;
    }
    if (relationField == 'certificates') {
      return __certificates;
    }
    return null;
  }
}

class UserInclude extends _i1.IncludeObject {
  UserInclude._({
    _i3.TestIncludeList? test,
    _i4.AttemptIncludeList? attempt,
    _i5.CertificateIncludeList? certificates,
  }) {
    _test = test;
    _attempt = attempt;
    _certificates = certificates;
  }

  _i3.TestIncludeList? _test;

  _i4.AttemptIncludeList? _attempt;

  _i5.CertificateIncludeList? _certificates;

  @override
  Map<String, _i1.Include?> get includes => {
    'test': _test,
    'attempt': _attempt,
    'certificates': _certificates,
  };

  @override
  _i1.Table<int?> get table => User.t;
}

class UserIncludeList extends _i1.IncludeList {
  UserIncludeList._({
    _i1.WhereExpressionBuilder<UserTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(User.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => User.t;
}

class UserRepository {
  const UserRepository._();

  final attach = const UserAttachRepository._();

  final attachRow = const UserAttachRowRepository._();

  /// Returns a list of [User]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<User>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserTable>? orderByList,
    _i1.Transaction? transaction,
    UserInclude? include,
  }) async {
    return session.db.find<User>(
      where: where?.call(User.t),
      orderBy: orderBy?.call(User.t),
      orderByList: orderByList?.call(User.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [User] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<User?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserTable>? where,
    int? offset,
    _i1.OrderByBuilder<UserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserTable>? orderByList,
    _i1.Transaction? transaction,
    UserInclude? include,
  }) async {
    return session.db.findFirstRow<User>(
      where: where?.call(User.t),
      orderBy: orderBy?.call(User.t),
      orderByList: orderByList?.call(User.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [User] by its [id] or null if no such row exists.
  Future<User?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    UserInclude? include,
  }) async {
    return session.db.findById<User>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [User]s in the list and returns the inserted rows.
  ///
  /// The returned [User]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<User>> insert(
    _i1.Session session,
    List<User> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<User>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [User] and returns the inserted row.
  ///
  /// The returned [User] will have its `id` field set.
  Future<User> insertRow(
    _i1.Session session,
    User row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<User>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [User]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<User>> update(
    _i1.Session session,
    List<User> rows, {
    _i1.ColumnSelections<UserTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<User>(
      rows,
      columns: columns?.call(User.t),
      transaction: transaction,
    );
  }

  /// Updates a single [User]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<User> updateRow(
    _i1.Session session,
    User row, {
    _i1.ColumnSelections<UserTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<User>(
      row,
      columns: columns?.call(User.t),
      transaction: transaction,
    );
  }

  /// Updates a single [User] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<User?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<UserUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<User>(
      id,
      columnValues: columnValues(User.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [User]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<User>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<UserUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<UserTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserTable>? orderBy,
    _i1.OrderByListBuilder<UserTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<User>(
      columnValues: columnValues(User.t.updateTable),
      where: where(User.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(User.t),
      orderByList: orderByList?.call(User.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [User]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<User>> delete(
    _i1.Session session,
    List<User> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<User>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [User].
  Future<User> deleteRow(
    _i1.Session session,
    User row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<User>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<User>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<UserTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<User>(
      where: where(User.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<User>(
      where: where?.call(User.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class UserAttachRepository {
  const UserAttachRepository._();

  /// Creates a relation between this [User] and the given [Test]s
  /// by setting each [Test]'s foreign key `creatorId` to refer to this [User].
  Future<void> test(
    _i1.Session session,
    User user,
    List<_i3.Test> test, {
    _i1.Transaction? transaction,
  }) async {
    if (test.any((e) => e.id == null)) {
      throw ArgumentError.notNull('test.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $test = test.map((e) => e.copyWith(creatorId: user.id)).toList();
    await session.db.update<_i3.Test>(
      $test,
      columns: [_i3.Test.t.creatorId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [User] and the given [Attempt]s
  /// by setting each [Attempt]'s foreign key `userId` to refer to this [User].
  Future<void> attempt(
    _i1.Session session,
    User user,
    List<_i4.Attempt> attempt, {
    _i1.Transaction? transaction,
  }) async {
    if (attempt.any((e) => e.id == null)) {
      throw ArgumentError.notNull('attempt.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $attempt = attempt.map((e) => e.copyWith(userId: user.id)).toList();
    await session.db.update<_i4.Attempt>(
      $attempt,
      columns: [_i4.Attempt.t.userId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [User] and the given [Certificate]s
  /// by setting each [Certificate]'s foreign key `userId` to refer to this [User].
  Future<void> certificates(
    _i1.Session session,
    User user,
    List<_i5.Certificate> certificate, {
    _i1.Transaction? transaction,
  }) async {
    if (certificate.any((e) => e.id == null)) {
      throw ArgumentError.notNull('certificate.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $certificate = certificate
        .map((e) => e.copyWith(userId: user.id))
        .toList();
    await session.db.update<_i5.Certificate>(
      $certificate,
      columns: [_i5.Certificate.t.userId],
      transaction: transaction,
    );
  }
}

class UserAttachRowRepository {
  const UserAttachRowRepository._();

  /// Creates a relation between this [User] and the given [Test]
  /// by setting the [Test]'s foreign key `creatorId` to refer to this [User].
  Future<void> test(
    _i1.Session session,
    User user,
    _i3.Test test, {
    _i1.Transaction? transaction,
  }) async {
    if (test.id == null) {
      throw ArgumentError.notNull('test.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $test = test.copyWith(creatorId: user.id);
    await session.db.updateRow<_i3.Test>(
      $test,
      columns: [_i3.Test.t.creatorId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [User] and the given [Attempt]
  /// by setting the [Attempt]'s foreign key `userId` to refer to this [User].
  Future<void> attempt(
    _i1.Session session,
    User user,
    _i4.Attempt attempt, {
    _i1.Transaction? transaction,
  }) async {
    if (attempt.id == null) {
      throw ArgumentError.notNull('attempt.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $attempt = attempt.copyWith(userId: user.id);
    await session.db.updateRow<_i4.Attempt>(
      $attempt,
      columns: [_i4.Attempt.t.userId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [User] and the given [Certificate]
  /// by setting the [Certificate]'s foreign key `userId` to refer to this [User].
  Future<void> certificates(
    _i1.Session session,
    User user,
    _i5.Certificate certificate, {
    _i1.Transaction? transaction,
  }) async {
    if (certificate.id == null) {
      throw ArgumentError.notNull('certificate.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $certificate = certificate.copyWith(userId: user.id);
    await session.db.updateRow<_i5.Certificate>(
      $certificate,
      columns: [_i5.Certificate.t.userId],
      transaction: transaction,
    );
  }
}
