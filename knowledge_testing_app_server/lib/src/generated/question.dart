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
import 'answer.dart' as _i3;
import 'answer_attempt.dart' as _i4;
import 'package:knowledge_testing_app_server/src/generated/protocol.dart'
    as _i5;

abstract class Question
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Question._({
    this.id,
    required this.text,
    required this.order,
    required this.testId,
    this.test,
    this.answer,
    this.answerAttempt,
  });

  factory Question({
    int? id,
    required String text,
    required int order,
    required int testId,
    _i2.Test? test,
    List<_i3.Answer>? answer,
    List<_i4.AnswerAttempt>? answerAttempt,
  }) = _QuestionImpl;

  factory Question.fromJson(Map<String, dynamic> jsonSerialization) {
    return Question(
      id: jsonSerialization['id'] as int?,
      text: jsonSerialization['text'] as String,
      order: jsonSerialization['order'] as int,
      testId: jsonSerialization['testId'] as int,
      test: jsonSerialization['test'] == null
          ? null
          : _i5.Protocol().deserialize<_i2.Test>(jsonSerialization['test']),
      answer: jsonSerialization['answer'] == null
          ? null
          : _i5.Protocol().deserialize<List<_i3.Answer>>(
              jsonSerialization['answer'],
            ),
      answerAttempt: jsonSerialization['answerAttempt'] == null
          ? null
          : _i5.Protocol().deserialize<List<_i4.AnswerAttempt>>(
              jsonSerialization['answerAttempt'],
            ),
    );
  }

  static final t = QuestionTable();

  static const db = QuestionRepository._();

  @override
  int? id;

  String text;

  int order;

  int testId;

  _i2.Test? test;

  List<_i3.Answer>? answer;

  List<_i4.AnswerAttempt>? answerAttempt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Question]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Question copyWith({
    int? id,
    String? text,
    int? order,
    int? testId,
    _i2.Test? test,
    List<_i3.Answer>? answer,
    List<_i4.AnswerAttempt>? answerAttempt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Question',
      if (id != null) 'id': id,
      'text': text,
      'order': order,
      'testId': testId,
      if (test != null) 'test': test?.toJson(),
      if (answer != null)
        'answer': answer?.toJson(valueToJson: (v) => v.toJson()),
      if (answerAttempt != null)
        'answerAttempt': answerAttempt?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Question',
      if (id != null) 'id': id,
      'text': text,
      'order': order,
      'testId': testId,
      if (test != null) 'test': test?.toJsonForProtocol(),
      if (answer != null)
        'answer': answer?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (answerAttempt != null)
        'answerAttempt': answerAttempt?.toJson(
          valueToJson: (v) => v.toJsonForProtocol(),
        ),
    };
  }

  static QuestionInclude include({
    _i2.TestInclude? test,
    _i3.AnswerIncludeList? answer,
    _i4.AnswerAttemptIncludeList? answerAttempt,
  }) {
    return QuestionInclude._(
      test: test,
      answer: answer,
      answerAttempt: answerAttempt,
    );
  }

  static QuestionIncludeList includeList({
    _i1.WhereExpressionBuilder<QuestionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<QuestionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<QuestionTable>? orderByList,
    QuestionInclude? include,
  }) {
    return QuestionIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Question.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Question.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _QuestionImpl extends Question {
  _QuestionImpl({
    int? id,
    required String text,
    required int order,
    required int testId,
    _i2.Test? test,
    List<_i3.Answer>? answer,
    List<_i4.AnswerAttempt>? answerAttempt,
  }) : super._(
         id: id,
         text: text,
         order: order,
         testId: testId,
         test: test,
         answer: answer,
         answerAttempt: answerAttempt,
       );

  /// Returns a shallow copy of this [Question]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Question copyWith({
    Object? id = _Undefined,
    String? text,
    int? order,
    int? testId,
    Object? test = _Undefined,
    Object? answer = _Undefined,
    Object? answerAttempt = _Undefined,
  }) {
    return Question(
      id: id is int? ? id : this.id,
      text: text ?? this.text,
      order: order ?? this.order,
      testId: testId ?? this.testId,
      test: test is _i2.Test? ? test : this.test?.copyWith(),
      answer: answer is List<_i3.Answer>?
          ? answer
          : this.answer?.map((e0) => e0.copyWith()).toList(),
      answerAttempt: answerAttempt is List<_i4.AnswerAttempt>?
          ? answerAttempt
          : this.answerAttempt?.map((e0) => e0.copyWith()).toList(),
    );
  }
}

class QuestionUpdateTable extends _i1.UpdateTable<QuestionTable> {
  QuestionUpdateTable(super.table);

  _i1.ColumnValue<String, String> text(String value) => _i1.ColumnValue(
    table.text,
    value,
  );

  _i1.ColumnValue<int, int> order(int value) => _i1.ColumnValue(
    table.order,
    value,
  );

  _i1.ColumnValue<int, int> testId(int value) => _i1.ColumnValue(
    table.testId,
    value,
  );
}

