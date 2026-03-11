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
import 'attempt.dart' as _i2;
import 'package:knowledge_testing_app_server/src/generated/protocol.dart'
    as _i3;

abstract class Result implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Result._({
    this.id,
    required this.attemptId,
    this.attempt,
    required this.score,
    required this.maxScore,
    required this.percentage,
    required this.passed,
  });

  factory Result({
    int? id,
    required int attemptId,
    _i2.Attempt? attempt,
    required int score,
    required int maxScore,
    required double percentage,
    required bool passed,
  }) = _ResultImpl;

  factory Result.fromJson(Map<String, dynamic> jsonSerialization) {
    return Result(
      id: jsonSerialization['id'] as int?,
      attemptId: jsonSerialization['attemptId'] as int,
      attempt: jsonSerialization['attempt'] == null
          ? null
          : _i3.Protocol().deserialize<_i2.Attempt>(
              jsonSerialization['attempt'],
            ),
      score: jsonSerialization['score'] as int,
      maxScore: jsonSerialization['maxScore'] as int,
      percentage: (jsonSerialization['percentage'] as num).toDouble(),
      passed: jsonSerialization['passed'] as bool,
    );
  }

  static final t = ResultTable();

  static const db = ResultRepository._();

  @override
  int? id;

  int attemptId;

  _i2.Attempt? attempt;

  int score;

  int maxScore;

  double percentage;

  bool passed;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Result]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Result copyWith({
    int? id,
    int? attemptId,
    _i2.Attempt? attempt,
    int? score,
    int? maxScore,
    double? percentage,
    bool? passed,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Result',
      if (id != null) 'id': id,
      'attemptId': attemptId,
      if (attempt != null) 'attempt': attempt?.toJson(),
      'score': score,
      'maxScore': maxScore,
      'percentage': percentage,
      'passed': passed,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Result',
      if (id != null) 'id': id,
      'attemptId': attemptId,
      if (attempt != null) 'attempt': attempt?.toJsonForProtocol(),
      'score': score,
      'maxScore': maxScore,
      'percentage': percentage,
      'passed': passed,
    };
  }

  static ResultInclude include({_i2.AttemptInclude? attempt}) {
    return ResultInclude._(attempt: attempt);
  }

  static ResultIncludeList includeList({
    _i1.WhereExpressionBuilder<ResultTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ResultTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ResultTable>? orderByList,
    ResultInclude? include,
  }) {
    return ResultIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Result.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Result.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ResultImpl extends Result {
  _ResultImpl({
    int? id,
    required int attemptId,
    _i2.Attempt? attempt,
    required int score,
    required int maxScore,
    required double percentage,
    required bool passed,
  }) : super._(
         id: id,
         attemptId: attemptId,
         attempt: attempt,
         score: score,
         maxScore: maxScore,
         percentage: percentage,
         passed: passed,
       );

  /// Returns a shallow copy of this [Result]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Result copyWith({
    Object? id = _Undefined,
    int? attemptId,
    Object? attempt = _Undefined,
    int? score,
    int? maxScore,
    double? percentage,
    bool? passed,
  }) {
    return Result(
      id: id is int? ? id : this.id,
      attemptId: attemptId ?? this.attemptId,
      attempt: attempt is _i2.Attempt? ? attempt : this.attempt?.copyWith(),
      score: score ?? this.score,
      maxScore: maxScore ?? this.maxScore,
      percentage: percentage ?? this.percentage,
      passed: passed ?? this.passed,
    );
  }
}

class ResultUpdateTable extends _i1.UpdateTable<ResultTable> {
  ResultUpdateTable(super.table);

  _i1.ColumnValue<int, int> attemptId(int value) => _i1.ColumnValue(
    table.attemptId,
    value,
  );

  _i1.ColumnValue<int, int> score(int value) => _i1.ColumnValue(
    table.score,
    value,
  );

  _i1.ColumnValue<int, int> maxScore(int value) => _i1.ColumnValue(
    table.maxScore,
    value,
  );

  _i1.ColumnValue<double, double> percentage(double value) => _i1.ColumnValue(
    table.percentage,
    value,
  );

  _i1.ColumnValue<bool, bool> passed(bool value) => _i1.ColumnValue(
    table.passed,
    value,
  );
}

class ResultTable extends _i1.Table<int?> {
  ResultTable({super.tableRelation}) : super(tableName: 'result') {
    updateTable = ResultUpdateTable(this);
    attemptId = _i1.ColumnInt(
      'attemptId',
      this,
    );
    score = _i1.ColumnInt(
      'score',
      this,
    );
    maxScore = _i1.ColumnInt(
      'maxScore',
      this,
    );
    percentage = _i1.ColumnDouble(
      'percentage',
      this,
    );
    passed = _i1.ColumnBool(
      'passed',
      this,
    );
  }

