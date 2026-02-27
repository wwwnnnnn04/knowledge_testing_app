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
import 'answer_attempt.dart' as _i3;
import 'package:knowledge_testing_app_server/src/generated/protocol.dart'
    as _i4;

abstract class Answer implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Answer._({
    this.id,
    required this.text,
    required this.isCorrect,
    required this.questionId,
    this.question,
    this.answerAttempt,
  });

  factory Answer({
    int? id,
    required String text,
    required bool isCorrect,
    required int questionId,
    _i2.Question? question,
    List<_i3.AnswerAttempt>? answerAttempt,
  }) = _AnswerImpl;

  factory Answer.fromJson(Map<String, dynamic> jsonSerialization) {
    return Answer(
      id: jsonSerialization['id'] as int?,
      text: jsonSerialization['text'] as String,
      isCorrect: jsonSerialization['isCorrect'] as bool,
      questionId: jsonSerialization['questionId'] as int,
      question: jsonSerialization['question'] == null
          ? null
          : _i4.Protocol().deserialize<_i2.Question>(
              jsonSerialization['question'],
            ),
      answerAttempt: jsonSerialization['answerAttempt'] == null
          ? null
          : _i4.Protocol().deserialize<List<_i3.AnswerAttempt>>(
              jsonSerialization['answerAttempt'],
            ),
    );
  }

  static final t = AnswerTable();

  static const db = AnswerRepository._();

  @override
  int? id;

  String text;

  bool isCorrect;

  int questionId;

  _i2.Question? question;

  List<_i3.AnswerAttempt>? answerAttempt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Answer]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Answer copyWith({
    int? id,
    String? text,
    bool? isCorrect,
    int? questionId,
    _i2.Question? question,
    List<_i3.AnswerAttempt>? answerAttempt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Answer',
      if (id != null) 'id': id,
      'text': text,
      'isCorrect': isCorrect,
      'questionId': questionId,
      if (question != null) 'question': question?.toJson(),
      if (answerAttempt != null)
        'answerAttempt': answerAttempt?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Answer',
      if (id != null) 'id': id,
      'text': text,
      'isCorrect': isCorrect,
      'questionId': questionId,
      if (question != null) 'question': question?.toJsonForProtocol(),
      if (answerAttempt != null)
        'answerAttempt': answerAttempt?.toJson(
          valueToJson: (v) => v.toJsonForProtocol(),
        ),
    };
  }

  static AnswerInclude include({
    _i2.QuestionInclude? question,
    _i3.AnswerAttemptIncludeList? answerAttempt,
  }) {
    return AnswerInclude._(
      question: question,
      answerAttempt: answerAttempt,
    );
  }

  static AnswerIncludeList includeList({
    _i1.WhereExpressionBuilder<AnswerTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AnswerTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AnswerTable>? orderByList,
    AnswerInclude? include,
  }) {
    return AnswerIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Answer.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Answer.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AnswerImpl extends Answer {
  _AnswerImpl({
    int? id,
    required String text,
    required bool isCorrect,
    required int questionId,
    _i2.Question? question,
    List<_i3.AnswerAttempt>? answerAttempt,
  }) : super._(
         id: id,
         text: text,
         isCorrect: isCorrect,
         questionId: questionId,
         question: question,
         answerAttempt: answerAttempt,
       );

  /// Returns a shallow copy of this [Answer]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Answer copyWith({
    Object? id = _Undefined,
    String? text,
    bool? isCorrect,
    int? questionId,
    Object? question = _Undefined,
    Object? answerAttempt = _Undefined,
  }) {
    return Answer(
      id: id is int? ? id : this.id,
      text: text ?? this.text,
      isCorrect: isCorrect ?? this.isCorrect,
      questionId: questionId ?? this.questionId,
      question: question is _i2.Question?
          ? question
          : this.question?.copyWith(),
      answerAttempt: answerAttempt is List<_i3.AnswerAttempt>?
          ? answerAttempt
          : this.answerAttempt?.map((e0) => e0.copyWith()).toList(),
    );
  }
}

class AnswerUpdateTable extends _i1.UpdateTable<AnswerTable> {
  AnswerUpdateTable(super.table);

  _i1.ColumnValue<String, String> text(String value) => _i1.ColumnValue(
    table.text,
    value,
  );

  _i1.ColumnValue<bool, bool> isCorrect(bool value) => _i1.ColumnValue(
    table.isCorrect,
    value,
  );

  _i1.ColumnValue<int, int> questionId(int value) => _i1.ColumnValue(
    table.questionId,
    value,
  );
}

class AnswerTable extends _i1.Table<int?> {
  AnswerTable({super.tableRelation}) : super(tableName: 'answer') {
    updateTable = AnswerUpdateTable(this);
    text = _i1.ColumnString(
      'text',
      this,
    );
    isCorrect = _i1.ColumnBool(
      'isCorrect',
      this,
    );
    questionId = _i1.ColumnInt(
      'questionId',
      this,
    );
  }

