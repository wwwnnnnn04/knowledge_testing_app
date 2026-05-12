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
import 'test.dart' as _i2;
import 'tag.dart' as _i3;
import 'package:knowledge_testing_app_server/src/generated/protocol.dart'
    as _i4;

abstract class TestTag
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = TestTagTable();

  static const db = TestTagRepository._();

  @override
  int? id;

  int testId;

  _i2.Test? test;

  int tagId;

  _i3.Tag? tag;

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'TestTag',
      if (id != null) 'id': id,
      'testId': testId,
      if (test != null) 'test': test?.toJsonForProtocol(),
      'tagId': tagId,
      if (tag != null) 'tag': tag?.toJsonForProtocol(),
    };
  }

  static TestTagInclude include({
    _i2.TestInclude? test,
    _i3.TagInclude? tag,
  }) {
    return TestTagInclude._(
      test: test,
      tag: tag,
    );
  }

  static TestTagIncludeList includeList({
    _i1.WhereExpressionBuilder<TestTagTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TestTagTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TestTagTable>? orderByList,
    TestTagInclude? include,
  }) {
    return TestTagIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(TestTag.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(TestTag.t),
      include: include,
    );
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

class TestTagUpdateTable extends _i1.UpdateTable<TestTagTable> {
  TestTagUpdateTable(super.table);

  _i1.ColumnValue<int, int> testId(int value) => _i1.ColumnValue(
    table.testId,
    value,
  );

  _i1.ColumnValue<int, int> tagId(int value) => _i1.ColumnValue(
    table.tagId,
    value,
  );
}

class TestTagTable extends _i1.Table<int?> {
  TestTagTable({super.tableRelation}) : super(tableName: 'test_tag') {
    updateTable = TestTagUpdateTable(this);
    testId = _i1.ColumnInt(
      'testId',
      this,
    );
    tagId = _i1.ColumnInt(
      'tagId',
      this,
    );
  }

  late final TestTagUpdateTable updateTable;

  late final _i1.ColumnInt testId;

  _i2.TestTable? _test;

  late final _i1.ColumnInt tagId;

  _i3.TagTable? _tag;

  _i2.TestTable get test {
    if (_test != null) return _test!;
    _test = _i1.createRelationTable(
      relationFieldName: 'test',
      field: TestTag.t.testId,
      foreignField: _i2.Test.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.TestTable(tableRelation: foreignTableRelation),
    );
    return _test!;
  }

  _i3.TagTable get tag {
    if (_tag != null) return _tag!;
    _tag = _i1.createRelationTable(
      relationFieldName: 'tag',
      field: TestTag.t.tagId,
      foreignField: _i3.Tag.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.TagTable(tableRelation: foreignTableRelation),
    );
    return _tag!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    testId,
    tagId,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'test') {
      return test;
    }
    if (relationField == 'tag') {
      return tag;
    }
    return null;
  }
}

class TestTagInclude extends _i1.IncludeObject {
  TestTagInclude._({
    _i2.TestInclude? test,
    _i3.TagInclude? tag,
  }) {
    _test = test;
    _tag = tag;
  }

  _i2.TestInclude? _test;

  _i3.TagInclude? _tag;

  @override
  Map<String, _i1.Include?> get includes => {
    'test': _test,
    'tag': _tag,
  };

  @override
  _i1.Table<int?> get table => TestTag.t;
}

