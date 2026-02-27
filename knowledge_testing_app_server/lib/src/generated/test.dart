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
import 'attempt.dart' as _i3;
import 'question.dart' as _i4;
import 'package:knowledge_testing_app_server/src/generated/protocol.dart'
    as _i5;

abstract class Test implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = TestTable();

  static const db = TestRepository._();

  @override
  int? id;

  String title;

  int creatorId;

  _i2.User? creator;

  List<_i3.Attempt>? attempt;

  List<_i4.Question>? question;

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Test',
      if (id != null) 'id': id,
      'title': title,
      'creatorId': creatorId,
      if (creator != null) 'creator': creator?.toJsonForProtocol(),
      if (attempt != null)
        'attempt': attempt?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (question != null)
        'question': question?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  static TestInclude include({
    _i2.UserInclude? creator,
    _i3.AttemptIncludeList? attempt,
    _i4.QuestionIncludeList? question,
  }) {
    return TestInclude._(
      creator: creator,
      attempt: attempt,
      question: question,
    );
  }

  static TestIncludeList includeList({
    _i1.WhereExpressionBuilder<TestTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TestTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TestTable>? orderByList,
    TestInclude? include,
  }) {
    return TestIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Test.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Test.t),
      include: include,
    );
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

class TestUpdateTable extends _i1.UpdateTable<TestTable> {
  TestUpdateTable(super.table);

  _i1.ColumnValue<String, String> title(String value) => _i1.ColumnValue(
    table.title,
    value,
  );

  _i1.ColumnValue<int, int> creatorId(int value) => _i1.ColumnValue(
    table.creatorId,
    value,
  );
}

class TestTable extends _i1.Table<int?> {
  TestTable({super.tableRelation}) : super(tableName: 'test') {
    updateTable = TestUpdateTable(this);
    title = _i1.ColumnString(
      'title',
      this,
    );
    creatorId = _i1.ColumnInt(
      'creatorId',
      this,
    );
  }

  late final TestUpdateTable updateTable;

  late final _i1.ColumnString title;

  late final _i1.ColumnInt creatorId;

  _i2.UserTable? _creator;

  _i3.AttemptTable? ___attempt;

  _i1.ManyRelation<_i3.AttemptTable>? _attempt;

  _i4.QuestionTable? ___question;

  _i1.ManyRelation<_i4.QuestionTable>? _question;

  _i2.UserTable get creator {
    if (_creator != null) return _creator!;
    _creator = _i1.createRelationTable(
      relationFieldName: 'creator',
      field: Test.t.creatorId,
      foreignField: _i2.User.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserTable(tableRelation: foreignTableRelation),
    );
    return _creator!;
  }

  _i3.AttemptTable get __attempt {
    if (___attempt != null) return ___attempt!;
    ___attempt = _i1.createRelationTable(
      relationFieldName: '__attempt',
      field: Test.t.id,
      foreignField: _i3.Attempt.t.testId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.AttemptTable(tableRelation: foreignTableRelation),
    );
    return ___attempt!;
  }

  _i4.QuestionTable get __question {
    if (___question != null) return ___question!;
    ___question = _i1.createRelationTable(
      relationFieldName: '__question',
      field: Test.t.id,
      foreignField: _i4.Question.t.testId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.QuestionTable(tableRelation: foreignTableRelation),
    );
    return ___question!;
  }

  _i1.ManyRelation<_i3.AttemptTable> get attempt {
    if (_attempt != null) return _attempt!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'attempt',
      field: Test.t.id,
      foreignField: _i3.Attempt.t.testId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.AttemptTable(tableRelation: foreignTableRelation),
    );
    _attempt = _i1.ManyRelation<_i3.AttemptTable>(
      tableWithRelations: relationTable,
      table: _i3.AttemptTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _attempt!;
  }

  _i1.ManyRelation<_i4.QuestionTable> get question {
    if (_question != null) return _question!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'question',
      field: Test.t.id,
      foreignField: _i4.Question.t.testId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.QuestionTable(tableRelation: foreignTableRelation),
    );
    _question = _i1.ManyRelation<_i4.QuestionTable>(
      tableWithRelations: relationTable,
      table: _i4.QuestionTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _question!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    title,
    creatorId,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'creator') {
      return creator;
    }
    if (relationField == 'attempt') {
      return __attempt;
    }
    if (relationField == 'question') {
      return __question;
    }
    return null;
  }
}

class TestInclude extends _i1.IncludeObject {
  TestInclude._({
    _i2.UserInclude? creator,
    _i3.AttemptIncludeList? attempt,
    _i4.QuestionIncludeList? question,
  }) {
    _creator = creator;
    _attempt = attempt;
    _question = question;
  }

  _i2.UserInclude? _creator;

  _i3.AttemptIncludeList? _attempt;

  _i4.QuestionIncludeList? _question;

  @override
  Map<String, _i1.Include?> get includes => {
    'creator': _creator,
    'attempt': _attempt,
    'question': _question,
  };

  @override
  _i1.Table<int?> get table => Test.t;
}

