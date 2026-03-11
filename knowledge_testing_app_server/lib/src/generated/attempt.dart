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
import 'result.dart' as _i4;
import 'answer_attempt.dart' as _i5;
import 'certificate.dart' as _i6;
import 'package:knowledge_testing_app_server/src/generated/protocol.dart'
    as _i7;

abstract class Attempt
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Attempt._({
    this.id,
    required this.userId,
    this.user,
    required this.testId,
    this.test,
    this.result,
    this.answerAttempt,
    this.certificates,
  });

  factory Attempt({
    int? id,
    required int userId,
    _i2.User? user,
    required int testId,
    _i3.Test? test,
    _i4.Result? result,
    List<_i5.AnswerAttempt>? answerAttempt,
    List<_i6.Certificate>? certificates,
  }) = _AttemptImpl;

  factory Attempt.fromJson(Map<String, dynamic> jsonSerialization) {
    return Attempt(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      user: jsonSerialization['user'] == null
          ? null
          : _i7.Protocol().deserialize<_i2.User>(jsonSerialization['user']),
      testId: jsonSerialization['testId'] as int,
      test: jsonSerialization['test'] == null
          ? null
          : _i7.Protocol().deserialize<_i3.Test>(jsonSerialization['test']),
      result: jsonSerialization['result'] == null
          ? null
          : _i7.Protocol().deserialize<_i4.Result>(jsonSerialization['result']),
      answerAttempt: jsonSerialization['answerAttempt'] == null
          ? null
          : _i7.Protocol().deserialize<List<_i5.AnswerAttempt>>(
              jsonSerialization['answerAttempt'],
            ),
      certificates: jsonSerialization['certificates'] == null
          ? null
          : _i7.Protocol().deserialize<List<_i6.Certificate>>(
              jsonSerialization['certificates'],
            ),
    );
  }

  static final t = AttemptTable();

  static const db = AttemptRepository._();

  @override
  int? id;

  int userId;

  _i2.User? user;

  int testId;

  _i3.Test? test;

  _i4.Result? result;

  List<_i5.AnswerAttempt>? answerAttempt;

  List<_i6.Certificate>? certificates;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Attempt]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Attempt copyWith({
    int? id,
    int? userId,
    _i2.User? user,
    int? testId,
    _i3.Test? test,
    _i4.Result? result,
    List<_i5.AnswerAttempt>? answerAttempt,
    List<_i6.Certificate>? certificates,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Attempt',
      if (id != null) 'id': id,
      'userId': userId,
      if (user != null) 'user': user?.toJson(),
      'testId': testId,
      if (test != null) 'test': test?.toJson(),
      if (result != null) 'result': result?.toJson(),
      if (answerAttempt != null)
        'answerAttempt': answerAttempt?.toJson(valueToJson: (v) => v.toJson()),
      if (certificates != null)
        'certificates': certificates?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Attempt',
      if (id != null) 'id': id,
      'userId': userId,
      if (user != null) 'user': user?.toJsonForProtocol(),
      'testId': testId,
      if (test != null) 'test': test?.toJsonForProtocol(),
      if (result != null) 'result': result?.toJsonForProtocol(),
      if (answerAttempt != null)
        'answerAttempt': answerAttempt?.toJson(
          valueToJson: (v) => v.toJsonForProtocol(),
        ),
      if (certificates != null)
        'certificates': certificates?.toJson(
          valueToJson: (v) => v.toJsonForProtocol(),
        ),
    };
  }

  static AttemptInclude include({
    _i2.UserInclude? user,
    _i3.TestInclude? test,
    _i4.ResultInclude? result,
    _i5.AnswerAttemptIncludeList? answerAttempt,
    _i6.CertificateIncludeList? certificates,
  }) {
    return AttemptInclude._(
      user: user,
      test: test,
      result: result,
      answerAttempt: answerAttempt,
      certificates: certificates,
    );
  }

  static AttemptIncludeList includeList({
    _i1.WhereExpressionBuilder<AttemptTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AttemptTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AttemptTable>? orderByList,
    AttemptInclude? include,
  }) {
    return AttemptIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Attempt.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Attempt.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AttemptImpl extends Attempt {
  _AttemptImpl({
    int? id,
    required int userId,
    _i2.User? user,
    required int testId,
    _i3.Test? test,
    _i4.Result? result,
    List<_i5.AnswerAttempt>? answerAttempt,
    List<_i6.Certificate>? certificates,
  }) : super._(
         id: id,
         userId: userId,
         user: user,
         testId: testId,
         test: test,
         result: result,
         answerAttempt: answerAttempt,
         certificates: certificates,
       );

  /// Returns a shallow copy of this [Attempt]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Attempt copyWith({
    Object? id = _Undefined,
    int? userId,
    Object? user = _Undefined,
    int? testId,
    Object? test = _Undefined,
    Object? result = _Undefined,
    Object? answerAttempt = _Undefined,
    Object? certificates = _Undefined,
  }) {
    return Attempt(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      user: user is _i2.User? ? user : this.user?.copyWith(),
      testId: testId ?? this.testId,
      test: test is _i3.Test? ? test : this.test?.copyWith(),
      result: result is _i4.Result? ? result : this.result?.copyWith(),
      answerAttempt: answerAttempt is List<_i5.AnswerAttempt>?
          ? answerAttempt
          : this.answerAttempt?.map((e0) => e0.copyWith()).toList(),
      certificates: certificates is List<_i6.Certificate>?
          ? certificates
          : this.certificates?.map((e0) => e0.copyWith()).toList(),
    );
  }
}