class TestTagIncludeList extends _i1.IncludeList {
  TestTagIncludeList._({
    _i1.WhereExpressionBuilder<TestTagTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(TestTag.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => TestTag.t;
}

class TestTagRepository {
  const TestTagRepository._();

  final attachRow = const TestTagAttachRowRepository._();

  /// Returns a list of [TestTag]s matching the given query parameters.
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
  Future<List<TestTag>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TestTagTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TestTagTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TestTagTable>? orderByList,
    _i1.Transaction? transaction,
    TestTagInclude? include,
  }) async {
    return session.db.find<TestTag>(
      where: where?.call(TestTag.t),
      orderBy: orderBy?.call(TestTag.t),
      orderByList: orderByList?.call(TestTag.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [TestTag] matching the given query parameters.
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
  Future<TestTag?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TestTagTable>? where,
    int? offset,
    _i1.OrderByBuilder<TestTagTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TestTagTable>? orderByList,
    _i1.Transaction? transaction,
    TestTagInclude? include,
  }) async {
    return session.db.findFirstRow<TestTag>(
      where: where?.call(TestTag.t),
      orderBy: orderBy?.call(TestTag.t),
      orderByList: orderByList?.call(TestTag.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [TestTag] by its [id] or null if no such row exists.
  Future<TestTag?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    TestTagInclude? include,
  }) async {
    return session.db.findById<TestTag>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [TestTag]s in the list and returns the inserted rows.
  ///
  /// The returned [TestTag]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<TestTag>> insert(
    _i1.Session session,
    List<TestTag> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<TestTag>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [TestTag] and returns the inserted row.
  ///
  /// The returned [TestTag] will have its `id` field set.
  Future<TestTag> insertRow(
    _i1.Session session,
    TestTag row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<TestTag>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [TestTag]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<TestTag>> update(
    _i1.Session session,
    List<TestTag> rows, {
    _i1.ColumnSelections<TestTagTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<TestTag>(
      rows,
      columns: columns?.call(TestTag.t),
      transaction: transaction,
    );
  }

  /// Updates a single [TestTag]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<TestTag> updateRow(
    _i1.Session session,
    TestTag row, {
    _i1.ColumnSelections<TestTagTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<TestTag>(
      row,
      columns: columns?.call(TestTag.t),
      transaction: transaction,
    );
  }

  /// Updates a single [TestTag] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<TestTag?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<TestTagUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<TestTag>(
      id,
      columnValues: columnValues(TestTag.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [TestTag]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<TestTag>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<TestTagUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<TestTagTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TestTagTable>? orderBy,
    _i1.OrderByListBuilder<TestTagTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<TestTag>(
      columnValues: columnValues(TestTag.t.updateTable),
      where: where(TestTag.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(TestTag.t),
      orderByList: orderByList?.call(TestTag.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [TestTag]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<TestTag>> delete(
    _i1.Session session,
    List<TestTag> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<TestTag>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [TestTag].
  Future<TestTag> deleteRow(
    _i1.Session session,
    TestTag row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<TestTag>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<TestTag>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<TestTagTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<TestTag>(
      where: where(TestTag.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TestTagTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<TestTag>(
      where: where?.call(TestTag.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class TestTagAttachRowRepository {
  const TestTagAttachRowRepository._();

  /// Creates a relation between the given [TestTag] and [Test]
  /// by setting the [TestTag]'s foreign key `testId` to refer to the [Test].
  Future<void> test(
    _i1.Session session,
    TestTag testTag,
    _i2.Test test, {
    _i1.Transaction? transaction,
  }) async {
    if (testTag.id == null) {
      throw ArgumentError.notNull('testTag.id');
    }
    if (test.id == null) {
      throw ArgumentError.notNull('test.id');
    }

    var $testTag = testTag.copyWith(testId: test.id);
    await session.db.updateRow<TestTag>(
      $testTag,
      columns: [TestTag.t.testId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [TestTag] and [Tag]
  /// by setting the [TestTag]'s foreign key `tagId` to refer to the [Tag].
  Future<void> tag(
    _i1.Session session,
    TestTag testTag,
    _i3.Tag tag, {
    _i1.Transaction? transaction,
  }) async {
    if (testTag.id == null) {
      throw ArgumentError.notNull('testTag.id');
    }
    if (tag.id == null) {
      throw ArgumentError.notNull('tag.id');
    }

    var $testTag = testTag.copyWith(tagId: tag.id);
    await session.db.updateRow<TestTag>(
      $testTag,
      columns: [TestTag.t.tagId],
      transaction: transaction,
    );
  }
}
