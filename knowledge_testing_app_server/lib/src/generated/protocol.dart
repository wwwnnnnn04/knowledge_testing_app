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
import 'package:serverpod/protocol.dart' as _i2;
import 'package:serverpod_auth_idp_server/serverpod_auth_idp_server.dart'
    as _i3;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _i4;
import 'answer.dart' as _i5;
import 'answer_attempt.dart' as _i6;
import 'attempt.dart' as _i7;
import 'category.dart' as _i8;
import 'certificate.dart' as _i9;
import 'greetings/greeting.dart' as _i10;
import 'log.dart' as _i11;
import 'question.dart' as _i12;
import 'result.dart' as _i13;
import 'role.dart' as _i14;
import 'tag.dart' as _i15;
import 'test.dart' as _i16;
import 'test_tag.dart' as _i17;
import 'user.dart' as _i18;
import 'package:knowledge_testing_app_server/src/generated/result.dart' as _i19;
import 'package:knowledge_testing_app_server/src/generated/certificate.dart'
    as _i20;
import 'package:knowledge_testing_app_server/src/generated/category.dart'
    as _i21;
import 'package:knowledge_testing_app_server/src/generated/test.dart' as _i22;
export 'answer.dart';
export 'answer_attempt.dart';
export 'attempt.dart';
export 'category.dart';
export 'certificate.dart';
export 'greetings/greeting.dart';
export 'log.dart';
export 'question.dart';
export 'result.dart';
export 'role.dart';
export 'tag.dart';
export 'test.dart';
export 'test_tag.dart';
export 'user.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    _i2.TableDefinition(
      name: 'answer',
      dartName: 'Answer',
      schema: 'public',
      module: 'knowledge_testing_app',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'answer_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'text',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'isCorrect',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'questionId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'answer_fk_0',
          columns: ['questionId'],
          referenceTable: 'question',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'answer_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'answer_attempt',
      dartName: 'AnswerAttempt',
      schema: 'public',
      module: 'knowledge_testing_app',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'answer_attempt_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'isCorrect',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'questionId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'answerId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'attemptId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'answer_attempt_fk_0',
          columns: ['questionId'],
          referenceTable: 'question',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'answer_attempt_fk_1',
          columns: ['answerId'],
          referenceTable: 'answer',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'answer_attempt_fk_2',
          columns: ['attemptId'],
          referenceTable: 'attempt',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'answer_attempt_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'attempt',
      dartName: 'Attempt',
      schema: 'public',
      module: 'knowledge_testing_app',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'attempt_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'testId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'attempt_fk_0',
          columns: ['userId'],
          referenceTable: 'user',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'attempt_fk_1',
          columns: ['testId'],
          referenceTable: 'test',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'attempt_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'category',
      dartName: 'Category',
      schema: 'public',
      module: 'knowledge_testing_app',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'category_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'category_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'certificate',
      dartName: 'Certificate',
      schema: 'public',
      module: 'knowledge_testing_app',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'certificate_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'testId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'attemptId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'percentage',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'certificate_fk_0',
          columns: ['userId'],
          referenceTable: 'user',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'certificate_fk_1',
          columns: ['testId'],
          referenceTable: 'test',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'certificate_fk_2',
          columns: ['attemptId'],
          referenceTable: 'attempt',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'certificate_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'log',
      dartName: 'Log',
      schema: 'public',
      module: 'knowledge_testing_app',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'log_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'action',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'log_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'question',
      dartName: 'Question',
      schema: 'public',
      module: 'knowledge_testing_app',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'question_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'text',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'order',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'testId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'question_fk_0',
          columns: ['testId'],
          referenceTable: 'test',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'question_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'result',
      dartName: 'Result',
      schema: 'public',
      module: 'knowledge_testing_app',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'result_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'attemptId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'score',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'maxScore',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'percentage',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'passed',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'result_fk_0',
          columns: ['attemptId'],
          referenceTable: 'attempt',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'result_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'attempt_unique',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'attemptId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'tag',
      dartName: 'Tag',
      schema: 'public',
      module: 'knowledge_testing_app',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'tag_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'tag_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'test',
      dartName: 'Test',
      schema: 'public',
      module: 'knowledge_testing_app',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'test_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'title',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'creatorId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'categoryId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'test_fk_0',
          columns: ['creatorId'],
          referenceTable: 'user',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'test_fk_1',
          columns: ['categoryId'],
          referenceTable: 'category',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'test_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'test_tag',
      dartName: 'TestTag',
      schema: 'public',
      module: 'knowledge_testing_app',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'test_tag_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'testId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'tagId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'test_tag_fk_0',
          columns: ['testId'],
          referenceTable: 'test',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'test_tag_fk_1',
          columns: ['tagId'],
          referenceTable: 'tag',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'test_tag_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'user',
      dartName: 'User',
      schema: 'public',
      module: 'knowledge_testing_app',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'user_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'username',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'email',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'password',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'role',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:Role',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'user_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    ..._i3.Protocol.targetTableDefinitions,
    ..._i4.Protocol.targetTableDefinitions,
    ..._i2.Protocol.targetTableDefinitions,
  ];

  static String? getClassNameFromObjectJson(dynamic data) {
    if (data is! Map) return null;
    final className = data['__className__'] as String?;
    return className;
  }

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;

    final dataClassName = getClassNameFromObjectJson(data);
    if (dataClassName != null && dataClassName != getClassNameForType(t)) {
      try {
        return deserializeByClassName({
          'className': dataClassName,
          'data': data,
        });
      } on FormatException catch (_) {
        // If the className is not recognized (e.g., older client receiving
        // data with a new subtype), fall back to deserializing without the
        // className, using the expected type T.
      }
    }

    if (t == _i5.Answer) {
      return _i5.Answer.fromJson(data) as T;
    }
    if (t == _i6.AnswerAttempt) {
      return _i6.AnswerAttempt.fromJson(data) as T;
    }
    if (t == _i7.Attempt) {
      return _i7.Attempt.fromJson(data) as T;
    }
    if (t == _i8.Category) {
      return _i8.Category.fromJson(data) as T;
    }
    if (t == _i9.Certificate) {
      return _i9.Certificate.fromJson(data) as T;
    }
    if (t == _i10.Greeting) {
      return _i10.Greeting.fromJson(data) as T;
    }
    if (t == _i11.Log) {
      return _i11.Log.fromJson(data) as T;
    }
    if (t == _i12.Question) {
      return _i12.Question.fromJson(data) as T;
    }
    if (t == _i13.Result) {
      return _i13.Result.fromJson(data) as T;
    }
    if (t == _i14.Role) {
      return _i14.Role.fromJson(data) as T;
    }
    if (t == _i15.Tag) {
      return _i15.Tag.fromJson(data) as T;
    }
    if (t == _i16.Test) {
      return _i16.Test.fromJson(data) as T;
    }
    if (t == _i17.TestTag) {
      return _i17.TestTag.fromJson(data) as T;
    }
    if (t == _i18.User) {
      return _i18.User.fromJson(data) as T;
    }
    if (t == _i1.getType<_i5.Answer?>()) {
      return (data != null ? _i5.Answer.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.AnswerAttempt?>()) {
      return (data != null ? _i6.AnswerAttempt.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.Attempt?>()) {
      return (data != null ? _i7.Attempt.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.Category?>()) {
      return (data != null ? _i8.Category.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.Certificate?>()) {
      return (data != null ? _i9.Certificate.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.Greeting?>()) {
      return (data != null ? _i10.Greeting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.Log?>()) {
      return (data != null ? _i11.Log.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.Question?>()) {
      return (data != null ? _i12.Question.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.Result?>()) {
      return (data != null ? _i13.Result.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.Role?>()) {
      return (data != null ? _i14.Role.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.Tag?>()) {
      return (data != null ? _i15.Tag.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.Test?>()) {
      return (data != null ? _i16.Test.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.TestTag?>()) {
      return (data != null ? _i17.TestTag.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.User?>()) {
      return (data != null ? _i18.User.fromJson(data) : null) as T;
    }
    if (t == List<_i6.AnswerAttempt>) {
      return (data as List)
              .map((e) => deserialize<_i6.AnswerAttempt>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i6.AnswerAttempt>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i6.AnswerAttempt>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i9.Certificate>) {
      return (data as List).map((e) => deserialize<_i9.Certificate>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i9.Certificate>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i9.Certificate>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i16.Test>) {
      return (data as List).map((e) => deserialize<_i16.Test>(e)).toList() as T;
    }
    if (t == _i1.getType<List<_i16.Test>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<_i16.Test>(e)).toList()
              : null)
          as T;
    }
    if (t == List<_i5.Answer>) {
      return (data as List).map((e) => deserialize<_i5.Answer>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i5.Answer>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<_i5.Answer>(e)).toList()
              : null)
          as T;
    }
    if (t == List<_i17.TestTag>) {
      return (data as List).map((e) => deserialize<_i17.TestTag>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i17.TestTag>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<_i17.TestTag>(e)).toList()
              : null)
          as T;
    }
    if (t == List<_i7.Attempt>) {
      return (data as List).map((e) => deserialize<_i7.Attempt>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i7.Attempt>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<_i7.Attempt>(e)).toList()
              : null)
          as T;
    }
    if (t == List<_i12.Question>) {
      return (data as List).map((e) => deserialize<_i12.Question>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i12.Question>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i12.Question>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as T;
    }
    if (t == List<_i19.Result>) {
      return (data as List).map((e) => deserialize<_i19.Result>(e)).toList()
          as T;
    }
    if (t == List<_i20.Certificate>) {
      return (data as List)
              .map((e) => deserialize<_i20.Certificate>(e))
              .toList()
          as T;
    }
    if (t == List<_i21.Category>) {
      return (data as List).map((e) => deserialize<_i21.Category>(e)).toList()
          as T;
    }
    if (t == List<_i22.Test>) {
      return (data as List).map((e) => deserialize<_i22.Test>(e)).toList() as T;
    }
    try {
      return _i3.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i4.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i5.Answer => 'Answer',
      _i6.AnswerAttempt => 'AnswerAttempt',
      _i7.Attempt => 'Attempt',
      _i8.Category => 'Category',
      _i9.Certificate => 'Certificate',
      _i10.Greeting => 'Greeting',
      _i11.Log => 'Log',
      _i12.Question => 'Question',
      _i13.Result => 'Result',
      _i14.Role => 'Role',
      _i15.Tag => 'Tag',
      _i16.Test => 'Test',
      _i17.TestTag => 'TestTag',
      _i18.User => 'User',
      _ => null,
    };
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;

    if (data is Map<String, dynamic> && data['__className__'] is String) {
      return (data['__className__'] as String).replaceFirst(
        'knowledge_testing_app.',
        '',
      );
    }

    switch (data) {
      case _i5.Answer():
        return 'Answer';
      case _i6.AnswerAttempt():
        return 'AnswerAttempt';
      case _i7.Attempt():
        return 'Attempt';
      case _i8.Category():
        return 'Category';
      case _i9.Certificate():
        return 'Certificate';
      case _i10.Greeting():
        return 'Greeting';
      case _i11.Log():
        return 'Log';
      case _i12.Question():
        return 'Question';
      case _i13.Result():
        return 'Result';
      case _i14.Role():
        return 'Role';
      case _i15.Tag():
        return 'Tag';
      case _i16.Test():
        return 'Test';
      case _i17.TestTag():
        return 'TestTag';
      case _i18.User():
        return 'User';
    }
    className = _i2.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod.$className';
    }
    className = _i3.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_idp.$className';
    }
    className = _i4.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_core.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'Answer') {
      return deserialize<_i5.Answer>(data['data']);
    }
    if (dataClassName == 'AnswerAttempt') {
      return deserialize<_i6.AnswerAttempt>(data['data']);
    }
    if (dataClassName == 'Attempt') {
      return deserialize<_i7.Attempt>(data['data']);
    }
    if (dataClassName == 'Category') {
      return deserialize<_i8.Category>(data['data']);
    }
    if (dataClassName == 'Certificate') {
      return deserialize<_i9.Certificate>(data['data']);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_i10.Greeting>(data['data']);
    }
    if (dataClassName == 'Log') {
      return deserialize<_i11.Log>(data['data']);
    }
    if (dataClassName == 'Question') {
      return deserialize<_i12.Question>(data['data']);
    }
    if (dataClassName == 'Result') {
      return deserialize<_i13.Result>(data['data']);
    }
    if (dataClassName == 'Role') {
      return deserialize<_i14.Role>(data['data']);
    }
    if (dataClassName == 'Tag') {
      return deserialize<_i15.Tag>(data['data']);
    }
    if (dataClassName == 'Test') {
      return deserialize<_i16.Test>(data['data']);
    }
    if (dataClassName == 'TestTag') {
      return deserialize<_i17.TestTag>(data['data']);
    }
    if (dataClassName == 'User') {
      return deserialize<_i18.User>(data['data']);
    }
    if (dataClassName.startsWith('serverpod.')) {
      data['className'] = dataClassName.substring(10);
      return _i2.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _i3.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _i4.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i3.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _i4.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i5.Answer:
        return _i5.Answer.t;
      case _i6.AnswerAttempt:
        return _i6.AnswerAttempt.t;
      case _i7.Attempt:
        return _i7.Attempt.t;
      case _i8.Category:
        return _i8.Category.t;
      case _i9.Certificate:
        return _i9.Certificate.t;
      case _i11.Log:
        return _i11.Log.t;
      case _i12.Question:
        return _i12.Question.t;
      case _i13.Result:
        return _i13.Result.t;
      case _i15.Tag:
        return _i15.Tag.t;
      case _i16.Test:
        return _i16.Test.t;
      case _i17.TestTag:
        return _i17.TestTag.t;
      case _i18.User:
        return _i18.User.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'knowledge_testing_app';
}
