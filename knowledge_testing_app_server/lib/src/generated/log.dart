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
import 'package:serverpod/serverpod.dart' as _i1;

abstract class Log implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = LogTable();

  static const db = LogRepository._();

  @override
  int? id;

  int userId;

  String action;

  DateTime createdAt;

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Log',
      if (id != null) 'id': id,
      'userId': userId,
      'action': action,
      'createdAt': createdAt.toJson(),
    };
  }

  static LogInclude include() {
    return LogInclude._();
  }

  static LogIncludeList includeList({
    _i1.WhereExpressionBuilder<LogTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<LogTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<LogTable>? orderByList,
    LogInclude? include,
  }) {
    return LogIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Log.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Log.t),
      include: include,
    );
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

class LogUpdateTable extends _i1.UpdateTable<LogTable> {
  LogUpdateTable(super.table);

  _i1.ColumnValue<int, int> userId(int value) => _i1.ColumnValue(
    table.userId,
    value,
  );

  _i1.ColumnValue<String, String> action(String value) => _i1.ColumnValue(
    table.action,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );
}

class LogTable extends _i1.Table<int?> {
  LogTable({super.tableRelation}) : super(tableName: 'log') {
    updateTable = LogUpdateTable(this);
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    action = _i1.ColumnString(
      'action',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final LogUpdateTable updateTable;

  late final _i1.ColumnInt userId;

  late final _i1.ColumnString action;

  late final _i1.ColumnDateTime createdAt;

  @override
  List<_i1.Column> get columns => [
    id,
    userId,
    action,
    createdAt,
  ];
}

class LogInclude extends _i1.IncludeObject {
  LogInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Log.t;
}

class LogIncludeList extends _i1.IncludeList {
  LogIncludeList._({
    _i1.WhereExpressionBuilder<LogTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Log.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Log.t;
}

class LogRepository {
  const LogRepository._();

  /// Returns a list of [Log]s matching the given query parameters.
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
  Future<List<Log>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<LogTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<LogTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<LogTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Log>(
      where: where?.call(Log.t),
      orderBy: orderBy?.call(Log.t),
      orderByList: orderByList?.call(Log.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Log] matching the given query parameters.
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
  Future<Log?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<LogTable>? where,
    int? offset,
    _i1.OrderByBuilder<LogTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<LogTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Log>(
      where: where?.call(Log.t),
      orderBy: orderBy?.call(Log.t),
      orderByList: orderByList?.call(Log.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Log] by its [id] or null if no such row exists.
  Future<Log?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Log>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Log]s in the list and returns the inserted rows.
  ///
  /// The returned [Log]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Log>> insert(
    _i1.Session session,
    List<Log> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Log>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Log] and returns the inserted row.
  ///
  /// The returned [Log] will have its `id` field set.
  Future<Log> insertRow(
    _i1.Session session,
    Log row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Log>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Log]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Log>> update(
    _i1.Session session,
    List<Log> rows, {
    _i1.ColumnSelections<LogTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Log>(
      rows,
      columns: columns?.call(Log.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Log]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Log> updateRow(
    _i1.Session session,
    Log row, {
    _i1.ColumnSelections<LogTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Log>(
      row,
      columns: columns?.call(Log.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Log] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Log?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<LogUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Log>(
      id,
      columnValues: columnValues(Log.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Log]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Log>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<LogUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<LogTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<LogTable>? orderBy,
    _i1.OrderByListBuilder<LogTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Log>(
      columnValues: columnValues(Log.t.updateTable),
      where: where(Log.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Log.t),
      orderByList: orderByList?.call(Log.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Log]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Log>> delete(
    _i1.Session session,
    List<Log> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Log>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Log].
  Future<Log> deleteRow(
    _i1.Session session,
    Log row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Log>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Log>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<LogTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Log>(
      where: where(Log.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<LogTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Log>(
      where: where?.call(Log.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
