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
import 'question.dart' as _i2;
import 'answer.dart' as _i3;
import 'attempt.dart' as _i4;
import 'package:knowledge_testing_app_server/src/generated/protocol.dart'
    as _i5;

abstract class AnswerAttempt
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  AnswerAttempt._({
    this.id,
    required this.isCorrect,
    required this.questionId,
    this.question,
    required this.answerId,
    this.answer,
    required this.attemptId,
    this.attempt,
  });

  factory AnswerAttempt({
    int? id,
    required bool isCorrect,
    required int questionId,
    _i2.Question? question,
    required int answerId,
    _i3.Answer? answer,
    required int attemptId,
    _i4.Attempt? attempt,
  }) = _AnswerAttemptImpl;

  factory AnswerAttempt.fromJson(Map<String, dynamic> jsonSerialization) {
    return AnswerAttempt(
      id: jsonSerialization['id'] as int?,
      isCorrect: jsonSerialization['isCorrect'] as bool,
      questionId: jsonSerialization['questionId'] as int,
      question: jsonSerialization['question'] == null
          ? null
          : _i5.Protocol().deserialize<_i2.Question>(
              jsonSerialization['question'],
            ),
      answerId: jsonSerialization['answerId'] as int,
      answer: jsonSerialization['answer'] == null
          ? null
          : _i5.Protocol().deserialize<_i3.Answer>(jsonSerialization['answer']),
      attemptId: jsonSerialization['attemptId'] as int,
      attempt: jsonSerialization['attempt'] == null
          ? null
          : _i5.Protocol().deserialize<_i4.Attempt>(
              jsonSerialization['attempt'],
            ),
    );
  }

  static final t = AnswerAttemptTable();

  static const db = AnswerAttemptRepository._();

  @override
  int? id;

  bool isCorrect;

  int questionId;

  _i2.Question? question;

  int answerId;

  _i3.Answer? answer;

  int attemptId;

  _i4.Attempt? attempt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [AnswerAttempt]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  AnswerAttempt copyWith({
    int? id,
    bool? isCorrect,
    int? questionId,
    _i2.Question? question,
    int? answerId,
    _i3.Answer? answer,
    int? attemptId,
    _i4.Attempt? attempt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'AnswerAttempt',
      if (id != null) 'id': id,
      'isCorrect': isCorrect,
      'questionId': questionId,
      if (question != null) 'question': question?.toJson(),
      'answerId': answerId,
      if (answer != null) 'answer': answer?.toJson(),
      'attemptId': attemptId,
      if (attempt != null) 'attempt': attempt?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'AnswerAttempt',
      if (id != null) 'id': id,
      'isCorrect': isCorrect,
      'questionId': questionId,
      if (question != null) 'question': question?.toJsonForProtocol(),
      'answerId': answerId,
      if (answer != null) 'answer': answer?.toJsonForProtocol(),
      'attemptId': attemptId,
      if (attempt != null) 'attempt': attempt?.toJsonForProtocol(),
    };
  }

  static AnswerAttemptInclude include({
    _i2.QuestionInclude? question,
    _i3.AnswerInclude? answer,
    _i4.AttemptInclude? attempt,
  }) {
    return AnswerAttemptInclude._(
      question: question,
      answer: answer,
      attempt: attempt,
    );
  }

  static AnswerAttemptIncludeList includeList({
    _i1.WhereExpressionBuilder<AnswerAttemptTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AnswerAttemptTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AnswerAttemptTable>? orderByList,
    AnswerAttemptInclude? include,
  }) {
    return AnswerAttemptIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(AnswerAttempt.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(AnswerAttempt.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AnswerAttemptImpl extends AnswerAttempt {
  _AnswerAttemptImpl({
    int? id,
    required bool isCorrect,
    required int questionId,
    _i2.Question? question,
    required int answerId,
    _i3.Answer? answer,
    required int attemptId,
    _i4.Attempt? attempt,
  }) : super._(
         id: id,
         isCorrect: isCorrect,
         questionId: questionId,
         question: question,
         answerId: answerId,
         answer: answer,
         attemptId: attemptId,
         attempt: attempt,
       );

  /// Returns a shallow copy of this [AnswerAttempt]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  AnswerAttempt copyWith({
    Object? id = _Undefined,
    bool? isCorrect,
    int? questionId,
    Object? question = _Undefined,
    int? answerId,
    Object? answer = _Undefined,
    int? attemptId,
    Object? attempt = _Undefined,
  }) {
    return AnswerAttempt(
      id: id is int? ? id : this.id,
      isCorrect: isCorrect ?? this.isCorrect,
      questionId: questionId ?? this.questionId,
      question: question is _i2.Question?
          ? question
          : this.question?.copyWith(),
      answerId: answerId ?? this.answerId,
      answer: answer is _i3.Answer? ? answer : this.answer?.copyWith(),
      attemptId: attemptId ?? this.attemptId,
      attempt: attempt is _i4.Attempt? ? attempt : this.attempt?.copyWith(),
    );
  }
}

class AnswerAttemptUpdateTable extends _i1.UpdateTable<AnswerAttemptTable> {
  AnswerAttemptUpdateTable(super.table);

  _i1.ColumnValue<bool, bool> isCorrect(bool value) => _i1.ColumnValue(
    table.isCorrect,
    value,
  );

  _i1.ColumnValue<int, int> questionId(int value) => _i1.ColumnValue(
    table.questionId,
    value,
  );

  _i1.ColumnValue<int, int> answerId(int value) => _i1.ColumnValue(
    table.answerId,
    value,
  );

  _i1.ColumnValue<int, int> attemptId(int value) => _i1.ColumnValue(
    table.attemptId,
    value,
  );
}

class AnswerAttemptTable extends _i1.Table<int?> {
  AnswerAttemptTable({super.tableRelation})
    : super(tableName: 'answer_attempt') {
    updateTable = AnswerAttemptUpdateTable(this);
    isCorrect = _i1.ColumnBool(
      'isCorrect',
      this,
    );
    questionId = _i1.ColumnInt(
      'questionId',
      this,
    );
    answerId = _i1.ColumnInt(
      'answerId',
      this,
    );
    attemptId = _i1.ColumnInt(
      'attemptId',
      this,
    );
  }

  late final AnswerAttemptUpdateTable updateTable;

  late final _i1.ColumnBool isCorrect;

  late final _i1.ColumnInt questionId;

  _i2.QuestionTable? _question;

  late final _i1.ColumnInt answerId;

  _i3.AnswerTable? _answer;

  late final _i1.ColumnInt attemptId;

  _i4.AttemptTable? _attempt;

  _i2.QuestionTable get question {
    if (_question != null) return _question!;
    _question = _i1.createRelationTable(
      relationFieldName: 'question',
      field: AnswerAttempt.t.questionId,
      foreignField: _i2.Question.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.QuestionTable(tableRelation: foreignTableRelation),
    );
    return _question!;
  }

  _i3.AnswerTable get answer {
    if (_answer != null) return _answer!;
    _answer = _i1.createRelationTable(
      relationFieldName: 'answer',
      field: AnswerAttempt.t.answerId,
      foreignField: _i3.Answer.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.AnswerTable(tableRelation: foreignTableRelation),
    );
    return _answer!;
  }

  _i4.AttemptTable get attempt {
    if (_attempt != null) return _attempt!;
    _attempt = _i1.createRelationTable(
      relationFieldName: 'attempt',
      field: AnswerAttempt.t.attemptId,
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
    isCorrect,
    questionId,
    answerId,
    attemptId,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'question') {
      return question;
    }
    if (relationField == 'answer') {
      return answer;
    }
    if (relationField == 'attempt') {
      return attempt;
    }
    return null;
  }
}

class AnswerAttemptInclude extends _i1.IncludeObject {
  AnswerAttemptInclude._({
    _i2.QuestionInclude? question,
    _i3.AnswerInclude? answer,
    _i4.AttemptInclude? attempt,
  }) {
    _question = question;
    _answer = answer;
    _attempt = attempt;
  }

  _i2.QuestionInclude? _question;

  _i3.AnswerInclude? _answer;

  _i4.AttemptInclude? _attempt;

  @override
  Map<String, _i1.Include?> get includes => {
    'question': _question,
    'answer': _answer,
    'attempt': _attempt,
  };

  @override
  _i1.Table<int?> get table => AnswerAttempt.t;
}

class AnswerAttemptIncludeList extends _i1.IncludeList {
  AnswerAttemptIncludeList._({
    _i1.WhereExpressionBuilder<AnswerAttemptTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(AnswerAttempt.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => AnswerAttempt.t;
}

class AnswerAttemptRepository {
  const AnswerAttemptRepository._();

  final attachRow = const AnswerAttemptAttachRowRepository._();

  /// Returns a list of [AnswerAttempt]s matching the given query parameters.
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
  Future<List<AnswerAttempt>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AnswerAttemptTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AnswerAttemptTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AnswerAttemptTable>? orderByList,
    _i1.Transaction? transaction,
    AnswerAttemptInclude? include,
  }) async {
    return session.db.find<AnswerAttempt>(
      where: where?.call(AnswerAttempt.t),
      orderBy: orderBy?.call(AnswerAttempt.t),
      orderByList: orderByList?.call(AnswerAttempt.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [AnswerAttempt] matching the given query parameters.
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
  Future<AnswerAttempt?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AnswerAttemptTable>? where,
    int? offset,
    _i1.OrderByBuilder<AnswerAttemptTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AnswerAttemptTable>? orderByList,
    _i1.Transaction? transaction,
    AnswerAttemptInclude? include,
  }) async {
    return session.db.findFirstRow<AnswerAttempt>(
      where: where?.call(AnswerAttempt.t),
      orderBy: orderBy?.call(AnswerAttempt.t),
      orderByList: orderByList?.call(AnswerAttempt.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [AnswerAttempt] by its [id] or null if no such row exists.
  Future<AnswerAttempt?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    AnswerAttemptInclude? include,
  }) async {
    return session.db.findById<AnswerAttempt>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [AnswerAttempt]s in the list and returns the inserted rows.
  ///
  /// The returned [AnswerAttempt]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<AnswerAttempt>> insert(
    _i1.Session session,
    List<AnswerAttempt> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<AnswerAttempt>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [AnswerAttempt] and returns the inserted row.
  ///
  /// The returned [AnswerAttempt] will have its `id` field set.
  Future<AnswerAttempt> insertRow(
    _i1.Session session,
    AnswerAttempt row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<AnswerAttempt>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [AnswerAttempt]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<AnswerAttempt>> update(
    _i1.Session session,
    List<AnswerAttempt> rows, {
    _i1.ColumnSelections<AnswerAttemptTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<AnswerAttempt>(
      rows,
      columns: columns?.call(AnswerAttempt.t),
      transaction: transaction,
    );
  }

  /// Updates a single [AnswerAttempt]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<AnswerAttempt> updateRow(
    _i1.Session session,
    AnswerAttempt row, {
    _i1.ColumnSelections<AnswerAttemptTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<AnswerAttempt>(
      row,
      columns: columns?.call(AnswerAttempt.t),
      transaction: transaction,
    );
  }

  /// Updates a single [AnswerAttempt] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<AnswerAttempt?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<AnswerAttemptUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<AnswerAttempt>(
      id,
      columnValues: columnValues(AnswerAttempt.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [AnswerAttempt]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<AnswerAttempt>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<AnswerAttemptUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<AnswerAttemptTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AnswerAttemptTable>? orderBy,
    _i1.OrderByListBuilder<AnswerAttemptTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<AnswerAttempt>(
      columnValues: columnValues(AnswerAttempt.t.updateTable),
      where: where(AnswerAttempt.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(AnswerAttempt.t),
      orderByList: orderByList?.call(AnswerAttempt.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [AnswerAttempt]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<AnswerAttempt>> delete(
    _i1.Session session,
    List<AnswerAttempt> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<AnswerAttempt>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [AnswerAttempt].
  Future<AnswerAttempt> deleteRow(
    _i1.Session session,
    AnswerAttempt row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<AnswerAttempt>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<AnswerAttempt>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<AnswerAttemptTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<AnswerAttempt>(
      where: where(AnswerAttempt.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AnswerAttemptTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<AnswerAttempt>(
      where: where?.call(AnswerAttempt.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class AnswerAttemptAttachRowRepository {
  const AnswerAttemptAttachRowRepository._();

  /// Creates a relation between the given [AnswerAttempt] and [Question]
  /// by setting the [AnswerAttempt]'s foreign key `questionId` to refer to the [Question].
  Future<void> question(
    _i1.Session session,
    AnswerAttempt answerAttempt,
    _i2.Question question, {
    _i1.Transaction? transaction,
  }) async {
    if (answerAttempt.id == null) {
      throw ArgumentError.notNull('answerAttempt.id');
    }
    if (question.id == null) {
      throw ArgumentError.notNull('question.id');
    }

    var $answerAttempt = answerAttempt.copyWith(questionId: question.id);
    await session.db.updateRow<AnswerAttempt>(
      $answerAttempt,
      columns: [AnswerAttempt.t.questionId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [AnswerAttempt] and [Answer]
  /// by setting the [AnswerAttempt]'s foreign key `answerId` to refer to the [Answer].
  Future<void> answer(
    _i1.Session session,
    AnswerAttempt answerAttempt,
    _i3.Answer answer, {
    _i1.Transaction? transaction,
  }) async {
    if (answerAttempt.id == null) {
      throw ArgumentError.notNull('answerAttempt.id');
    }
    if (answer.id == null) {
      throw ArgumentError.notNull('answer.id');
    }

    var $answerAttempt = answerAttempt.copyWith(answerId: answer.id);
    await session.db.updateRow<AnswerAttempt>(
      $answerAttempt,
      columns: [AnswerAttempt.t.answerId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [AnswerAttempt] and [Attempt]
  /// by setting the [AnswerAttempt]'s foreign key `attemptId` to refer to the [Attempt].
  Future<void> attempt(
    _i1.Session session,
    AnswerAttempt answerAttempt,
    _i4.Attempt attempt, {
    _i1.Transaction? transaction,
  }) async {
    if (answerAttempt.id == null) {
      throw ArgumentError.notNull('answerAttempt.id');
    }
    if (attempt.id == null) {
      throw ArgumentError.notNull('attempt.id');
    }

    var $answerAttempt = answerAttempt.copyWith(attemptId: attempt.id);
    await session.db.updateRow<AnswerAttempt>(
      $answerAttempt,
      columns: [AnswerAttempt.t.attemptId],
      transaction: transaction,
    );
  }
}