  late final AnswerUpdateTable updateTable;

  late final _i1.ColumnString text;

  late final _i1.ColumnBool isCorrect;

  late final _i1.ColumnInt questionId;

  _i2.QuestionTable? _question;

  _i3.AnswerAttemptTable? ___answerAttempt;

  _i1.ManyRelation<_i3.AnswerAttemptTable>? _answerAttempt;

  _i2.QuestionTable get question {
    if (_question != null) return _question!;
    _question = _i1.createRelationTable(
      relationFieldName: 'question',
      field: Answer.t.questionId,
      foreignField: _i2.Question.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.QuestionTable(tableRelation: foreignTableRelation),
    );
    return _question!;
  }

  _i3.AnswerAttemptTable get __answerAttempt {
    if (___answerAttempt != null) return ___answerAttempt!;
    ___answerAttempt = _i1.createRelationTable(
      relationFieldName: '__answerAttempt',
      field: Answer.t.id,
      foreignField: _i3.AnswerAttempt.t.answerId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.AnswerAttemptTable(tableRelation: foreignTableRelation),
    );
    return ___answerAttempt!;
  }

  _i1.ManyRelation<_i3.AnswerAttemptTable> get answerAttempt {
    if (_answerAttempt != null) return _answerAttempt!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'answerAttempt',
      field: Answer.t.id,
      foreignField: _i3.AnswerAttempt.t.answerId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.AnswerAttemptTable(tableRelation: foreignTableRelation),
    );
    _answerAttempt = _i1.ManyRelation<_i3.AnswerAttemptTable>(
      tableWithRelations: relationTable,
      table: _i3.AnswerAttemptTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _answerAttempt!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    text,
    isCorrect,
    questionId,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'question') {
      return question;
    }
    if (relationField == 'answerAttempt') {
      return __answerAttempt;
    }
    return null;
  }
}

class AnswerInclude extends _i1.IncludeObject {
  AnswerInclude._({
    _i2.QuestionInclude? question,
    _i3.AnswerAttemptIncludeList? answerAttempt,
  }) {
    _question = question;
    _answerAttempt = answerAttempt;
  }

  _i2.QuestionInclude? _question;

  _i3.AnswerAttemptIncludeList? _answerAttempt;

  @override
  Map<String, _i1.Include?> get includes => {
    'question': _question,
    'answerAttempt': _answerAttempt,
  };

  @override
  _i1.Table<int?> get table => Answer.t;
}