class AttemptUpdateTable extends _i1.UpdateTable<AttemptTable> {
  AttemptUpdateTable(super.table);

  _i1.ColumnValue<int, int> userId(int value) => _i1.ColumnValue(
    table.userId,
    value,
  );

  _i1.ColumnValue<int, int> testId(int value) => _i1.ColumnValue(
    table.testId,
    value,
  );
}

class AttemptTable extends _i1.Table<int?> {
  AttemptTable({super.tableRelation}) : super(tableName: 'attempt') {
    updateTable = AttemptUpdateTable(this);
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    testId = _i1.ColumnInt(
      'testId',
      this,
    );
  }

  late final AttemptUpdateTable updateTable;

  late final _i1.ColumnInt userId;

  _i2.UserTable? _user;

  late final _i1.ColumnInt testId;

  _i3.TestTable? _test;

  _i4.ResultTable? _result;

  _i5.AnswerAttemptTable? ___answerAttempt;

  _i1.ManyRelation<_i5.AnswerAttemptTable>? _answerAttempt;

  _i6.CertificateTable? ___certificates;

  _i1.ManyRelation<_i6.CertificateTable>? _certificates;

  _i2.UserTable get user {
    if (_user != null) return _user!;
    _user = _i1.createRelationTable(
      relationFieldName: 'user',
      field: Attempt.t.userId,
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
      field: Attempt.t.testId,
      foreignField: _i3.Test.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.TestTable(tableRelation: foreignTableRelation),
    );
    return _test!;
  }

  _i4.ResultTable get result {
    if (_result != null) return _result!;
    _result = _i1.createRelationTable(
      relationFieldName: 'result',
      field: Attempt.t.id,
      foreignField: _i4.Result.t.attemptId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.ResultTable(tableRelation: foreignTableRelation),
    );
    return _result!;
  }

  _i5.AnswerAttemptTable get __answerAttempt {
    if (___answerAttempt != null) return ___answerAttempt!;
    ___answerAttempt = _i1.createRelationTable(
      relationFieldName: '__answerAttempt',
      field: Attempt.t.id,
      foreignField: _i5.AnswerAttempt.t.attemptId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i5.AnswerAttemptTable(tableRelation: foreignTableRelation),
    );
    return ___answerAttempt!;
  }

  _i6.CertificateTable get __certificates {
    if (___certificates != null) return ___certificates!;
    ___certificates = _i1.createRelationTable(
      relationFieldName: '__certificates',
      field: Attempt.t.id,
      foreignField: _i6.Certificate.t.attemptId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i6.CertificateTable(tableRelation: foreignTableRelation),
    );
    return ___certificates!;
  }

