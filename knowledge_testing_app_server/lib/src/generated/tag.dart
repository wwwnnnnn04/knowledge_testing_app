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
import 'test_tag.dart' as _i2;
import 'package:knowledge_testing_app_server/src/generated/protocol.dart'
    as _i3;

abstract class Tag implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Tag._({
    this.id,
    required this.name,
    this.tests,
  });

  factory Tag({
    int? id,
    required String name,
    List<_i2.TestTag>? tests,
  }) = _TagImpl;

  factory Tag.fromJson(Map<String, dynamic> jsonSerialization) {
    return Tag(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      tests: jsonSerialization['tests'] == null
          ? null
          : _i3.Protocol().deserialize<List<_i2.TestTag>>(
              jsonSerialization['tests'],
            ),
    );
  }

  static final t = TagTable();

  static const db = TagRepository._();

  @override
  int? id;

  String name;

  List<_i2.TestTag>? tests;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Tag]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Tag copyWith({
    int? id,
    String? name,
    List<_i2.TestTag>? tests,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Tag',
      if (id != null) 'id': id,
      'name': name,
      if (tests != null) 'tests': tests?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Tag',
      if (id != null) 'id': id,
      'name': name,
      if (tests != null)
        'tests': tests?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  static TagInclude include({_i2.TestTagIncludeList? tests}) {
    return TagInclude._(tests: tests);
  }

  static TagIncludeList includeList({
    _i1.WhereExpressionBuilder<TagTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TagTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TagTable>? orderByList,
    TagInclude? include,
  }) {
    return TagIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Tag.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Tag.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TagImpl extends Tag {
  _TagImpl({
    int? id,
    required String name,
    List<_i2.TestTag>? tests,
  }) : super._(
         id: id,
         name: name,
         tests: tests,
       );

  /// Returns a shallow copy of this [Tag]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Tag copyWith({
    Object? id = _Undefined,
    String? name,
    Object? tests = _Undefined,
  }) {
    return Tag(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      tests: tests is List<_i2.TestTag>?
          ? tests
          : this.tests?.map((e0) => e0.copyWith()).toList(),
    );
  }
}

class TagUpdateTable extends _i1.UpdateTable<TagTable> {
  TagUpdateTable(super.table);

  _i1.ColumnValue<String, String> name(String value) => _i1.ColumnValue(
    table.name,
    value,
  );
}

class TagTable extends _i1.Table<int?> {
  TagTable({super.tableRelation}) : super(tableName: 'tag') {
    updateTable = TagUpdateTable(this);
    name = _i1.ColumnString(
      'name',
      this,
    );
  }

  late final TagUpdateTable updateTable;

  late final _i1.ColumnString name;

  _i2.TestTagTable? ___tests;

  _i1.ManyRelation<_i2.TestTagTable>? _tests;

  _i2.TestTagTable get __tests {
    if (___tests != null) return ___tests!;
    ___tests = _i1.createRelationTable(
      relationFieldName: '__tests',
      field: Tag.t.id,
      foreignField: _i2.TestTag.t.tagId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.TestTagTable(tableRelation: foreignTableRelation),
    );
    return ___tests!;
  }

  _i1.ManyRelation<_i2.TestTagTable> get tests {
    if (_tests != null) return _tests!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'tests',
      field: Tag.t.id,
      foreignField: _i2.TestTag.t.tagId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.TestTagTable(tableRelation: foreignTableRelation),
    );
    _tests = _i1.ManyRelation<_i2.TestTagTable>(
      tableWithRelations: relationTable,
      table: _i2.TestTagTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _tests!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    name,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'tests') {
      return __tests;
    }
    return null;
  }
}

class TagInclude extends _i1.IncludeObject {
  TagInclude._({_i2.TestTagIncludeList? tests}) {
    _tests = tests;
  }

  _i2.TestTagIncludeList? _tests;

  @override
  Map<String, _i1.Include?> get includes => {'tests': _tests};

  @override
  _i1.Table<int?> get table => Tag.t;
}