class AnswerIncludeList extends _i1.IncludeList {
  AnswerIncludeList._({
    _i1.WhereExpressionBuilder<AnswerTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Answer.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Answer.t;
}

class AnswerRepository {
  const AnswerRepository._();

  final attach = const AnswerAttachRepository._();

  final attachRow = const AnswerAttachRowRepository._();

  final detach = const AnswerDetachRepository._();

  final detachRow = const AnswerDetachRowRepository._();

  /// Returns a list of [Answer]s matching the given query parameters.
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
  Future<List<Answer>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AnswerTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AnswerTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AnswerTable>? orderByList,
    _i1.Transaction? transaction,
    AnswerInclude? include,
  }) async {
    return session.db.find<Answer>(
      where: where?.call(Answer.t),
      orderBy: orderBy?.call(Answer.t),
      orderByList: orderByList?.call(Answer.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Answer] matching the given query parameters.
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
  Future<Answer?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AnswerTable>? where,
    int? offset,
    _i1.OrderByBuilder<AnswerTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AnswerTable>? orderByList,
    _i1.Transaction? transaction,
    AnswerInclude? include,
  }) async {
    return session.db.findFirstRow<Answer>(
      where: where?.call(Answer.t),
      orderBy: orderBy?.call(Answer.t),
      orderByList: orderByList?.call(Answer.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Answer] by its [id] or null if no such row exists.
  Future<Answer?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    AnswerInclude? include,
  }) async {
    return session.db.findById<Answer>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Answer]s in the list and returns the inserted rows.
  ///
  /// The returned [Answer]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Answer>> insert(
    _i1.Session session,
    List<Answer> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Answer>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Answer] and returns the inserted row.
  ///
  /// The returned [Answer] will have its `id` field set.
  Future<Answer> insertRow(
    _i1.Session session,
    Answer row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Answer>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Answer]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Answer>> update(
    _i1.Session session,
    List<Answer> rows, {
    _i1.ColumnSelections<AnswerTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Answer>(
      rows,
      columns: columns?.call(Answer.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Answer]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Answer> updateRow(
    _i1.Session session,
    Answer row, {
    _i1.ColumnSelections<AnswerTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Answer>(
      row,
      columns: columns?.call(Answer.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Answer] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Answer?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<AnswerUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Answer>(
      id,
      columnValues: columnValues(Answer.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Answer]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Answer>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<AnswerUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<AnswerTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AnswerTable>? orderBy,
    _i1.OrderByListBuilder<AnswerTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Answer>(
      columnValues: columnValues(Answer.t.updateTable),
      where: where(Answer.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Answer.t),
      orderByList: orderByList?.call(Answer.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Answer]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Answer>> delete(
    _i1.Session session,
    List<Answer> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Answer>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Answer].
  Future<Answer> deleteRow(
    _i1.Session session,
    Answer row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Answer>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Answer>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<AnswerTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Answer>(
      where: where(Answer.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AnswerTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Answer>(
      where: where?.call(Answer.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class AnswerAttachRepository {
  const AnswerAttachRepository._();

  /// Creates a relation between this [Answer] and the given [AnswerAttempt]s
  /// by setting each [AnswerAttempt]'s foreign key `answerId` to refer to this [Answer].
  Future<void> answerAttempt(
    _i1.Session session,
    Answer answer,
    List<_i3.AnswerAttempt> answerAttempt, {
    _i1.Transaction? transaction,
  }) async {
    if (answerAttempt.any((e) => e.id == null)) {
      throw ArgumentError.notNull('answerAttempt.id');
    }
    if (answer.id == null) {
      throw ArgumentError.notNull('answer.id');
    }

    var $answerAttempt = answerAttempt
        .map((e) => e.copyWith(answerId: answer.id))
        .toList();
    await session.db.update<_i3.AnswerAttempt>(
      $answerAttempt,
      columns: [_i3.AnswerAttempt.t.answerId],
      transaction: transaction,
    );
  }
}

class AnswerAttachRowRepository {
  const AnswerAttachRowRepository._();

  /// Creates a relation between the given [Answer] and [Question]
  /// by setting the [Answer]'s foreign key `questionId` to refer to the [Question].
  Future<void> question(
    _i1.Session session,
    Answer answer,
    _i2.Question question, {
    _i1.Transaction? transaction,
  }) async {
    if (answer.id == null) {
      throw ArgumentError.notNull('answer.id');
    }
    if (question.id == null) {
      throw ArgumentError.notNull('question.id');
    }

    var $answer = answer.copyWith(questionId: question.id);
    await session.db.updateRow<Answer>(
      $answer,
      columns: [Answer.t.questionId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Answer] and the given [AnswerAttempt]
  /// by setting the [AnswerAttempt]'s foreign key `answerId` to refer to this [Answer].
  Future<void> answerAttempt(
    _i1.Session session,
    Answer answer,
    _i3.AnswerAttempt answerAttempt, {
    _i1.Transaction? transaction,
  }) async {
    if (answerAttempt.id == null) {
      throw ArgumentError.notNull('answerAttempt.id');
    }
    if (answer.id == null) {
      throw ArgumentError.notNull('answer.id');
    }

    var $answerAttempt = answerAttempt.copyWith(answerId: answer.id);
    await session.db.updateRow<_i3.AnswerAttempt>(
      $answerAttempt,
      columns: [_i3.AnswerAttempt.t.answerId],
      transaction: transaction,
    );
  }
}

class AnswerDetachRepository {
  const AnswerDetachRepository._();

  /// Detaches the relation between this [Answer] and the given [AnswerAttempt]
  /// by setting the [AnswerAttempt]'s foreign key `answerId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> answerAttempt(
    _i1.Session session,
    List<_i3.AnswerAttempt> answerAttempt, {
    _i1.Transaction? transaction,
  }) async {
    if (answerAttempt.any((e) => e.id == null)) {
      throw ArgumentError.notNull('answerAttempt.id');
    }

    var $answerAttempt = answerAttempt
        .map((e) => e.copyWith(answerId: null))
        .toList();
    await session.db.update<_i3.AnswerAttempt>(
      $answerAttempt,
      columns: [_i3.AnswerAttempt.t.answerId],
      transaction: transaction,
    );
  }
}

class AnswerDetachRowRepository {
  const AnswerDetachRowRepository._();

  /// Detaches the relation between this [Answer] and the given [AnswerAttempt]
  /// by setting the [AnswerAttempt]'s foreign key `answerId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> answerAttempt(
    _i1.Session session,
    _i3.AnswerAttempt answerAttempt, {
    _i1.Transaction? transaction,
  }) async {
    if (answerAttempt.id == null) {
      throw ArgumentError.notNull('answerAttempt.id');
    }

    var $answerAttempt = answerAttempt.copyWith(answerId: null);
    await session.db.updateRow<_i3.AnswerAttempt>(
      $answerAttempt,
      columns: [_i3.AnswerAttempt.t.answerId],
      transaction: transaction,
    );
  }
}