class QuestionTable extends _i1.Table<int?> {
  QuestionTable({super.tableRelation}) : super(tableName: 'question') {
    updateTable = QuestionUpdateTable(this);
    text = _i1.ColumnString(
      'text',
      this,
    );
    order = _i1.ColumnInt(
      'order',
      this,
    );
    testId = _i1.ColumnInt(
      'testId',
      this,
    );
  }

  late final QuestionUpdateTable updateTable;

  late final _i1.ColumnString text;

  late final _i1.ColumnInt order;

  late final _i1.ColumnInt testId;

  _i2.TestTable? _test;

  _i3.AnswerTable? ___answer;

  _i1.ManyRelation<_i3.AnswerTable>? _answer;

  _i4.AnswerAttemptTable? ___answerAttempt;

  _i1.ManyRelation<_i4.AnswerAttemptTable>? _answerAttempt;

  _i2.TestTable get test {
    if (_test != null) return _test!;
    _test = _i1.createRelationTable(
      relationFieldName: 'test',
      field: Question.t.testId,
      foreignField: _i2.Test.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.TestTable(tableRelation: foreignTableRelation),
    );
    return _test!;
  }

  _i3.AnswerTable get __answer {
    if (___answer != null) return ___answer!;
    ___answer = _i1.createRelationTable(
      relationFieldName: '__answer',
      field: Question.t.id,
      foreignField: _i3.Answer.t.questionId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.AnswerTable(tableRelation: foreignTableRelation),
    );
    return ___answer!;
  }

  _i4.AnswerAttemptTable get __answerAttempt {
    if (___answerAttempt != null) return ___answerAttempt!;
    ___answerAttempt = _i1.createRelationTable(
      relationFieldName: '__answerAttempt',
      field: Question.t.id,
      foreignField: _i4.AnswerAttempt.t.questionId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.AnswerAttemptTable(tableRelation: foreignTableRelation),
    );
    return ___answerAttempt!;
  }

  _i1.ManyRelation<_i3.AnswerTable> get answer {
    if (_answer != null) return _answer!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'answer',
      field: Question.t.id,
      foreignField: _i3.Answer.t.questionId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.AnswerTable(tableRelation: foreignTableRelation),
    );
    _answer = _i1.ManyRelation<_i3.AnswerTable>(
      tableWithRelations: relationTable,
      table: _i3.AnswerTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _answer!;
  }

  _i1.ManyRelation<_i4.AnswerAttemptTable> get answerAttempt {
    if (_answerAttempt != null) return _answerAttempt!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'answerAttempt',
      field: Question.t.id,
      foreignField: _i4.AnswerAttempt.t.questionId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.AnswerAttemptTable(tableRelation: foreignTableRelation),
    );
    _answerAttempt = _i1.ManyRelation<_i4.AnswerAttemptTable>(
      tableWithRelations: relationTable,
      table: _i4.AnswerAttemptTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _answerAttempt!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    text,
    order,
    testId,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'test') {
      return test;
    }
    if (relationField == 'answer') {
      return __answer;
    }
    if (relationField == 'answerAttempt') {
      return __answerAttempt;
    }
    return null;
  }
}

class QuestionInclude extends _i1.IncludeObject {
  QuestionInclude._({
    _i2.TestInclude? test,
    _i3.AnswerIncludeList? answer,
    _i4.AnswerAttemptIncludeList? answerAttempt,
  }) {
    _test = test;
    _answer = answer;
    _answerAttempt = answerAttempt;
  }

  _i2.TestInclude? _test;

  _i3.AnswerIncludeList? _answer;

  _i4.AnswerAttemptIncludeList? _answerAttempt;

  @override
  Map<String, _i1.Include?> get includes => {
    'test': _test,
    'answer': _answer,
    'answerAttempt': _answerAttempt,
  };

  @override
  _i1.Table<int?> get table => Question.t;
}