class TagIncludeList extends _i1.IncludeList {
  TagIncludeList._({
    _i1.WhereExpressionBuilder<TagTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Tag.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Tag.t;
}

class TagRepository {
  const TagRepository._();

  final attach = const TagAttachRepository._();

  final attachRow = const TagAttachRowRepository._();

  final detach = const TagDetachRepository._();

  final detachRow = const TagDetachRowRepository._();

  /// Returns a list of [Tag]s matching the given query parameters.
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
  Future<List<Tag>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TagTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TagTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TagTable>? orderByList,
    _i1.Transaction? transaction,
    TagInclude? include,
  }) async {
    return session.db.find<Tag>(
      where: where?.call(Tag.t),
      orderBy: orderBy?.call(Tag.t),
      orderByList: orderByList?.call(Tag.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Tag] matching the given query parameters.
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
  Future<Tag?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TagTable>? where,
    int? offset,
    _i1.OrderByBuilder<TagTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TagTable>? orderByList,
    _i1.Transaction? transaction,
    TagInclude? include,
  }) async {
    return session.db.findFirstRow<Tag>(
      where: where?.call(Tag.t),
      orderBy: orderBy?.call(Tag.t),
      orderByList: orderByList?.call(Tag.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Tag] by its [id] or null if no such row exists.
  Future<Tag?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    TagInclude? include,
  }) async {
    return session.db.findById<Tag>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Tag]s in the list and returns the inserted rows.
  ///
  /// The returned [Tag]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Tag>> insert(
    _i1.Session session,
    List<Tag> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Tag>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Tag] and returns the inserted row.
  ///
  /// The returned [Tag] will have its `id` field set.
  Future<Tag> insertRow(
    _i1.Session session,
    Tag row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Tag>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Tag]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Tag>> update(
    _i1.Session session,
    List<Tag> rows, {
    _i1.ColumnSelections<TagTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Tag>(
      rows,
      columns: columns?.call(Tag.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Tag]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Tag> updateRow(
    _i1.Session session,
    Tag row, {
    _i1.ColumnSelections<TagTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Tag>(
      row,
      columns: columns?.call(Tag.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Tag] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Tag?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<TagUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Tag>(
      id,
      columnValues: columnValues(Tag.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Tag]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Tag>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<TagUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<TagTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TagTable>? orderBy,
    _i1.OrderByListBuilder<TagTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Tag>(
      columnValues: columnValues(Tag.t.updateTable),
      where: where(Tag.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Tag.t),
      orderByList: orderByList?.call(Tag.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Tag]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Tag>> delete(
    _i1.Session session,
    List<Tag> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Tag>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Tag].
  Future<Tag> deleteRow(
    _i1.Session session,
    Tag row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Tag>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Tag>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<TagTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Tag>(
      where: where(Tag.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TagTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Tag>(
      where: where?.call(Tag.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class TagAttachRepository {
  const TagAttachRepository._();

  /// Creates a relation between this [Tag] and the given [TestTag]s
  /// by setting each [TestTag]'s foreign key `tagId` to refer to this [Tag].
  Future<void> tests(
    _i1.Session session,
    Tag tag,
    List<_i2.TestTag> testTag, {
    _i1.Transaction? transaction,
  }) async {
    if (testTag.any((e) => e.id == null)) {
      throw ArgumentError.notNull('testTag.id');
    }
    if (tag.id == null) {
      throw ArgumentError.notNull('tag.id');
    }

    var $testTag = testTag.map((e) => e.copyWith(tagId: tag.id)).toList();
    await session.db.update<_i2.TestTag>(
      $testTag,
      columns: [_i2.TestTag.t.tagId],
      transaction: transaction,
    );
  }
}

class TagAttachRowRepository {
  const TagAttachRowRepository._();

  /// Creates a relation between this [Tag] and the given [TestTag]
  /// by setting the [TestTag]'s foreign key `tagId` to refer to this [Tag].
  Future<void> tests(
    _i1.Session session,
    Tag tag,
    _i2.TestTag testTag, {
    _i1.Transaction? transaction,
  }) async {
    if (testTag.id == null) {
      throw ArgumentError.notNull('testTag.id');
    }
    if (tag.id == null) {
      throw ArgumentError.notNull('tag.id');
    }

    var $testTag = testTag.copyWith(tagId: tag.id);
    await session.db.updateRow<_i2.TestTag>(
      $testTag,
      columns: [_i2.TestTag.t.tagId],
      transaction: transaction,
    );
  }
}

class TagDetachRepository {
  const TagDetachRepository._();

  /// Detaches the relation between this [Tag] and the given [TestTag]
  /// by setting the [TestTag]'s foreign key `tagId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> tests(
    _i1.Session session,
    List<_i2.TestTag> testTag, {
    _i1.Transaction? transaction,
  }) async {
    if (testTag.any((e) => e.id == null)) {
      throw ArgumentError.notNull('testTag.id');
    }

    var $testTag = testTag.map((e) => e.copyWith(tagId: null)).toList();
    await session.db.update<_i2.TestTag>(
      $testTag,
      columns: [_i2.TestTag.t.tagId],
      transaction: transaction,
    );
  }
}

class TagDetachRowRepository {
  const TagDetachRowRepository._();

  /// Detaches the relation between this [Tag] and the given [TestTag]
  /// by setting the [TestTag]'s foreign key `tagId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> tests(
    _i1.Session session,
    _i2.TestTag testTag, {
    _i1.Transaction? transaction,
  }) async {
    if (testTag.id == null) {
      throw ArgumentError.notNull('testTag.id');
    }

    var $testTag = testTag.copyWith(tagId: null);
    await session.db.updateRow<_i2.TestTag>(
      $testTag,
      columns: [_i2.TestTag.t.tagId],
      transaction: transaction,
    );
  }
}
