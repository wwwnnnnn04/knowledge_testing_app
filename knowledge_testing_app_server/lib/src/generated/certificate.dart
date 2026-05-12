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
import 'user.dart' as _i2;
import 'test.dart' as _i3;
import 'attempt.dart' as _i4;
import 'package:knowledge_testing_app_server/src/generated/protocol.dart'
    as _i5;

abstract class Certificate
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = CertificateTable();

  static const db = CertificateRepository._();

  @override
  int? id;

  int userId;

  _i2.User? user;

  int testId;

  _i3.Test? test;

  int attemptId;

  _i4.Attempt? attempt;

  double percentage;

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Certificate',
      if (id != null) 'id': id,
      'userId': userId,
      if (user != null) 'user': user?.toJsonForProtocol(),
      'testId': testId,
      if (test != null) 'test': test?.toJsonForProtocol(),
      'attemptId': attemptId,
      if (attempt != null) 'attempt': attempt?.toJsonForProtocol(),
      'percentage': percentage,
    };
  }

  static CertificateInclude include({
    _i2.UserInclude? user,
    _i3.TestInclude? test,
    _i4.AttemptInclude? attempt,
  }) {
    return CertificateInclude._(
      user: user,
      test: test,
      attempt: attempt,
    );
  }

  static CertificateIncludeList includeList({
    _i1.WhereExpressionBuilder<CertificateTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CertificateTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CertificateTable>? orderByList,
    CertificateInclude? include,
  }) {
    return CertificateIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Certificate.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Certificate.t),
      include: include,
    );
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

class CertificateUpdateTable extends _i1.UpdateTable<CertificateTable> {
  CertificateUpdateTable(super.table);

  _i1.ColumnValue<int, int> userId(int value) => _i1.ColumnValue(
    table.userId,
    value,
  );

  _i1.ColumnValue<int, int> testId(int value) => _i1.ColumnValue(
    table.testId,
    value,
  );

  _i1.ColumnValue<int, int> attemptId(int value) => _i1.ColumnValue(
    table.attemptId,
    value,
  );

  _i1.ColumnValue<double, double> percentage(double value) => _i1.ColumnValue(
    table.percentage,
    value,
  );
}

class CertificateTable extends _i1.Table<int?> {
  CertificateTable({super.tableRelation}) : super(tableName: 'certificate') {
    updateTable = CertificateUpdateTable(this);
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    testId = _i1.ColumnInt(
      'testId',
      this,
    );
    attemptId = _i1.ColumnInt(
      'attemptId',
      this,
    );
    percentage = _i1.ColumnDouble(
      'percentage',
      this,
    );
  }

  late final CertificateUpdateTable updateTable;

  late final _i1.ColumnInt userId;

  _i2.UserTable? _user;

  late final _i1.ColumnInt testId;

  _i3.TestTable? _test;

  late final _i1.ColumnInt attemptId;

  _i4.AttemptTable? _attempt;

  late final _i1.ColumnDouble percentage;

  _i2.UserTable get user {
    if (_user != null) return _user!;
    _user = _i1.createRelationTable(
      relationFieldName: 'user',
      field: Certificate.t.userId,
      foreignField: _i2.User.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserTable(tableRelation: foreignTableRelation),
    );
    return _user!;
  }

  _i3.TestTable get test {
    if (_test != null) return _test!;
    _test = _i1.createRelationTable(
      relationFieldName: 'test',
      field: Certificate.t.testId,
      foreignField: _i3.Test.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.TestTable(tableRelation: foreignTableRelation),
    );
    return _test!;
  }

  _i4.AttemptTable get attempt {
    if (_attempt != null) return _attempt!;
    _attempt = _i1.createRelationTable(
      relationFieldName: 'attempt',
      field: Certificate.t.attemptId,
      foreignField: _i4.Attempt.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.AttemptTable(tableRelation: foreignTableRelation),
    );
    return _attempt!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    userId,
    testId,
    attemptId,
    percentage,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'user') {
      return user;
    }
    if (relationField == 'test') {
      return test;
    }
    if (relationField == 'attempt') {
      return attempt;
    }
    return null;
  }
}

class CertificateInclude extends _i1.IncludeObject {
  CertificateInclude._({
    _i2.UserInclude? user,
    _i3.TestInclude? test,
    _i4.AttemptInclude? attempt,
  }) {
    _user = user;
    _test = test;
    _attempt = attempt;
  }

  _i2.UserInclude? _user;

  _i3.TestInclude? _test;

  _i4.AttemptInclude? _attempt;

  @override
  Map<String, _i1.Include?> get includes => {
    'user': _user,
    'test': _test,
    'attempt': _attempt,
  };

  @override
  _i1.Table<int?> get table => Certificate.t;
}