  _i1.ManyRelation<_i5.AnswerAttemptTable> get answerAttempt {
    if (_answerAttempt != null) return _answerAttempt!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'answerAttempt',
      field: Attempt.t.id,
      foreignField: _i5.AnswerAttempt.t.attemptId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i5.AnswerAttemptTable(tableRelation: foreignTableRelation),
    );
    _answerAttempt = _i1.ManyRelation<_i5.AnswerAttemptTable>(
      tableWithRelations: relationTable,
      table: _i5.AnswerAttemptTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _answerAttempt!;
  }

  _i1.ManyRelation<_i6.CertificateTable> get certificates {
    if (_certificates != null) return _certificates!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'certificates',
      field: Attempt.t.id,
      foreignField: _i6.Certificate.t.attemptId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i6.CertificateTable(tableRelation: foreignTableRelation),
    );
    _certificates = _i1.ManyRelation<_i6.CertificateTable>(
      tableWithRelations: relationTable,
      table: _i6.CertificateTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _certificates!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    userId,
    testId,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'user') {
      return user;
    }
    if (relationField == 'test') {
      return test;
    }
    if (relationField == 'result') {
      return result;
    }
    if (relationField == 'answerAttempt') {
      return __answerAttempt;
    }
    if (relationField == 'certificates') {
      return __certificates;
    }
    return null;
  }
}

class AttemptInclude extends _i1.IncludeObject {
  AttemptInclude._({
    _i2.UserInclude? user,
    _i3.TestInclude? test,
    _i4.ResultInclude? result,
    _i5.AnswerAttemptIncludeList? answerAttempt,
    _i6.CertificateIncludeList? certificates,
  }) {
    _user = user;
    _test = test;
    _result = result;
    _answerAttempt = answerAttempt;
    _certificates = certificates;
  }

  _i2.UserInclude? _user;

  _i3.TestInclude? _test;

  _i4.ResultInclude? _result;

  _i5.AnswerAttemptIncludeList? _answerAttempt;

  _i6.CertificateIncludeList? _certificates;

  @override
  Map<String, _i1.Include?> get includes => {
    'user': _user,
    'test': _test,
    'result': _result,
    'answerAttempt': _answerAttempt,
    'certificates': _certificates,
  };

  @override
  _i1.Table<int?> get table => Attempt.t;
}