  late final ResultUpdateTable updateTable;

  late final _i1.ColumnInt attemptId;

  _i2.AttemptTable? _attempt;

  late final _i1.ColumnInt score;

  late final _i1.ColumnInt maxScore;

  late final _i1.ColumnDouble percentage;

  late final _i1.ColumnBool passed;

  _i2.AttemptTable get attempt {
    if (_attempt != null) return _attempt!;
    _attempt = _i1.createRelationTable(
      relationFieldName: 'attempt',
      field: Result.t.attemptId,
      foreignField: _i2.Attempt.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.AttemptTable(tableRelation: foreignTableRelation),
    );
    return _attempt!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    attemptId,
    score,
    maxScore,
    percentage,
    passed,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'attempt') {
      return attempt;
    }
    return null;
  }
}

class ResultInclude extends _i1.IncludeObject {
  ResultInclude._({_i2.AttemptInclude? attempt}) {
    _attempt = attempt;
  }

  _i2.AttemptInclude? _attempt;

  @override
  Map<String, _i1.Include?> get includes => {'attempt': _attempt};

  @override
  _i1.Table<int?> get table => Result.t;
}

class ResultIncludeList extends _i1.IncludeList {
  ResultIncludeList._({
    _i1.WhereExpressionBuilder<ResultTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Result.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Result.t;
}

class ResultRepository {
  const ResultRepository._();

  final attachRow = const ResultAttachRowRepository._();

  /// Returns a list of [Result]s matching the given query parameters.
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
  Future<List<Result>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ResultTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ResultTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ResultTable>? orderByList,
    _i1.Transaction? transaction,
    ResultInclude? include,
  }) async {
    return session.db.find<Result>(
      where: where?.call(Result.t),
      orderBy: orderBy?.call(Result.t),
      orderByList: orderByList?.call(Result.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Result] matching the given query parameters.
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
  Future<Result?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ResultTable>? where,
    int? offset,
    _i1.OrderByBuilder<ResultTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ResultTable>? orderByList,
    _i1.Transaction? transaction,
    ResultInclude? include,
  }) async {
    return session.db.findFirstRow<Result>(
      where: where?.call(Result.t),
      orderBy: orderBy?.call(Result.t),
      orderByList: orderByList?.call(Result.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Result] by its [id] or null if no such row exists.
  Future<Result?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    ResultInclude? include,
  }) async {
    return session.db.findById<Result>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Result]s in the list and returns the inserted rows.
  ///
  /// The returned [Result]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Result>> insert(
    _i1.Session session,
    List<Result> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Result>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Result] and returns the inserted row.
  ///
  /// The returned [Result] will have its `id` field set.
  Future<Result> insertRow(
    _i1.Session session,
    Result row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Result>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Result]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Result>> update(
    _i1.Session session,
    List<Result> rows, {
    _i1.ColumnSelections<ResultTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Result>(
      rows,
      columns: columns?.call(Result.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Result]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Result> updateRow(
    _i1.Session session,
    Result row, {
    _i1.ColumnSelections<ResultTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Result>(
      row,
      columns: columns?.call(Result.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Result] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Result?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<ResultUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Result>(
      id,
      columnValues: columnValues(Result.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Result]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Result>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<ResultUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<ResultTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ResultTable>? orderBy,
    _i1.OrderByListBuilder<ResultTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Result>(
      columnValues: columnValues(Result.t.updateTable),
      where: where(Result.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Result.t),
      orderByList: orderByList?.call(Result.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Result]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Result>> delete(
    _i1.Session session,
    List<Result> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Result>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Result].
  Future<Result> deleteRow(
    _i1.Session session,
    Result row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Result>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Result>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ResultTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Result>(
      where: where(Result.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ResultTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Result>(
      where: where?.call(Result.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class ResultAttachRowRepository {
  const ResultAttachRowRepository._();

  /// Creates a relation between the given [Result] and [Attempt]
  /// by setting the [Result]'s foreign key `attemptId` to refer to the [Attempt].
  Future<void> attempt(
    _i1.Session session,
    Result result,
    _i2.Attempt attempt, {
    _i1.Transaction? transaction,
  }) async {
    if (result.id == null) {
      throw ArgumentError.notNull('result.id');
    }
    if (attempt.id == null) {
      throw ArgumentError.notNull('attempt.id');
    }

    var $result = result.copyWith(attemptId: attempt.id);
    await session.db.updateRow<Result>(
      $result,
      columns: [Result.t.attemptId],
      transaction: transaction,
    );
  }
}