class CertificateIncludeList extends _i1.IncludeList {
  CertificateIncludeList._({
    _i1.WhereExpressionBuilder<CertificateTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Certificate.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Certificate.t;
}

class CertificateRepository {
  const CertificateRepository._();

  final attachRow = const CertificateAttachRowRepository._();

  /// Returns a list of [Certificate]s matching the given query parameters.
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
  Future<List<Certificate>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CertificateTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CertificateTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CertificateTable>? orderByList,
    _i1.Transaction? transaction,
    CertificateInclude? include,
  }) async {
    return session.db.find<Certificate>(
      where: where?.call(Certificate.t),
      orderBy: orderBy?.call(Certificate.t),
      orderByList: orderByList?.call(Certificate.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Certificate] matching the given query parameters.
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
  Future<Certificate?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CertificateTable>? where,
    int? offset,
    _i1.OrderByBuilder<CertificateTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CertificateTable>? orderByList,
    _i1.Transaction? transaction,
    CertificateInclude? include,
  }) async {
    return session.db.findFirstRow<Certificate>(
      where: where?.call(Certificate.t),
      orderBy: orderBy?.call(Certificate.t),
      orderByList: orderByList?.call(Certificate.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Certificate] by its [id] or null if no such row exists.
  Future<Certificate?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    CertificateInclude? include,
  }) async {
    return session.db.findById<Certificate>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Certificate]s in the list and returns the inserted rows.
  ///
  /// The returned [Certificate]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Certificate>> insert(
    _i1.Session session,
    List<Certificate> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Certificate>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Certificate] and returns the inserted row.
  ///
  /// The returned [Certificate] will have its `id` field set.
  Future<Certificate> insertRow(
    _i1.Session session,
    Certificate row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Certificate>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Certificate]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Certificate>> update(
    _i1.Session session,
    List<Certificate> rows, {
    _i1.ColumnSelections<CertificateTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Certificate>(
      rows,
      columns: columns?.call(Certificate.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Certificate]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Certificate> updateRow(
    _i1.Session session,
    Certificate row, {
    _i1.ColumnSelections<CertificateTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Certificate>(
      row,
      columns: columns?.call(Certificate.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Certificate] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Certificate?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<CertificateUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Certificate>(
      id,
      columnValues: columnValues(Certificate.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Certificate]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Certificate>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<CertificateUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<CertificateTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CertificateTable>? orderBy,
    _i1.OrderByListBuilder<CertificateTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Certificate>(
      columnValues: columnValues(Certificate.t.updateTable),
      where: where(Certificate.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Certificate.t),
      orderByList: orderByList?.call(Certificate.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Certificate]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Certificate>> delete(
    _i1.Session session,
    List<Certificate> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Certificate>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Certificate].
  Future<Certificate> deleteRow(
    _i1.Session session,
    Certificate row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Certificate>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Certificate>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<CertificateTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Certificate>(
      where: where(Certificate.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CertificateTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Certificate>(
      where: where?.call(Certificate.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class CertificateAttachRowRepository {
  const CertificateAttachRowRepository._();

  /// Creates a relation between the given [Certificate] and [User]
  /// by setting the [Certificate]'s foreign key `userId` to refer to the [User].
  Future<void> user(
    _i1.Session session,
    Certificate certificate,
    _i2.User user, {
    _i1.Transaction? transaction,
  }) async {
    if (certificate.id == null) {
      throw ArgumentError.notNull('certificate.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $certificate = certificate.copyWith(userId: user.id);
    await session.db.updateRow<Certificate>(
      $certificate,
      columns: [Certificate.t.userId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [Certificate] and [Test]
  /// by setting the [Certificate]'s foreign key `testId` to refer to the [Test].
  Future<void> test(
    _i1.Session session,
    Certificate certificate,
    _i3.Test test, {
    _i1.Transaction? transaction,
  }) async {
    if (certificate.id == null) {
      throw ArgumentError.notNull('certificate.id');
    }
    if (test.id == null) {
      throw ArgumentError.notNull('test.id');
    }

    var $certificate = certificate.copyWith(testId: test.id);
    await session.db.updateRow<Certificate>(
      $certificate,
      columns: [Certificate.t.testId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [Certificate] and [Attempt]
  /// by setting the [Certificate]'s foreign key `attemptId` to refer to the [Attempt].
  Future<void> attempt(
    _i1.Session session,
    Certificate certificate,
    _i4.Attempt attempt, {
    _i1.Transaction? transaction,
  }) async {
    if (certificate.id == null) {
      throw ArgumentError.notNull('certificate.id');
    }
    if (attempt.id == null) {
      throw ArgumentError.notNull('attempt.id');
    }

    var $certificate = certificate.copyWith(attemptId: attempt.id);
    await session.db.updateRow<Certificate>(
      $certificate,
      columns: [Certificate.t.attemptId],
      transaction: transaction,
    );
  }
}