class TestIncludeList extends _i1.IncludeList {
  TestIncludeList._({
    _i1.WhereExpressionBuilder<TestTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Test.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Test.t;
}

class TestRepository {
  const TestRepository._();

  final attach = const TestAttachRepository._();

  final attachRow = const TestAttachRowRepository._();

  /// Returns a list of [Test]s matching the given query parameters.
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
  Future<List<Test>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TestTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TestTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TestTable>? orderByList,
    _i1.Transaction? transaction,
    TestInclude? include,
  }) async {
    return session.db.find<Test>(
      where: where?.call(Test.t),
      orderBy: orderBy?.call(Test.t),
      orderByList: orderByList?.call(Test.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Test] matching the given query parameters.
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
  Future<Test?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TestTable>? where,
    int? offset,
    _i1.OrderByBuilder<TestTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TestTable>? orderByList,
    _i1.Transaction? transaction,
    TestInclude? include,
  }) async {
    return session.db.findFirstRow<Test>(
      where: where?.call(Test.t),
      orderBy: orderBy?.call(Test.t),
      orderByList: orderByList?.call(Test.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Test] by its [id] or null if no such row exists.
  Future<Test?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    TestInclude? include,
  }) async {
    return session.db.findById<Test>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Test]s in the list and returns the inserted rows.
  ///
  /// The returned [Test]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Test>> insert(
    _i1.Session session,
    List<Test> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Test>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Test] and returns the inserted row.
  ///
  /// The returned [Test] will have its `id` field set.
  Future<Test> insertRow(
    _i1.Session session,
    Test row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Test>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Test]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Test>> update(
    _i1.Session session,
    List<Test> rows, {
    _i1.ColumnSelections<TestTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Test>(
      rows,
      columns: columns?.call(Test.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Test]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Test> updateRow(
    _i1.Session session,
    Test row, {
    _i1.ColumnSelections<TestTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Test>(
      row,
      columns: columns?.call(Test.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Test] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Test?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<TestUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Test>(
      id,
      columnValues: columnValues(Test.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Test]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Test>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<TestUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<TestTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TestTable>? orderBy,
    _i1.OrderByListBuilder<TestTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Test>(
      columnValues: columnValues(Test.t.updateTable),
      where: where(Test.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Test.t),
      orderByList: orderByList?.call(Test.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Test]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Test>> delete(
    _i1.Session session,
    List<Test> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Test>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Test].
  Future<Test> deleteRow(
    _i1.Session session,
    Test row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Test>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Test>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<TestTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Test>(
      where: where(Test.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TestTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Test>(
      where: where?.call(Test.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class TestAttachRepository {
  const TestAttachRepository._();

  /// Creates a relation between this [Test] and the given [Attempt]s
  /// by setting each [Attempt]'s foreign key `testId` to refer to this [Test].
  Future<void> attempt(
    _i1.Session session,
    Test test,
    List<_i3.Attempt> attempt, {
    _i1.Transaction? transaction,
  }) async {
    if (attempt.any((e) => e.id == null)) {
      throw ArgumentError.notNull('attempt.id');
    }
    if (test.id == null) {
      throw ArgumentError.notNull('test.id');
    }

    var $attempt = attempt.map((e) => e.copyWith(testId: test.id)).toList();
    await session.db.update<_i3.Attempt>(
      $attempt,
      columns: [_i3.Attempt.t.testId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Test] and the given [Question]s
  /// by setting each [Question]'s foreign key `testId` to refer to this [Test].
  Future<void> question(
    _i1.Session session,
    Test test,
    List<_i4.Question> question, {
    _i1.Transaction? transaction,
  }) async {
    if (question.any((e) => e.id == null)) {
      throw ArgumentError.notNull('question.id');
    }
    if (test.id == null) {
      throw ArgumentError.notNull('test.id');
    }

    var $question = question.map((e) => e.copyWith(testId: test.id)).toList();
    await session.db.update<_i4.Question>(
      $question,
      columns: [_i4.Question.t.testId],
      transaction: transaction,
    );
  }
}

class TestAttachRowRepository {
  const TestAttachRowRepository._();

  /// Creates a relation between the given [Test] and [User]
  /// by setting the [Test]'s foreign key `creatorId` to refer to the [User].
  Future<void> creator(
    _i1.Session session,
    Test test,
    _i2.User creator, {
    _i1.Transaction? transaction,
  }) async {
    if (test.id == null) {
      throw ArgumentError.notNull('test.id');
    }
    if (creator.id == null) {
      throw ArgumentError.notNull('creator.id');
    }

    var $test = test.copyWith(creatorId: creator.id);
    await session.db.updateRow<Test>(
      $test,
      columns: [Test.t.creatorId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Test] and the given [Attempt]
  /// by setting the [Attempt]'s foreign key `testId` to refer to this [Test].
  Future<void> attempt(
    _i1.Session session,
    Test test,
    _i3.Attempt attempt, {
    _i1.Transaction? transaction,
  }) async {
    if (attempt.id == null) {
      throw ArgumentError.notNull('attempt.id');
    }
    if (test.id == null) {
      throw ArgumentError.notNull('test.id');
    }

    var $attempt = attempt.copyWith(testId: test.id);
    await session.db.updateRow<_i3.Attempt>(
      $attempt,
      columns: [_i3.Attempt.t.testId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Test] and the given [Question]
  /// by setting the [Question]'s foreign key `testId` to refer to this [Test].
  Future<void> question(
    _i1.Session session,
    Test test,
    _i4.Question question, {
    _i1.Transaction? transaction,
  }) async {
    if (question.id == null) {
      throw ArgumentError.notNull('question.id');
    }
    if (test.id == null) {
      throw ArgumentError.notNull('test.id');
    }

    var $question = question.copyWith(testId: test.id);
    await session.db.updateRow<_i4.Question>(
      $question,
      columns: [_i4.Question.t.testId],
      transaction: transaction,
    );
  }
}