class QuestionIncludeList extends _i1.IncludeList {
  QuestionIncludeList._({
    _i1.WhereExpressionBuilder<QuestionTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Question.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Question.t;
}

class QuestionRepository {
  const QuestionRepository._();

  final attach = const QuestionAttachRepository._();

  final attachRow = const QuestionAttachRowRepository._();

  /// Returns a list of [Question]s matching the given query parameters.
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
  Future<List<Question>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<QuestionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<QuestionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<QuestionTable>? orderByList,
    _i1.Transaction? transaction,
    QuestionInclude? include,
  }) async {
    return session.db.find<Question>(
      where: where?.call(Question.t),
      orderBy: orderBy?.call(Question.t),
      orderByList: orderByList?.call(Question.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Question] matching the given query parameters.
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
  Future<Question?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<QuestionTable>? where,
    int? offset,
    _i1.OrderByBuilder<QuestionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<QuestionTable>? orderByList,
    _i1.Transaction? transaction,
    QuestionInclude? include,
  }) async {
    return session.db.findFirstRow<Question>(
      where: where?.call(Question.t),
      orderBy: orderBy?.call(Question.t),
      orderByList: orderByList?.call(Question.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Question] by its [id] or null if no such row exists.
  Future<Question?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    QuestionInclude? include,
  }) async {
    return session.db.findById<Question>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Question]s in the list and returns the inserted rows.
  ///
  /// The returned [Question]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Question>> insert(
    _i1.Session session,
    List<Question> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Question>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Question] and returns the inserted row.
  ///
  /// The returned [Question] will have its `id` field set.
  Future<Question> insertRow(
    _i1.Session session,
    Question row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Question>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Question]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Question>> update(
    _i1.Session session,
    List<Question> rows, {
    _i1.ColumnSelections<QuestionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Question>(
      rows,
      columns: columns?.call(Question.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Question]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Question> updateRow(
    _i1.Session session,
    Question row, {
    _i1.ColumnSelections<QuestionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Question>(
      row,
      columns: columns?.call(Question.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Question] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Question?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<QuestionUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Question>(
      id,
      columnValues: columnValues(Question.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Question]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Question>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<QuestionUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<QuestionTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<QuestionTable>? orderBy,
    _i1.OrderByListBuilder<QuestionTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Question>(
      columnValues: columnValues(Question.t.updateTable),
      where: where(Question.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Question.t),
      orderByList: orderByList?.call(Question.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Question]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Question>> delete(
    _i1.Session session,
    List<Question> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Question>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Question].
  Future<Question> deleteRow(
    _i1.Session session,
    Question row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Question>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Question>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<QuestionTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Question>(
      where: where(Question.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<QuestionTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Question>(
      where: where?.call(Question.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class QuestionAttachRepository {
  const QuestionAttachRepository._();

  /// Creates a relation between this [Question] and the given [Answer]s
  /// by setting each [Answer]'s foreign key `questionId` to refer to this [Question].
  Future<void> answer(
    _i1.Session session,
    Question question,
    List<_i3.Answer> answer, {
    _i1.Transaction? transaction,
  }) async {
    if (answer.any((e) => e.id == null)) {
      throw ArgumentError.notNull('answer.id');
    }
    if (question.id == null) {
      throw ArgumentError.notNull('question.id');
    }

    var $answer = answer
        .map((e) => e.copyWith(questionId: question.id))
        .toList();
    await session.db.update<_i3.Answer>(
      $answer,
      columns: [_i3.Answer.t.questionId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Question] and the given [AnswerAttempt]s
  /// by setting each [AnswerAttempt]'s foreign key `questionId` to refer to this [Question].
  Future<void> answerAttempt(
    _i1.Session session,
    Question question,
    List<_i4.AnswerAttempt> answerAttempt, {
    _i1.Transaction? transaction,
  }) async {
    if (answerAttempt.any((e) => e.id == null)) {
      throw ArgumentError.notNull('answerAttempt.id');
    }
    if (question.id == null) {
      throw ArgumentError.notNull('question.id');
    }

    var $answerAttempt = answerAttempt
        .map((e) => e.copyWith(questionId: question.id))
        .toList();
    await session.db.update<_i4.AnswerAttempt>(
      $answerAttempt,
      columns: [_i4.AnswerAttempt.t.questionId],
      transaction: transaction,
    );
  }
}

class QuestionAttachRowRepository {
  const QuestionAttachRowRepository._();

  /// Creates a relation between the given [Question] and [Test]
  /// by setting the [Question]'s foreign key `testId` to refer to the [Test].
  Future<void> test(
    _i1.Session session,
    Question question,
    _i2.Test test, {
    _i1.Transaction? transaction,
  }) async {
    if (question.id == null) {
      throw ArgumentError.notNull('question.id');
    }
    if (test.id == null) {
      throw ArgumentError.notNull('test.id');
    }

    var $question = question.copyWith(testId: test.id);
    await session.db.updateRow<Question>(
      $question,
      columns: [Question.t.testId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Question] and the given [Answer]
  /// by setting the [Answer]'s foreign key `questionId` to refer to this [Question].
  Future<void> answer(
    _i1.Session session,
    Question question,
    _i3.Answer answer, {
    _i1.Transaction? transaction,
  }) async {
    if (answer.id == null) {
      throw ArgumentError.notNull('answer.id');
    }
    if (question.id == null) {
      throw ArgumentError.notNull('question.id');
    }

    var $answer = answer.copyWith(questionId: question.id);
    await session.db.updateRow<_i3.Answer>(
      $answer,
      columns: [_i3.Answer.t.questionId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Question] and the given [AnswerAttempt]
  /// by setting the [AnswerAttempt]'s foreign key `questionId` to refer to this [Question].
  Future<void> answerAttempt(
    _i1.Session session,
    Question question,
    _i4.AnswerAttempt answerAttempt, {
    _i1.Transaction? transaction,
  }) async {
    if (answerAttempt.id == null) {
      throw ArgumentError.notNull('answerAttempt.id');
    }
    if (question.id == null) {
      throw ArgumentError.notNull('question.id');
    }

    var $answerAttempt = answerAttempt.copyWith(questionId: question.id);
    await session.db.updateRow<_i4.AnswerAttempt>(
      $answerAttempt,
      columns: [_i4.AnswerAttempt.t.questionId],
      transaction: transaction,
    );
  }
}