class AttemptIncludeList extends _i1.IncludeList {
  AttemptIncludeList._({
    _i1.WhereExpressionBuilder<AttemptTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Attempt.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Attempt.t;
}

class AttemptRepository {
  const AttemptRepository._();

  final attach = const AttemptAttachRepository._();

  final attachRow = const AttemptAttachRowRepository._();

  final detach = const AttemptDetachRepository._();

  final detachRow = const AttemptDetachRowRepository._();

  /// Returns a list of [Attempt]s matching the given query parameters.
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
  Future<List<Attempt>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AttemptTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AttemptTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AttemptTable>? orderByList,
    _i1.Transaction? transaction,
    AttemptInclude? include,
  }) async {
    return session.db.find<Attempt>(
      where: where?.call(Attempt.t),
      orderBy: orderBy?.call(Attempt.t),
      orderByList: orderByList?.call(Attempt.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Attempt] matching the given query parameters.
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
  Future<Attempt?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AttemptTable>? where,
    int? offset,
    _i1.OrderByBuilder<AttemptTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AttemptTable>? orderByList,
    _i1.Transaction? transaction,
    AttemptInclude? include,
  }) async {
    return session.db.findFirstRow<Attempt>(
      where: where?.call(Attempt.t),
      orderBy: orderBy?.call(Attempt.t),
      orderByList: orderByList?.call(Attempt.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Attempt] by its [id] or null if no such row exists.
  Future<Attempt?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    AttemptInclude? include,
  }) async {
    return session.db.findById<Attempt>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Attempt]s in the list and returns the inserted rows.
  ///
  /// The returned [Attempt]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Attempt>> insert(
    _i1.Session session,
    List<Attempt> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Attempt>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Attempt] and returns the inserted row.
  ///
  /// The returned [Attempt] will have its `id` field set.
  Future<Attempt> insertRow(
    _i1.Session session,
    Attempt row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Attempt>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Attempt]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Attempt>> update(
    _i1.Session session,
    List<Attempt> rows, {
    _i1.ColumnSelections<AttemptTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Attempt>(
      rows,
      columns: columns?.call(Attempt.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Attempt]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Attempt> updateRow(
    _i1.Session session,
    Attempt row, {
    _i1.ColumnSelections<AttemptTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Attempt>(
      row,
      columns: columns?.call(Attempt.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Attempt] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Attempt?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<AttemptUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Attempt>(
      id,
      columnValues: columnValues(Attempt.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Attempt]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Attempt>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<AttemptUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<AttemptTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AttemptTable>? orderBy,
    _i1.OrderByListBuilder<AttemptTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Attempt>(
      columnValues: columnValues(Attempt.t.updateTable),
      where: where(Attempt.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Attempt.t),
      orderByList: orderByList?.call(Attempt.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Attempt]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Attempt>> delete(
    _i1.Session session,
    List<Attempt> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Attempt>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Attempt].
  Future<Attempt> deleteRow(
    _i1.Session session,
    Attempt row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Attempt>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Attempt>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<AttemptTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Attempt>(
      where: where(Attempt.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AttemptTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Attempt>(
      where: where?.call(Attempt.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class AttemptAttachRepository {
  const AttemptAttachRepository._();

  /// Creates a relation between this [Attempt] and the given [AnswerAttempt]s
  /// by setting each [AnswerAttempt]'s foreign key `attemptId` to refer to this [Attempt].
  Future<void> answerAttempt(
    _i1.Session session,
    Attempt attempt,
    List<_i5.AnswerAttempt> answerAttempt, {
    _i1.Transaction? transaction,
  }) async {
    if (answerAttempt.any((e) => e.id == null)) {
      throw ArgumentError.notNull('answerAttempt.id');
    }
    if (attempt.id == null) {
      throw ArgumentError.notNull('attempt.id');
    }

    var $answerAttempt = answerAttempt
        .map((e) => e.copyWith(attemptId: attempt.id))
        .toList();
    await session.db.update<_i5.AnswerAttempt>(
      $answerAttempt,
      columns: [_i5.AnswerAttempt.t.attemptId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Attempt] and the given [Certificate]s
  /// by setting each [Certificate]'s foreign key `attemptId` to refer to this [Attempt].
  Future<void> certificates(
    _i1.Session session,
    Attempt attempt,
    List<_i6.Certificate> certificate, {
    _i1.Transaction? transaction,
  }) async {
    if (certificate.any((e) => e.id == null)) {
      throw ArgumentError.notNull('certificate.id');
    }
    if (attempt.id == null) {
      throw ArgumentError.notNull('attempt.id');
    }

    var $certificate = certificate
        .map((e) => e.copyWith(attemptId: attempt.id))
        .toList();
    await session.db.update<_i6.Certificate>(
      $certificate,
      columns: [_i6.Certificate.t.attemptId],
      transaction: transaction,
    );
  }
}

class AttemptAttachRowRepository {
  const AttemptAttachRowRepository._();

  /// Creates a relation between the given [Attempt] and [User]
  /// by setting the [Attempt]'s foreign key `userId` to refer to the [User].
  Future<void> user(
    _i1.Session session,
    Attempt attempt,
    _i2.User user, {
    _i1.Transaction? transaction,
  }) async {
    if (attempt.id == null) {
      throw ArgumentError.notNull('attempt.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $attempt = attempt.copyWith(userId: user.id);
    await session.db.updateRow<Attempt>(
      $attempt,
      columns: [Attempt.t.userId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [Attempt] and [Test]
  /// by setting the [Attempt]'s foreign key `testId` to refer to the [Test].
  Future<void> test(
    _i1.Session session,
    Attempt attempt,
    _i3.Test test, {
    _i1.Transaction? transaction,
  }) async {
    if (attempt.id == null) {
      throw ArgumentError.notNull('attempt.id');
    }
    if (test.id == null) {
      throw ArgumentError.notNull('test.id');
    }

    var $attempt = attempt.copyWith(testId: test.id);
    await session.db.updateRow<Attempt>(
      $attempt,
      columns: [Attempt.t.testId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [Attempt] and [Result]
  /// by setting the [Attempt]'s foreign key `id` to refer to the [Result].
  Future<void> result(
    _i1.Session session,
    Attempt attempt,
    _i4.Result result, {
    _i1.Transaction? transaction,
  }) async {
    if (result.id == null) {
      throw ArgumentError.notNull('result.id');
    }
    if (attempt.id == null) {
      throw ArgumentError.notNull('attempt.id');
    }

    var $result = result.copyWith(attemptId: attempt.id);
    await session.db.updateRow<_i4.Result>(
      $result,
      columns: [_i4.Result.t.attemptId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Attempt] and the given [AnswerAttempt]
  /// by setting the [AnswerAttempt]'s foreign key `attemptId` to refer to this [Attempt].
  Future<void> answerAttempt(
    _i1.Session session,
    Attempt attempt,
    _i5.AnswerAttempt answerAttempt, {
    _i1.Transaction? transaction,
  }) async {
    if (answerAttempt.id == null) {
      throw ArgumentError.notNull('answerAttempt.id');
    }
    if (attempt.id == null) {
      throw ArgumentError.notNull('attempt.id');
    }

    var $answerAttempt = answerAttempt.copyWith(attemptId: attempt.id);
    await session.db.updateRow<_i5.AnswerAttempt>(
      $answerAttempt,
      columns: [_i5.AnswerAttempt.t.attemptId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Attempt] and the given [Certificate]
  /// by setting the [Certificate]'s foreign key `attemptId` to refer to this [Attempt].
  Future<void> certificates(
    _i1.Session session,
    Attempt attempt,
    _i6.Certificate certificate, {
    _i1.Transaction? transaction,
  }) async {
    if (certificate.id == null) {
      throw ArgumentError.notNull('certificate.id');
    }
    if (attempt.id == null) {
      throw ArgumentError.notNull('attempt.id');
    }

    var $certificate = certificate.copyWith(attemptId: attempt.id);
    await session.db.updateRow<_i6.Certificate>(
      $certificate,
      columns: [_i6.Certificate.t.attemptId],
      transaction: transaction,
    );
  }
}

class AttemptDetachRepository {
  const AttemptDetachRepository._();

  /// Detaches the relation between this [Attempt] and the given [Certificate]
  /// by setting the [Certificate]'s foreign key `attemptId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> certificates(
    _i1.Session session,
    List<_i6.Certificate> certificate, {
    _i1.Transaction? transaction,
  }) async {
    if (certificate.any((e) => e.id == null)) {
      throw ArgumentError.notNull('certificate.id');
    }

    var $certificate = certificate
        .map((e) => e.copyWith(attemptId: null))
        .toList();
    await session.db.update<_i6.Certificate>(
      $certificate,
      columns: [_i6.Certificate.t.attemptId],
      transaction: transaction,
    );
  }
}

class AttemptDetachRowRepository {
  const AttemptDetachRowRepository._();

  /// Detaches the relation between this [Attempt] and the [Result] set in `result`
  /// by setting the [Attempt]'s foreign key `id` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> result(
    _i1.Session session,
    Attempt attempt, {
    _i1.Transaction? transaction,
  }) async {
    var $result = attempt.result;

    if ($result == null) {
      throw ArgumentError.notNull('attempt.result');
    }
    if ($result.id == null) {
      throw ArgumentError.notNull('attempt.result.id');
    }
    if (attempt.id == null) {
      throw ArgumentError.notNull('attempt.id');
    }

    var $$result = $result.copyWith(attemptId: null);
    await session.db.updateRow<_i4.Result>(
      $$result,
      columns: [_i4.Result.t.attemptId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [Attempt] and the given [Certificate]
  /// by setting the [Certificate]'s foreign key `attemptId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> certificates(
    _i1.Session session,
    _i6.Certificate certificate, {
    _i1.Transaction? transaction,
  }) async {
    if (certificate.id == null) {
      throw ArgumentError.notNull('certificate.id');
    }

    var $certificate = certificate.copyWith(attemptId: null);
    await session.db.updateRow<_i6.Certificate>(
      $certificate,
      columns: [_i6.Certificate.t.attemptId],
      transaction: transaction,
    );
  }
}
