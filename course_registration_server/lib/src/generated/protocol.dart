/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member
// ignore_for_file: dead_code, unnecessary_type_check

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:course_registration_server/src/generated/admin/dto/admin_user_dto.dart'
    as _ijh58tix;
import 'package:course_registration_server/src/generated/admin/dto/audit_log_dto.dart'
    as _irwy8n4a;
import 'package:course_registration_server/src/generated/admin/dto/pending_class_approval_dto.dart'
    as _iwn434hf;
import 'package:course_registration_server/src/generated/admin/models/admin_permission.dart'
    as _iz7mx3pw;
import 'package:course_registration_server/src/generated/lecturer/dto/class_demand_dto.dart'
    as _ia38wpgm;
import 'package:course_registration_server/src/generated/lecturer/dto/class_student_dto.dart'
    as _i130z107;
import 'package:course_registration_server/src/generated/lecturer/dto/lecturer_course_class_dto.dart'
    as _ibcbukpi;
import 'package:course_registration_server/src/generated/lecturer/models/teaching_schedule_proposal.dart'
    as _imgyj9ow;
import 'package:course_registration_server/src/generated/registration/dto/class_schedule_dto.dart'
    as _ig0q9hbn;
import 'package:course_registration_server/src/generated/registration/dto/open_course_class_dto.dart'
    as _i23bizbs;
import 'package:course_registration_server/src/generated/registration/dto/registered_course_dto.dart'
    as _ih5gikos;
import 'package:course_registration_server/src/generated/registration/models/course_equivalent.dart'
    as _iulejzlc;
import 'package:course_registration_server/src/generated/registration/models/course_opening_request.dart'
    as _iemolfy3;
import 'package:course_registration_server/src/generated/registration/models/course_prerequisite.dart'
    as _ivv0f5sx;
import 'package:course_registration_server/src/generated/registration/models/semester.dart'
    as _i4gr1wnu;
import 'package:course_registration_server/src/generated/student/dto/training_program_course_dto.dart'
    as _ixjgi6ec;
import 'package:course_registration_server/src/generated/student/dto/transcript_dto.dart'
    as _iwd1k4sa;
import 'package:course_registration_server/src/generated/student/models/course.dart'
    as _i0cq0q6i;
import 'package:course_registration_server/src/generated/student/models/major.dart'
    as _icci7mnm;
import 'package:course_registration_server/src/generated/student/models/training_program.dart'
    as _iyi2skq0;
import 'package:course_registration_server/src/generated/student/models/training_program_course.dart'
    as _iyb4eomn;
import 'package:course_registration_server/src/generated/sync/dto/sync_operation_input_dto.dart'
    as _i968sfzk;
import 'package:course_registration_server/src/generated/sync/dto/sync_operation_result_dto.dart'
    as _ik10x0zo;
import 'package:serverpod/protocol.dart' as _isp;
import 'package:serverpod/serverpod.dart' as _is;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _iacs;
import 'package:serverpod_auth_idp_server/serverpod_auth_idp_server.dart'
    as _iais;
import 'admin.dart' as _irtsa1cb;
import 'admin/dto/admin_user_dto.dart' as _ilq3ip1w;
import 'admin/dto/analytics_report_dto.dart' as _iud5fcio;
import 'admin/dto/audit_log_dto.dart' as _idhpgcsg;
import 'admin/dto/course_gpa_dto.dart' as _i78ov9ny;
import 'admin/dto/named_count_dto.dart' as _ioqh38vf;
import 'admin/dto/pending_class_approval_dto.dart' as _ii94yimq;
import 'admin/models/admin_permission.dart' as _iqtm76wd;
import 'admin/models/class_approval.dart' as _ikq6rbq0;
import 'admin/models/class_approval_status.dart' as _iwu8lwz6;
import 'admin/models/course_category.dart' as _immuk475;
import 'admin/models/system_audit_log.dart' as _ifcme4qk;
import 'app_exception.dart' as _it4z223c;
import 'app_user.dart' as _i2j2xfrn;
import 'greetings/greeting.dart' as _izw8z7ou;
import 'lecturer.dart' as _itbetnwi;
import 'lecturer/dto/class_demand_dto.dart' as _iq0ly2ak;
import 'lecturer/dto/class_student_dto.dart' as _io3zsf6b;
import 'lecturer/dto/lecturer_course_class_dto.dart' as _iqyoloat;
import 'lecturer/dto/lecturer_profile_dto.dart' as _ipt2hr1k;
import 'lecturer/models/lecturer_activity_log.dart' as _im5rikfg;
import 'lecturer/models/lecturer_course_class.dart' as _iokj3d6r;
import 'lecturer/models/teaching_schedule_proposal.dart' as _irv87c2y;
import 'lecturer/models/teaching_schedule_status.dart' as _il6xaj9m;
import 'registration/dto/class_schedule_dto.dart' as _ib3wa59y;
import 'registration/dto/eligibility_result_dto.dart' as _iaaclq68;
import 'registration/dto/open_course_class_dto.dart' as _ipozmldp;
import 'registration/dto/registered_course_dto.dart' as _ilcih2k6;
import 'registration/dto/registration_result_dto.dart' as _ii8dcq83;
import 'registration/models/class_schedule.dart' as _ivo6ya0v;
import 'registration/models/course_class.dart' as _intqjpio;
import 'registration/models/course_class_status.dart' as _i6111ktp;
import 'registration/models/course_equivalent.dart' as _ivq6o0sg;
import 'registration/models/course_opening_request.dart' as _iagk693e;
import 'registration/models/course_prerequisite.dart' as _i7f5kvdx;
import 'registration/models/opening_request_status.dart' as _i9ek3ou2;
import 'registration/models/registration.dart' as _isg2rjz0;
import 'registration/models/registration_action.dart' as _ick1ofaw;
import 'registration/models/registration_history.dart' as _io6lhm66;
import 'registration/models/registration_status.dart' as _ienvemo7;
import 'registration/models/semester.dart' as _iz7vluge;
import 'registration/models/semester_status.dart' as _inuj73nk;
import 'student.dart' as _iwzlgl4r;
import 'student/dto/gpa_dto.dart' as _igzwjm5d;
import 'student/dto/student_profile_dto.dart' as _iwyne1wa;
import 'student/dto/training_program_course_dto.dart' as _iiy6nwja;
import 'student/dto/transcript_dto.dart' as _ia9f4ste;
import 'student/models/course.dart' as _iysyfyey;
import 'student/models/course_progress_status.dart' as _inmihsz6;
import 'student/models/course_type.dart' as _iajbyi83;
import 'student/models/faculty.dart' as _iehbjec4;
import 'student/models/major.dart' as _iqe9gc9z;
import 'student/models/student_transcript.dart' as _iw15wxpt;
import 'student/models/training_program.dart' as _ige2gcz9;
import 'student/models/training_program_course.dart' as _im8ku9lz;
import 'student/models/transcript_status.dart' as _i3gkq2t9;
import 'sync/dto/pull_sync_result_dto.dart' as _i8xfjltp;
import 'sync/dto/sync_change_dto.dart' as _ih97hn2e;
import 'sync/dto/sync_operation_input_dto.dart' as _ijhls20r;
import 'sync/dto/sync_operation_result_dto.dart' as _i0c46qnp;
import 'sync/dto/sync_status_dto.dart' as _i2e8b5z3;
import 'sync/models/processed_sync_operation.dart' as _iyxfog5l;
import 'sync/models/sync_change.dart' as _ijoocq8q;
import 'sync/models/sync_log.dart' as _irvfms91;
import 'sync/models/sync_operation_status.dart' as _ipxryt3x;
import 'user_role.dart' as _ir0y0iu6;
export 'admin.dart';
export 'admin/dto/admin_user_dto.dart';
export 'admin/dto/analytics_report_dto.dart';
export 'admin/dto/audit_log_dto.dart';
export 'admin/dto/course_gpa_dto.dart';
export 'admin/dto/named_count_dto.dart';
export 'admin/dto/pending_class_approval_dto.dart';
export 'admin/models/admin_permission.dart';
export 'admin/models/class_approval.dart';
export 'admin/models/class_approval_status.dart';
export 'admin/models/course_category.dart';
export 'admin/models/system_audit_log.dart';
export 'app_exception.dart';
export 'app_user.dart';
export 'greetings/greeting.dart';
export 'lecturer.dart';
export 'lecturer/dto/class_demand_dto.dart';
export 'lecturer/dto/class_student_dto.dart';
export 'lecturer/dto/lecturer_course_class_dto.dart';
export 'lecturer/dto/lecturer_profile_dto.dart';
export 'lecturer/models/lecturer_activity_log.dart';
export 'lecturer/models/lecturer_course_class.dart';
export 'lecturer/models/teaching_schedule_proposal.dart';
export 'lecturer/models/teaching_schedule_status.dart';
export 'registration/dto/class_schedule_dto.dart';
export 'registration/dto/eligibility_result_dto.dart';
export 'registration/dto/open_course_class_dto.dart';
export 'registration/dto/registered_course_dto.dart';
export 'registration/dto/registration_result_dto.dart';
export 'registration/models/class_schedule.dart';
export 'registration/models/course_class.dart';
export 'registration/models/course_class_status.dart';
export 'registration/models/course_equivalent.dart';
export 'registration/models/course_opening_request.dart';
export 'registration/models/course_prerequisite.dart';
export 'registration/models/opening_request_status.dart';
export 'registration/models/registration.dart';
export 'registration/models/registration_action.dart';
export 'registration/models/registration_history.dart';
export 'registration/models/registration_status.dart';
export 'registration/models/semester.dart';
export 'registration/models/semester_status.dart';
export 'student.dart';
export 'student/dto/gpa_dto.dart';
export 'student/dto/student_profile_dto.dart';
export 'student/dto/training_program_course_dto.dart';
export 'student/dto/transcript_dto.dart';
export 'student/models/course.dart';
export 'student/models/course_progress_status.dart';
export 'student/models/course_type.dart';
export 'student/models/faculty.dart';
export 'student/models/major.dart';
export 'student/models/student_transcript.dart';
export 'student/models/training_program.dart';
export 'student/models/training_program_course.dart';
export 'student/models/transcript_status.dart';
export 'sync/dto/pull_sync_result_dto.dart';
export 'sync/dto/sync_change_dto.dart';
export 'sync/dto/sync_operation_input_dto.dart';
export 'sync/dto/sync_operation_result_dto.dart';
export 'sync/dto/sync_status_dto.dart';
export 'sync/models/processed_sync_operation.dart';
export 'sync/models/sync_change.dart';
export 'sync/models/sync_log.dart';
export 'sync/models/sync_operation_status.dart';
export 'user_role.dart';

class Protocol extends _is.DatabaseSerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._().._registerHostProtocols();

  static List<_isp.TableDefinition> get targetTableDefinitions => [
    _isp.TableDefinition(
      name: 'admin_permissions',
      dartName: 'AdminPermission',
      schema: 'public',
      module: 'course_registration',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'random_v7',
        ),
        _isp.ColumnDefinition(
          name: 'adminId',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _isp.ColumnDefinition(
          name: 'permissionName',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'createdAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
      ],
      foreignKeys: [
        _isp.ForeignKeyDefinition(
          constraintName: 'admin_permissions_fk_0',
          columns: ['adminId'],
          referenceTable: 'admins',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isp.ForeignKeyAction.noAction,
          onDelete: _isp.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'admin_permissions_unique',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'adminId',
            ),
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'permissionName',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'admins',
      dartName: 'Admin',
      schema: 'public',
      module: 'course_registration',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'random_v7',
        ),
        _isp.ColumnDefinition(
          name: 'userId',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _isp.ColumnDefinition(
          name: 'permissionLevel',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _isp.ForeignKeyDefinition(
          constraintName: 'admins_fk_0',
          columns: ['userId'],
          referenceTable: 'users',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isp.ForeignKeyAction.noAction,
          onDelete: _isp.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'admins_user_id_unique',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'userId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'class_approvals',
      dartName: 'ClassApproval',
      schema: 'public',
      module: 'course_registration',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'random_v7',
        ),
        _isp.ColumnDefinition(
          name: 'courseClassId',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _isp.ColumnDefinition(
          name: 'adminId',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _isp.ColumnDefinition(
          name: 'status',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:ClassApprovalStatus',
        ),
        _isp.ColumnDefinition(
          name: 'comment',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'createdAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
      ],
      foreignKeys: [
        _isp.ForeignKeyDefinition(
          constraintName: 'class_approvals_fk_0',
          columns: ['courseClassId'],
          referenceTable: 'course_classes',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isp.ForeignKeyAction.noAction,
          onDelete: _isp.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _isp.ForeignKeyDefinition(
          constraintName: 'class_approvals_fk_1',
          columns: ['adminId'],
          referenceTable: 'admins',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isp.ForeignKeyAction.noAction,
          onDelete: _isp.ForeignKeyAction.restrict,
          matchType: null,
        ),
      ],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'class_approvals_class_unique',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'courseClassId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
        _isp.IndexDefinition(
          indexName: 'class_approvals_status_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'status',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'class_schedules',
      dartName: 'ClassSchedule',
      schema: 'public',
      module: 'course_registration',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'random_v7',
        ),
        _isp.ColumnDefinition(
          name: 'courseClassId',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _isp.ColumnDefinition(
          name: 'dayOfWeek',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'startPeriod',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'endPeriod',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'room',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [
        _isp.ForeignKeyDefinition(
          constraintName: 'class_schedules_fk_0',
          columns: ['courseClassId'],
          referenceTable: 'course_classes',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isp.ForeignKeyAction.noAction,
          onDelete: _isp.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'class_schedules_class_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'courseClassId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'course_categories',
      dartName: 'CourseCategory',
      schema: 'public',
      module: 'course_registration',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'random_v7',
        ),
        _isp.ColumnDefinition(
          name: 'name',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'description',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'course_categories_name_unique',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'name',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'course_classes',
      dartName: 'CourseClass',
      schema: 'public',
      module: 'course_registration',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'random_v7',
        ),
        _isp.ColumnDefinition(
          name: 'courseId',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _isp.ColumnDefinition(
          name: 'lecturerId',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _isp.ColumnDefinition(
          name: 'semesterId',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _isp.ColumnDefinition(
          name: 'classCode',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'capacity',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'registeredCount',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
          columnDefault: '0',
        ),
        _isp.ColumnDefinition(
          name: 'status',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:CourseClassStatus',
        ),
      ],
      foreignKeys: [
        _isp.ForeignKeyDefinition(
          constraintName: 'course_classes_fk_0',
          columns: ['courseId'],
          referenceTable: 'courses',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isp.ForeignKeyAction.noAction,
          onDelete: _isp.ForeignKeyAction.restrict,
          matchType: null,
        ),
        _isp.ForeignKeyDefinition(
          constraintName: 'course_classes_fk_1',
          columns: ['lecturerId'],
          referenceTable: 'lecturers',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isp.ForeignKeyAction.noAction,
          onDelete: _isp.ForeignKeyAction.restrict,
          matchType: null,
        ),
        _isp.ForeignKeyDefinition(
          constraintName: 'course_classes_fk_2',
          columns: ['semesterId'],
          referenceTable: 'semesters',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isp.ForeignKeyAction.noAction,
          onDelete: _isp.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'course_classes_code_semester_unique',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'classCode',
            ),
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'semesterId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
        _isp.IndexDefinition(
          indexName: 'course_classes_open_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'semesterId',
            ),
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'status',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _isp.IndexDefinition(
          indexName: 'course_classes_course_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'courseId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'course_equivalents',
      dartName: 'CourseEquivalent',
      schema: 'public',
      module: 'course_registration',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'random_v7',
        ),
        _isp.ColumnDefinition(
          name: 'courseId',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _isp.ColumnDefinition(
          name: 'equivalentId',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'course_equivalents_unique',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'courseId',
            ),
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'equivalentId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
        _isp.IndexDefinition(
          indexName: 'course_equivalents_equivalent_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'equivalentId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'course_opening_requests',
      dartName: 'CourseOpeningRequest',
      schema: 'public',
      module: 'course_registration',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'random_v7',
        ),
        _isp.ColumnDefinition(
          name: 'studentId',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _isp.ColumnDefinition(
          name: 'courseId',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _isp.ColumnDefinition(
          name: 'reason',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'createdAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
        _isp.ColumnDefinition(
          name: 'status',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:OpeningRequestStatus',
        ),
      ],
      foreignKeys: [
        _isp.ForeignKeyDefinition(
          constraintName: 'course_opening_requests_fk_0',
          columns: ['studentId'],
          referenceTable: 'students',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isp.ForeignKeyAction.noAction,
          onDelete: _isp.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _isp.ForeignKeyDefinition(
          constraintName: 'course_opening_requests_fk_1',
          columns: ['courseId'],
          referenceTable: 'courses',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isp.ForeignKeyAction.noAction,
          onDelete: _isp.ForeignKeyAction.restrict,
          matchType: null,
        ),
      ],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'opening_requests_student_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'studentId',
            ),
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'status',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'course_prerequisites',
      dartName: 'CoursePrerequisite',
      schema: 'public',
      module: 'course_registration',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'random_v7',
        ),
        _isp.ColumnDefinition(
          name: 'courseId',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _isp.ColumnDefinition(
          name: 'prerequisiteId',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'course_prerequisites_unique',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'courseId',
            ),
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'prerequisiteId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'courses',
      dartName: 'Course',
      schema: 'public',
      module: 'course_registration',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'random_v7',
        ),
        _isp.ColumnDefinition(
          name: 'courseCode',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'courseName',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'credits',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'description',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'courseType',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:CourseType',
        ),
        _isp.ColumnDefinition(
          name: 'categoryId',
          columnType: _isp.ColumnType.uuid,
          isNullable: true,
          dartType: 'UuidValue?',
        ),
        _isp.ColumnDefinition(
          name: 'createdAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
        _isp.ColumnDefinition(
          name: 'updatedAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
      ],
      foreignKeys: [
        _isp.ForeignKeyDefinition(
          constraintName: 'courses_fk_0',
          columns: ['categoryId'],
          referenceTable: 'course_categories',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isp.ForeignKeyAction.noAction,
          onDelete: _isp.ForeignKeyAction.setNull,
          matchType: null,
        ),
      ],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'courses_course_code_unique',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'courseCode',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'faculties',
      dartName: 'Faculty',
      schema: 'public',
      module: 'course_registration',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'random_v7',
        ),
        _isp.ColumnDefinition(
          name: 'name',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'code',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'description',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'createdAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
        _isp.ColumnDefinition(
          name: 'updatedAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'faculties_code_unique',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'code',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'lecturer_activity_logs',
      dartName: 'LecturerActivityLog',
      schema: 'public',
      module: 'course_registration',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'random_v7',
        ),
        _isp.ColumnDefinition(
          name: 'lecturerId',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _isp.ColumnDefinition(
          name: 'action',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'entity',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'entityId',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _isp.ColumnDefinition(
          name: 'createdAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
      ],
      foreignKeys: [
        _isp.ForeignKeyDefinition(
          constraintName: 'lecturer_activity_logs_fk_0',
          columns: ['lecturerId'],
          referenceTable: 'lecturers',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isp.ForeignKeyAction.noAction,
          onDelete: _isp.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'lecturer_activity_logs_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'lecturerId',
            ),
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'createdAt',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'lecturer_course_classes',
      dartName: 'LecturerCourseClass',
      schema: 'public',
      module: 'course_registration',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'random_v7',
        ),
        _isp.ColumnDefinition(
          name: 'lecturerId',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _isp.ColumnDefinition(
          name: 'courseClassId',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _isp.ColumnDefinition(
          name: 'assignedAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
      ],
      foreignKeys: [
        _isp.ForeignKeyDefinition(
          constraintName: 'lecturer_course_classes_fk_0',
          columns: ['lecturerId'],
          referenceTable: 'lecturers',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isp.ForeignKeyAction.noAction,
          onDelete: _isp.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _isp.ForeignKeyDefinition(
          constraintName: 'lecturer_course_classes_fk_1',
          columns: ['courseClassId'],
          referenceTable: 'course_classes',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isp.ForeignKeyAction.noAction,
          onDelete: _isp.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'lecturer_course_classes_unique',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'lecturerId',
            ),
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'courseClassId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
        _isp.IndexDefinition(
          indexName: 'lecturer_course_classes_lecturer_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'lecturerId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'lecturers',
      dartName: 'Lecturer',
      schema: 'public',
      module: 'course_registration',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'random_v7',
        ),
        _isp.ColumnDefinition(
          name: 'userId',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _isp.ColumnDefinition(
          name: 'lecturerCode',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'facultyId',
          columnType: _isp.ColumnType.uuid,
          isNullable: true,
          dartType: 'UuidValue?',
        ),
        _isp.ColumnDefinition(
          name: 'academicDegree',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'department',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'academicTitle',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'specialization',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [
        _isp.ForeignKeyDefinition(
          constraintName: 'lecturers_fk_0',
          columns: ['userId'],
          referenceTable: 'users',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isp.ForeignKeyAction.noAction,
          onDelete: _isp.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'lecturers_user_id_unique',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'userId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
        _isp.IndexDefinition(
          indexName: 'lecturers_lecturer_code_unique',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'lecturerCode',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'majors',
      dartName: 'Major',
      schema: 'public',
      module: 'course_registration',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'random_v7',
        ),
        _isp.ColumnDefinition(
          name: 'facultyId',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _isp.ColumnDefinition(
          name: 'name',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'code',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'description',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'createdAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
        _isp.ColumnDefinition(
          name: 'updatedAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
      ],
      foreignKeys: [
        _isp.ForeignKeyDefinition(
          constraintName: 'majors_fk_0',
          columns: ['facultyId'],
          referenceTable: 'faculties',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isp.ForeignKeyAction.noAction,
          onDelete: _isp.ForeignKeyAction.restrict,
          matchType: null,
        ),
      ],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'majors_code_unique',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'code',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
        _isp.IndexDefinition(
          indexName: 'majors_faculty_id_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'facultyId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'processed_sync_operations',
      dartName: 'ProcessedSyncOperation',
      schema: 'public',
      module: 'course_registration',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'random_v7',
        ),
        _isp.ColumnDefinition(
          name: 'operationId',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _isp.ColumnDefinition(
          name: 'userId',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _isp.ColumnDefinition(
          name: 'entityType',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'entityId',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'operationType',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'payload',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'status',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:SyncOperationStatus',
        ),
        _isp.ColumnDefinition(
          name: 'resultPayload',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'errorCode',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'errorMessage',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'serverVersion',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
          columnDefault: '1',
        ),
        _isp.ColumnDefinition(
          name: 'createdAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
        _isp.ColumnDefinition(
          name: 'updatedAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
      ],
      foreignKeys: [
        _isp.ForeignKeyDefinition(
          constraintName: 'processed_sync_operations_fk_0',
          columns: ['userId'],
          referenceTable: 'users',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isp.ForeignKeyAction.noAction,
          onDelete: _isp.ForeignKeyAction.restrict,
          matchType: null,
        ),
      ],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'processed_sync_operations_operation_unique',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'operationId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
        _isp.IndexDefinition(
          indexName: 'processed_sync_operations_user_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'userId',
            ),
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'createdAt',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'registration_history',
      dartName: 'RegistrationHistory',
      schema: 'public',
      module: 'course_registration',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'random_v7',
        ),
        _isp.ColumnDefinition(
          name: 'studentId',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _isp.ColumnDefinition(
          name: 'courseClassId',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _isp.ColumnDefinition(
          name: 'action',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:RegistrationAction',
        ),
        _isp.ColumnDefinition(
          name: 'createdAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
        _isp.ColumnDefinition(
          name: 'deviceInfo',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [
        _isp.ForeignKeyDefinition(
          constraintName: 'registration_history_fk_0',
          columns: ['studentId'],
          referenceTable: 'students',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isp.ForeignKeyAction.noAction,
          onDelete: _isp.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _isp.ForeignKeyDefinition(
          constraintName: 'registration_history_fk_1',
          columns: ['courseClassId'],
          referenceTable: 'course_classes',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isp.ForeignKeyAction.noAction,
          onDelete: _isp.ForeignKeyAction.restrict,
          matchType: null,
        ),
      ],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'registration_history_student_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'studentId',
            ),
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'createdAt',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'registrations',
      dartName: 'Registration',
      schema: 'public',
      module: 'course_registration',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'random_v7',
        ),
        _isp.ColumnDefinition(
          name: 'studentId',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _isp.ColumnDefinition(
          name: 'courseClassId',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _isp.ColumnDefinition(
          name: 'registeredAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
        _isp.ColumnDefinition(
          name: 'status',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:RegistrationStatus',
        ),
      ],
      foreignKeys: [
        _isp.ForeignKeyDefinition(
          constraintName: 'registrations_fk_0',
          columns: ['studentId'],
          referenceTable: 'students',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isp.ForeignKeyAction.noAction,
          onDelete: _isp.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _isp.ForeignKeyDefinition(
          constraintName: 'registrations_fk_1',
          columns: ['courseClassId'],
          referenceTable: 'course_classes',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isp.ForeignKeyAction.noAction,
          onDelete: _isp.ForeignKeyAction.restrict,
          matchType: null,
        ),
      ],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'registrations_student_class_unique',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'studentId',
            ),
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'courseClassId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
        _isp.IndexDefinition(
          indexName: 'registrations_student_status_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'studentId',
            ),
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'status',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _isp.IndexDefinition(
          indexName: 'registrations_class_status_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'courseClassId',
            ),
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'status',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'semesters',
      dartName: 'Semester',
      schema: 'public',
      module: 'course_registration',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'random_v7',
        ),
        _isp.ColumnDefinition(
          name: 'name',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'academicYear',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'startDate',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _isp.ColumnDefinition(
          name: 'endDate',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _isp.ColumnDefinition(
          name: 'status',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:SemesterStatus',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'semesters_name_year_unique',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'name',
            ),
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'academicYear',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
        _isp.IndexDefinition(
          indexName: 'semesters_status_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'status',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'student_transcripts',
      dartName: 'StudentTranscript',
      schema: 'public',
      module: 'course_registration',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'random_v7',
        ),
        _isp.ColumnDefinition(
          name: 'studentId',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _isp.ColumnDefinition(
          name: 'courseId',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _isp.ColumnDefinition(
          name: 'semester',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'midtermScore',
          columnType: _isp.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
        _isp.ColumnDefinition(
          name: 'finalScore',
          columnType: _isp.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
        _isp.ColumnDefinition(
          name: 'score',
          columnType: _isp.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _isp.ColumnDefinition(
          name: 'letterGrade',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'status',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:TranscriptStatus',
        ),
        _isp.ColumnDefinition(
          name: 'attemptNumber',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'createdAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
        _isp.ColumnDefinition(
          name: 'updatedAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
      ],
      foreignKeys: [
        _isp.ForeignKeyDefinition(
          constraintName: 'student_transcripts_fk_0',
          columns: ['studentId'],
          referenceTable: 'students',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isp.ForeignKeyAction.noAction,
          onDelete: _isp.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _isp.ForeignKeyDefinition(
          constraintName: 'student_transcripts_fk_1',
          columns: ['courseId'],
          referenceTable: 'courses',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isp.ForeignKeyAction.noAction,
          onDelete: _isp.ForeignKeyAction.restrict,
          matchType: null,
        ),
      ],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'student_transcripts_attempt_unique',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'studentId',
            ),
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'courseId',
            ),
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'attemptNumber',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
        _isp.IndexDefinition(
          indexName: 'student_transcripts_student_semester_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'studentId',
            ),
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'semester',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'students',
      dartName: 'Student',
      schema: 'public',
      module: 'course_registration',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'random_v7',
        ),
        _isp.ColumnDefinition(
          name: 'userId',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _isp.ColumnDefinition(
          name: 'studentCode',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'majorId',
          columnType: _isp.ColumnType.uuid,
          isNullable: true,
          dartType: 'UuidValue?',
        ),
        _isp.ColumnDefinition(
          name: 'trainingProgramId',
          columnType: _isp.ColumnType.uuid,
          isNullable: true,
          dartType: 'UuidValue?',
        ),
        _isp.ColumnDefinition(
          name: 'academicYear',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'enrollmentYear',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
          columnDefault: '0',
        ),
        _isp.ColumnDefinition(
          name: 'currentSemester',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
          columnDefault: '1',
        ),
        _isp.ColumnDefinition(
          name: 'gpa',
          columnType: _isp.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _isp.ColumnDefinition(
          name: 'totalCredits',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _isp.ForeignKeyDefinition(
          constraintName: 'students_fk_0',
          columns: ['userId'],
          referenceTable: 'users',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isp.ForeignKeyAction.noAction,
          onDelete: _isp.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _isp.ForeignKeyDefinition(
          constraintName: 'students_fk_1',
          columns: ['majorId'],
          referenceTable: 'majors',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isp.ForeignKeyAction.noAction,
          onDelete: _isp.ForeignKeyAction.setNull,
          matchType: null,
        ),
        _isp.ForeignKeyDefinition(
          constraintName: 'students_fk_2',
          columns: ['trainingProgramId'],
          referenceTable: 'training_programs',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isp.ForeignKeyAction.noAction,
          onDelete: _isp.ForeignKeyAction.setNull,
          matchType: null,
        ),
      ],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'students_user_id_unique',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'userId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
        _isp.IndexDefinition(
          indexName: 'students_student_code_unique',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'studentCode',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'sync_changes',
      dartName: 'SyncChange',
      schema: 'public',
      module: 'course_registration',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'random_v7',
        ),
        _isp.ColumnDefinition(
          name: 'targetUserId',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _isp.ColumnDefinition(
          name: 'entityType',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'entityId',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'changeType',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'payload',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'serverVersion',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'changedAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
      ],
      foreignKeys: [
        _isp.ForeignKeyDefinition(
          constraintName: 'sync_changes_fk_0',
          columns: ['targetUserId'],
          referenceTable: 'users',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isp.ForeignKeyAction.noAction,
          onDelete: _isp.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'sync_changes_user_time_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'targetUserId',
            ),
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'changedAt',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'sync_logs',
      dartName: 'SyncLog',
      schema: 'public',
      module: 'course_registration',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'random_v7',
        ),
        _isp.ColumnDefinition(
          name: 'operationId',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _isp.ColumnDefinition(
          name: 'action',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'status',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:SyncOperationStatus',
        ),
        _isp.ColumnDefinition(
          name: 'startedAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _isp.ColumnDefinition(
          name: 'completedAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _isp.ColumnDefinition(
          name: 'errorCode',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'errorMessage',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'sync_logs_operation_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'operationId',
            ),
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'startedAt',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'system_audit_logs',
      dartName: 'SystemAuditLog',
      schema: 'public',
      module: 'course_registration',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'random_v7',
        ),
        _isp.ColumnDefinition(
          name: 'userId',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _isp.ColumnDefinition(
          name: 'action',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'entity',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'entityId',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _isp.ColumnDefinition(
          name: 'oldValue',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'newValue',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'createdAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
      ],
      foreignKeys: [
        _isp.ForeignKeyDefinition(
          constraintName: 'system_audit_logs_fk_0',
          columns: ['userId'],
          referenceTable: 'users',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isp.ForeignKeyAction.noAction,
          onDelete: _isp.ForeignKeyAction.restrict,
          matchType: null,
        ),
      ],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'system_audit_logs_created_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'createdAt',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _isp.IndexDefinition(
          indexName: 'system_audit_logs_user_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'userId',
            ),
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'createdAt',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'teaching_schedule_proposals',
      dartName: 'TeachingScheduleProposal',
      schema: 'public',
      module: 'course_registration',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'random_v7',
        ),
        _isp.ColumnDefinition(
          name: 'lecturerId',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _isp.ColumnDefinition(
          name: 'courseClassId',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _isp.ColumnDefinition(
          name: 'dayOfWeek',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'startPeriod',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'endPeriod',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'room',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'status',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:TeachingScheduleStatus',
        ),
        _isp.ColumnDefinition(
          name: 'createdAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
      ],
      foreignKeys: [
        _isp.ForeignKeyDefinition(
          constraintName: 'teaching_schedule_proposals_fk_0',
          columns: ['lecturerId'],
          referenceTable: 'lecturers',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isp.ForeignKeyAction.noAction,
          onDelete: _isp.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _isp.ForeignKeyDefinition(
          constraintName: 'teaching_schedule_proposals_fk_1',
          columns: ['courseClassId'],
          referenceTable: 'course_classes',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isp.ForeignKeyAction.noAction,
          onDelete: _isp.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'teaching_proposals_lecturer_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'lecturerId',
            ),
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'status',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _isp.IndexDefinition(
          indexName: 'teaching_proposals_class_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'courseClassId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'training_program_courses',
      dartName: 'TrainingProgramCourse',
      schema: 'public',
      module: 'course_registration',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'random_v7',
        ),
        _isp.ColumnDefinition(
          name: 'trainingProgramId',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _isp.ColumnDefinition(
          name: 'courseId',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _isp.ColumnDefinition(
          name: 'semesterNumber',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'isRequired',
          columnType: _isp.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
      ],
      foreignKeys: [
        _isp.ForeignKeyDefinition(
          constraintName: 'training_program_courses_fk_0',
          columns: ['trainingProgramId'],
          referenceTable: 'training_programs',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isp.ForeignKeyAction.noAction,
          onDelete: _isp.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _isp.ForeignKeyDefinition(
          constraintName: 'training_program_courses_fk_1',
          columns: ['courseId'],
          referenceTable: 'courses',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isp.ForeignKeyAction.noAction,
          onDelete: _isp.ForeignKeyAction.restrict,
          matchType: null,
        ),
      ],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'training_program_courses_unique',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'trainingProgramId',
            ),
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'courseId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
        _isp.IndexDefinition(
          indexName: 'training_program_courses_semester_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'trainingProgramId',
            ),
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'semesterNumber',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'training_programs',
      dartName: 'TrainingProgram',
      schema: 'public',
      module: 'course_registration',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'random_v7',
        ),
        _isp.ColumnDefinition(
          name: 'majorId',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _isp.ColumnDefinition(
          name: 'name',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'academicYear',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'totalCredits',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'description',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'createdAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
        _isp.ColumnDefinition(
          name: 'updatedAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
      ],
      foreignKeys: [
        _isp.ForeignKeyDefinition(
          constraintName: 'training_programs_fk_0',
          columns: ['majorId'],
          referenceTable: 'majors',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _isp.ForeignKeyAction.noAction,
          onDelete: _isp.ForeignKeyAction.restrict,
          matchType: null,
        ),
      ],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'training_programs_major_year_unique',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'majorId',
            ),
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'academicYear',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'users',
      dartName: 'AppUser',
      schema: 'public',
      module: 'course_registration',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'random_v7',
        ),
        _isp.ColumnDefinition(
          name: 'authUserId',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _isp.ColumnDefinition(
          name: 'email',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'fullName',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'phone',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'avatar',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'role',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:UserRole',
        ),
        _isp.ColumnDefinition(
          name: 'isActive',
          columnType: _isp.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'true',
        ),
        _isp.ColumnDefinition(
          name: 'createdAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
        _isp.ColumnDefinition(
          name: 'updatedAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'users_auth_user_id_unique',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'authUserId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
        _isp.IndexDefinition(
          indexName: 'users_email_unique',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'email',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    ..._iacs.Protocol.targetTableDefinitions,
    ..._iais.Protocol.targetTableDefinitions,
    ..._isp.Protocol.targetTableDefinitions,
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
      } on _is.DeserializationClassNameNotFoundException catch (_) {
        // If the className is not recognized (e.g., older client receiving
        // data with a new subtype), fall back to deserializing without the
        // className, using the expected type T.
      }
    }

    if (t == _irtsa1cb.Admin) {
      return _irtsa1cb.Admin.fromJson(data) as T;
    }
    if (t == _ilq3ip1w.AdminUserDto) {
      return _ilq3ip1w.AdminUserDto.fromJson(data) as T;
    }
    if (t == _iud5fcio.AnalyticsReportDto) {
      return _iud5fcio.AnalyticsReportDto.fromJson(data) as T;
    }
    if (t == _idhpgcsg.AuditLogDto) {
      return _idhpgcsg.AuditLogDto.fromJson(data) as T;
    }
    if (t == _i78ov9ny.CourseGpaDto) {
      return _i78ov9ny.CourseGpaDto.fromJson(data) as T;
    }
    if (t == _ioqh38vf.NamedCountDto) {
      return _ioqh38vf.NamedCountDto.fromJson(data) as T;
    }
    if (t == _ii94yimq.PendingClassApprovalDto) {
      return _ii94yimq.PendingClassApprovalDto.fromJson(data) as T;
    }
    if (t == _iqtm76wd.AdminPermission) {
      return _iqtm76wd.AdminPermission.fromJson(data) as T;
    }
    if (t == _ikq6rbq0.ClassApproval) {
      return _ikq6rbq0.ClassApproval.fromJson(data) as T;
    }
    if (t == _iwu8lwz6.ClassApprovalStatus) {
      return _iwu8lwz6.ClassApprovalStatus.fromJson(data) as T;
    }
    if (t == _immuk475.CourseCategory) {
      return _immuk475.CourseCategory.fromJson(data) as T;
    }
    if (t == _ifcme4qk.SystemAuditLog) {
      return _ifcme4qk.SystemAuditLog.fromJson(data) as T;
    }
    if (t == _it4z223c.AppException) {
      return _it4z223c.AppException.fromJson(data) as T;
    }
    if (t == _i2j2xfrn.AppUser) {
      return _i2j2xfrn.AppUser.fromJson(data) as T;
    }
    if (t == _izw8z7ou.Greeting) {
      return _izw8z7ou.Greeting.fromJson(data) as T;
    }
    if (t == _itbetnwi.Lecturer) {
      return _itbetnwi.Lecturer.fromJson(data) as T;
    }
    if (t == _iq0ly2ak.ClassDemandDto) {
      return _iq0ly2ak.ClassDemandDto.fromJson(data) as T;
    }
    if (t == _io3zsf6b.ClassStudentDto) {
      return _io3zsf6b.ClassStudentDto.fromJson(data) as T;
    }
    if (t == _iqyoloat.LecturerCourseClassDto) {
      return _iqyoloat.LecturerCourseClassDto.fromJson(data) as T;
    }
    if (t == _ipt2hr1k.LecturerProfileDto) {
      return _ipt2hr1k.LecturerProfileDto.fromJson(data) as T;
    }
    if (t == _im5rikfg.LecturerActivityLog) {
      return _im5rikfg.LecturerActivityLog.fromJson(data) as T;
    }
    if (t == _iokj3d6r.LecturerCourseClass) {
      return _iokj3d6r.LecturerCourseClass.fromJson(data) as T;
    }
    if (t == _irv87c2y.TeachingScheduleProposal) {
      return _irv87c2y.TeachingScheduleProposal.fromJson(data) as T;
    }
    if (t == _il6xaj9m.TeachingScheduleStatus) {
      return _il6xaj9m.TeachingScheduleStatus.fromJson(data) as T;
    }
    if (t == _ib3wa59y.ClassScheduleDto) {
      return _ib3wa59y.ClassScheduleDto.fromJson(data) as T;
    }
    if (t == _iaaclq68.EligibilityResultDto) {
      return _iaaclq68.EligibilityResultDto.fromJson(data) as T;
    }
    if (t == _ipozmldp.OpenCourseClassDto) {
      return _ipozmldp.OpenCourseClassDto.fromJson(data) as T;
    }
    if (t == _ilcih2k6.RegisteredCourseDto) {
      return _ilcih2k6.RegisteredCourseDto.fromJson(data) as T;
    }
    if (t == _ii8dcq83.RegistrationResultDto) {
      return _ii8dcq83.RegistrationResultDto.fromJson(data) as T;
    }
    if (t == _ivo6ya0v.ClassSchedule) {
      return _ivo6ya0v.ClassSchedule.fromJson(data) as T;
    }
    if (t == _intqjpio.CourseClass) {
      return _intqjpio.CourseClass.fromJson(data) as T;
    }
    if (t == _i6111ktp.CourseClassStatus) {
      return _i6111ktp.CourseClassStatus.fromJson(data) as T;
    }
    if (t == _ivq6o0sg.CourseEquivalent) {
      return _ivq6o0sg.CourseEquivalent.fromJson(data) as T;
    }
    if (t == _iagk693e.CourseOpeningRequest) {
      return _iagk693e.CourseOpeningRequest.fromJson(data) as T;
    }
    if (t == _i7f5kvdx.CoursePrerequisite) {
      return _i7f5kvdx.CoursePrerequisite.fromJson(data) as T;
    }
    if (t == _i9ek3ou2.OpeningRequestStatus) {
      return _i9ek3ou2.OpeningRequestStatus.fromJson(data) as T;
    }
    if (t == _isg2rjz0.Registration) {
      return _isg2rjz0.Registration.fromJson(data) as T;
    }
    if (t == _ick1ofaw.RegistrationAction) {
      return _ick1ofaw.RegistrationAction.fromJson(data) as T;
    }
    if (t == _io6lhm66.RegistrationHistory) {
      return _io6lhm66.RegistrationHistory.fromJson(data) as T;
    }
    if (t == _ienvemo7.RegistrationStatus) {
      return _ienvemo7.RegistrationStatus.fromJson(data) as T;
    }
    if (t == _iz7vluge.Semester) {
      return _iz7vluge.Semester.fromJson(data) as T;
    }
    if (t == _inuj73nk.SemesterStatus) {
      return _inuj73nk.SemesterStatus.fromJson(data) as T;
    }
    if (t == _iwzlgl4r.Student) {
      return _iwzlgl4r.Student.fromJson(data) as T;
    }
    if (t == _igzwjm5d.GpaDto) {
      return _igzwjm5d.GpaDto.fromJson(data) as T;
    }
    if (t == _iwyne1wa.StudentProfileDto) {
      return _iwyne1wa.StudentProfileDto.fromJson(data) as T;
    }
    if (t == _iiy6nwja.TrainingProgramCourseDto) {
      return _iiy6nwja.TrainingProgramCourseDto.fromJson(data) as T;
    }
    if (t == _ia9f4ste.TranscriptDto) {
      return _ia9f4ste.TranscriptDto.fromJson(data) as T;
    }
    if (t == _iysyfyey.Course) {
      return _iysyfyey.Course.fromJson(data) as T;
    }
    if (t == _inmihsz6.CourseProgressStatus) {
      return _inmihsz6.CourseProgressStatus.fromJson(data) as T;
    }
    if (t == _iajbyi83.CourseType) {
      return _iajbyi83.CourseType.fromJson(data) as T;
    }
    if (t == _iehbjec4.Faculty) {
      return _iehbjec4.Faculty.fromJson(data) as T;
    }
    if (t == _iqe9gc9z.Major) {
      return _iqe9gc9z.Major.fromJson(data) as T;
    }
    if (t == _iw15wxpt.StudentTranscript) {
      return _iw15wxpt.StudentTranscript.fromJson(data) as T;
    }
    if (t == _ige2gcz9.TrainingProgram) {
      return _ige2gcz9.TrainingProgram.fromJson(data) as T;
    }
    if (t == _im8ku9lz.TrainingProgramCourse) {
      return _im8ku9lz.TrainingProgramCourse.fromJson(data) as T;
    }
    if (t == _i3gkq2t9.TranscriptStatus) {
      return _i3gkq2t9.TranscriptStatus.fromJson(data) as T;
    }
    if (t == _i8xfjltp.PullSyncResultDto) {
      return _i8xfjltp.PullSyncResultDto.fromJson(data) as T;
    }
    if (t == _ih97hn2e.SyncChangeDto) {
      return _ih97hn2e.SyncChangeDto.fromJson(data) as T;
    }
    if (t == _ijhls20r.SyncOperationInputDto) {
      return _ijhls20r.SyncOperationInputDto.fromJson(data) as T;
    }
    if (t == _i0c46qnp.SyncOperationResultDto) {
      return _i0c46qnp.SyncOperationResultDto.fromJson(data) as T;
    }
    if (t == _i2e8b5z3.SyncStatusDto) {
      return _i2e8b5z3.SyncStatusDto.fromJson(data) as T;
    }
    if (t == _iyxfog5l.ProcessedSyncOperation) {
      return _iyxfog5l.ProcessedSyncOperation.fromJson(data) as T;
    }
    if (t == _ijoocq8q.SyncChange) {
      return _ijoocq8q.SyncChange.fromJson(data) as T;
    }
    if (t == _irvfms91.SyncLog) {
      return _irvfms91.SyncLog.fromJson(data) as T;
    }
    if (t == _ipxryt3x.SyncOperationStatus) {
      return _ipxryt3x.SyncOperationStatus.fromJson(data) as T;
    }
    if (t == _ir0y0iu6.UserRole) {
      return _ir0y0iu6.UserRole.fromJson(data) as T;
    }
    if (t == _is.getType<_irtsa1cb.Admin?>()) {
      return (data != null ? _irtsa1cb.Admin.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_ilq3ip1w.AdminUserDto?>()) {
      return (data != null ? _ilq3ip1w.AdminUserDto.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_iud5fcio.AnalyticsReportDto?>()) {
      return (data != null ? _iud5fcio.AnalyticsReportDto.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_idhpgcsg.AuditLogDto?>()) {
      return (data != null ? _idhpgcsg.AuditLogDto.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_i78ov9ny.CourseGpaDto?>()) {
      return (data != null ? _i78ov9ny.CourseGpaDto.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_ioqh38vf.NamedCountDto?>()) {
      return (data != null ? _ioqh38vf.NamedCountDto.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_ii94yimq.PendingClassApprovalDto?>()) {
      return (data != null
              ? _ii94yimq.PendingClassApprovalDto.fromJson(data)
              : null)
          as T;
    }
    if (t == _is.getType<_iqtm76wd.AdminPermission?>()) {
      return (data != null ? _iqtm76wd.AdminPermission.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_ikq6rbq0.ClassApproval?>()) {
      return (data != null ? _ikq6rbq0.ClassApproval.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_iwu8lwz6.ClassApprovalStatus?>()) {
      return (data != null
              ? _iwu8lwz6.ClassApprovalStatus.fromJson(data)
              : null)
          as T;
    }
    if (t == _is.getType<_immuk475.CourseCategory?>()) {
      return (data != null ? _immuk475.CourseCategory.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_ifcme4qk.SystemAuditLog?>()) {
      return (data != null ? _ifcme4qk.SystemAuditLog.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_it4z223c.AppException?>()) {
      return (data != null ? _it4z223c.AppException.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_i2j2xfrn.AppUser?>()) {
      return (data != null ? _i2j2xfrn.AppUser.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_izw8z7ou.Greeting?>()) {
      return (data != null ? _izw8z7ou.Greeting.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_itbetnwi.Lecturer?>()) {
      return (data != null ? _itbetnwi.Lecturer.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_iq0ly2ak.ClassDemandDto?>()) {
      return (data != null ? _iq0ly2ak.ClassDemandDto.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_io3zsf6b.ClassStudentDto?>()) {
      return (data != null ? _io3zsf6b.ClassStudentDto.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_iqyoloat.LecturerCourseClassDto?>()) {
      return (data != null
              ? _iqyoloat.LecturerCourseClassDto.fromJson(data)
              : null)
          as T;
    }
    if (t == _is.getType<_ipt2hr1k.LecturerProfileDto?>()) {
      return (data != null ? _ipt2hr1k.LecturerProfileDto.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_im5rikfg.LecturerActivityLog?>()) {
      return (data != null
              ? _im5rikfg.LecturerActivityLog.fromJson(data)
              : null)
          as T;
    }
    if (t == _is.getType<_iokj3d6r.LecturerCourseClass?>()) {
      return (data != null
              ? _iokj3d6r.LecturerCourseClass.fromJson(data)
              : null)
          as T;
    }
    if (t == _is.getType<_irv87c2y.TeachingScheduleProposal?>()) {
      return (data != null
              ? _irv87c2y.TeachingScheduleProposal.fromJson(data)
              : null)
          as T;
    }
    if (t == _is.getType<_il6xaj9m.TeachingScheduleStatus?>()) {
      return (data != null
              ? _il6xaj9m.TeachingScheduleStatus.fromJson(data)
              : null)
          as T;
    }
    if (t == _is.getType<_ib3wa59y.ClassScheduleDto?>()) {
      return (data != null ? _ib3wa59y.ClassScheduleDto.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_iaaclq68.EligibilityResultDto?>()) {
      return (data != null
              ? _iaaclq68.EligibilityResultDto.fromJson(data)
              : null)
          as T;
    }
    if (t == _is.getType<_ipozmldp.OpenCourseClassDto?>()) {
      return (data != null ? _ipozmldp.OpenCourseClassDto.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_ilcih2k6.RegisteredCourseDto?>()) {
      return (data != null
              ? _ilcih2k6.RegisteredCourseDto.fromJson(data)
              : null)
          as T;
    }
    if (t == _is.getType<_ii8dcq83.RegistrationResultDto?>()) {
      return (data != null
              ? _ii8dcq83.RegistrationResultDto.fromJson(data)
              : null)
          as T;
    }
    if (t == _is.getType<_ivo6ya0v.ClassSchedule?>()) {
      return (data != null ? _ivo6ya0v.ClassSchedule.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_intqjpio.CourseClass?>()) {
      return (data != null ? _intqjpio.CourseClass.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_i6111ktp.CourseClassStatus?>()) {
      return (data != null ? _i6111ktp.CourseClassStatus.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_ivq6o0sg.CourseEquivalent?>()) {
      return (data != null ? _ivq6o0sg.CourseEquivalent.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_iagk693e.CourseOpeningRequest?>()) {
      return (data != null
              ? _iagk693e.CourseOpeningRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _is.getType<_i7f5kvdx.CoursePrerequisite?>()) {
      return (data != null ? _i7f5kvdx.CoursePrerequisite.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_i9ek3ou2.OpeningRequestStatus?>()) {
      return (data != null
              ? _i9ek3ou2.OpeningRequestStatus.fromJson(data)
              : null)
          as T;
    }
    if (t == _is.getType<_isg2rjz0.Registration?>()) {
      return (data != null ? _isg2rjz0.Registration.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_ick1ofaw.RegistrationAction?>()) {
      return (data != null ? _ick1ofaw.RegistrationAction.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_io6lhm66.RegistrationHistory?>()) {
      return (data != null
              ? _io6lhm66.RegistrationHistory.fromJson(data)
              : null)
          as T;
    }
    if (t == _is.getType<_ienvemo7.RegistrationStatus?>()) {
      return (data != null ? _ienvemo7.RegistrationStatus.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_iz7vluge.Semester?>()) {
      return (data != null ? _iz7vluge.Semester.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_inuj73nk.SemesterStatus?>()) {
      return (data != null ? _inuj73nk.SemesterStatus.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_iwzlgl4r.Student?>()) {
      return (data != null ? _iwzlgl4r.Student.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_igzwjm5d.GpaDto?>()) {
      return (data != null ? _igzwjm5d.GpaDto.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_iwyne1wa.StudentProfileDto?>()) {
      return (data != null ? _iwyne1wa.StudentProfileDto.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_iiy6nwja.TrainingProgramCourseDto?>()) {
      return (data != null
              ? _iiy6nwja.TrainingProgramCourseDto.fromJson(data)
              : null)
          as T;
    }
    if (t == _is.getType<_ia9f4ste.TranscriptDto?>()) {
      return (data != null ? _ia9f4ste.TranscriptDto.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_iysyfyey.Course?>()) {
      return (data != null ? _iysyfyey.Course.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_inmihsz6.CourseProgressStatus?>()) {
      return (data != null
              ? _inmihsz6.CourseProgressStatus.fromJson(data)
              : null)
          as T;
    }
    if (t == _is.getType<_iajbyi83.CourseType?>()) {
      return (data != null ? _iajbyi83.CourseType.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_iehbjec4.Faculty?>()) {
      return (data != null ? _iehbjec4.Faculty.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_iqe9gc9z.Major?>()) {
      return (data != null ? _iqe9gc9z.Major.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_iw15wxpt.StudentTranscript?>()) {
      return (data != null ? _iw15wxpt.StudentTranscript.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_ige2gcz9.TrainingProgram?>()) {
      return (data != null ? _ige2gcz9.TrainingProgram.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_im8ku9lz.TrainingProgramCourse?>()) {
      return (data != null
              ? _im8ku9lz.TrainingProgramCourse.fromJson(data)
              : null)
          as T;
    }
    if (t == _is.getType<_i3gkq2t9.TranscriptStatus?>()) {
      return (data != null ? _i3gkq2t9.TranscriptStatus.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_i8xfjltp.PullSyncResultDto?>()) {
      return (data != null ? _i8xfjltp.PullSyncResultDto.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_ih97hn2e.SyncChangeDto?>()) {
      return (data != null ? _ih97hn2e.SyncChangeDto.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_ijhls20r.SyncOperationInputDto?>()) {
      return (data != null
              ? _ijhls20r.SyncOperationInputDto.fromJson(data)
              : null)
          as T;
    }
    if (t == _is.getType<_i0c46qnp.SyncOperationResultDto?>()) {
      return (data != null
              ? _i0c46qnp.SyncOperationResultDto.fromJson(data)
              : null)
          as T;
    }
    if (t == _is.getType<_i2e8b5z3.SyncStatusDto?>()) {
      return (data != null ? _i2e8b5z3.SyncStatusDto.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_iyxfog5l.ProcessedSyncOperation?>()) {
      return (data != null
              ? _iyxfog5l.ProcessedSyncOperation.fromJson(data)
              : null)
          as T;
    }
    if (t == _is.getType<_ijoocq8q.SyncChange?>()) {
      return (data != null ? _ijoocq8q.SyncChange.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_irvfms91.SyncLog?>()) {
      return (data != null ? _irvfms91.SyncLog.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_ipxryt3x.SyncOperationStatus?>()) {
      return (data != null
              ? _ipxryt3x.SyncOperationStatus.fromJson(data)
              : null)
          as T;
    }
    if (t == _is.getType<_ir0y0iu6.UserRole?>()) {
      return (data != null ? _ir0y0iu6.UserRole.fromJson(data) : null) as T;
    }
    if (t == List<_ioqh38vf.NamedCountDto>) {
      return (data as List)
              .map((e) => deserialize<_ioqh38vf.NamedCountDto>(e))
              .toList()
          as T;
    }
    if (t == List<_iq0ly2ak.ClassDemandDto>) {
      return (data as List)
              .map((e) => deserialize<_iq0ly2ak.ClassDemandDto>(e))
              .toList()
          as T;
    }
    if (t == List<_i78ov9ny.CourseGpaDto>) {
      return (data as List)
              .map((e) => deserialize<_i78ov9ny.CourseGpaDto>(e))
              .toList()
          as T;
    }
    if (t == List<_irv87c2y.TeachingScheduleProposal>) {
      return (data as List)
              .map((e) => deserialize<_irv87c2y.TeachingScheduleProposal>(e))
              .toList()
          as T;
    }
    if (t == List<_ib3wa59y.ClassScheduleDto>) {
      return (data as List)
              .map((e) => deserialize<_ib3wa59y.ClassScheduleDto>(e))
              .toList()
          as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == List<_ih97hn2e.SyncChangeDto>) {
      return (data as List)
              .map((e) => deserialize<_ih97hn2e.SyncChangeDto>(e))
              .toList()
          as T;
    }
    if (t == List<_ijh58tix.AdminUserDto>) {
      return (data as List)
              .map((e) => deserialize<_ijh58tix.AdminUserDto>(e))
              .toList()
          as T;
    }
    if (t == List<_i0cq0q6i.Course>) {
      return (data as List)
              .map((e) => deserialize<_i0cq0q6i.Course>(e))
              .toList()
          as T;
    }
    if (t == List<_iyi2skq0.TrainingProgram>) {
      return (data as List)
              .map((e) => deserialize<_iyi2skq0.TrainingProgram>(e))
              .toList()
          as T;
    }
    if (t == List<_icci7mnm.Major>) {
      return (data as List).map((e) => deserialize<_icci7mnm.Major>(e)).toList()
          as T;
    }
    if (t == List<_iyb4eomn.TrainingProgramCourse>) {
      return (data as List)
              .map((e) => deserialize<_iyb4eomn.TrainingProgramCourse>(e))
              .toList()
          as T;
    }
    if (t == List<_ivv0f5sx.CoursePrerequisite>) {
      return (data as List)
              .map((e) => deserialize<_ivv0f5sx.CoursePrerequisite>(e))
              .toList()
          as T;
    }
    if (t == List<_iulejzlc.CourseEquivalent>) {
      return (data as List)
              .map((e) => deserialize<_iulejzlc.CourseEquivalent>(e))
              .toList()
          as T;
    }
    if (t == List<_iwn434hf.PendingClassApprovalDto>) {
      return (data as List)
              .map((e) => deserialize<_iwn434hf.PendingClassApprovalDto>(e))
              .toList()
          as T;
    }
    if (t == List<_iemolfy3.CourseOpeningRequest>) {
      return (data as List)
              .map((e) => deserialize<_iemolfy3.CourseOpeningRequest>(e))
              .toList()
          as T;
    }
    if (t == List<_irwy8n4a.AuditLogDto>) {
      return (data as List)
              .map((e) => deserialize<_irwy8n4a.AuditLogDto>(e))
              .toList()
          as T;
    }
    if (t == List<_iz7mx3pw.AdminPermission>) {
      return (data as List)
              .map((e) => deserialize<_iz7mx3pw.AdminPermission>(e))
              .toList()
          as T;
    }
    if (t == List<_i4gr1wnu.Semester>) {
      return (data as List)
              .map((e) => deserialize<_i4gr1wnu.Semester>(e))
              .toList()
          as T;
    }
    if (t == List<_ibcbukpi.LecturerCourseClassDto>) {
      return (data as List)
              .map((e) => deserialize<_ibcbukpi.LecturerCourseClassDto>(e))
              .toList()
          as T;
    }
    if (t == List<_ig0q9hbn.ClassScheduleDto>) {
      return (data as List)
              .map((e) => deserialize<_ig0q9hbn.ClassScheduleDto>(e))
              .toList()
          as T;
    }
    if (t == List<_imgyj9ow.TeachingScheduleProposal>) {
      return (data as List)
              .map((e) => deserialize<_imgyj9ow.TeachingScheduleProposal>(e))
              .toList()
          as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == List<_i130z107.ClassStudentDto>) {
      return (data as List)
              .map((e) => deserialize<_i130z107.ClassStudentDto>(e))
              .toList()
          as T;
    }
    if (t == List<_ia38wpgm.ClassDemandDto>) {
      return (data as List)
              .map((e) => deserialize<_ia38wpgm.ClassDemandDto>(e))
              .toList()
          as T;
    }
    if (t == List<_i23bizbs.OpenCourseClassDto>) {
      return (data as List)
              .map((e) => deserialize<_i23bizbs.OpenCourseClassDto>(e))
              .toList()
          as T;
    }
    if (t == List<_ih5gikos.RegisteredCourseDto>) {
      return (data as List)
              .map((e) => deserialize<_ih5gikos.RegisteredCourseDto>(e))
              .toList()
          as T;
    }
    if (t == List<_ixjgi6ec.TrainingProgramCourseDto>) {
      return (data as List)
              .map((e) => deserialize<_ixjgi6ec.TrainingProgramCourseDto>(e))
              .toList()
          as T;
    }
    if (t == List<_iwd1k4sa.TranscriptDto>) {
      return (data as List)
              .map((e) => deserialize<_iwd1k4sa.TranscriptDto>(e))
              .toList()
          as T;
    }
    if (t == List<_ik10x0zo.SyncOperationResultDto>) {
      return (data as List)
              .map((e) => deserialize<_ik10x0zo.SyncOperationResultDto>(e))
              .toList()
          as T;
    }
    if (t == List<_i968sfzk.SyncOperationInputDto>) {
      return (data as List)
              .map((e) => deserialize<_i968sfzk.SyncOperationInputDto>(e))
              .toList()
          as T;
    }
    try {
      return _iacs.Protocol().deserialize<T>(data, t);
    } on _is.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _iais.Protocol().deserialize<T>(data, t);
    } on _is.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _isp.Protocol().deserialize<T>(data, t);
    } on _is.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _irtsa1cb.Admin => 'Admin',
      _ilq3ip1w.AdminUserDto => 'AdminUserDto',
      _iud5fcio.AnalyticsReportDto => 'AnalyticsReportDto',
      _idhpgcsg.AuditLogDto => 'AuditLogDto',
      _i78ov9ny.CourseGpaDto => 'CourseGpaDto',
      _ioqh38vf.NamedCountDto => 'NamedCountDto',
      _ii94yimq.PendingClassApprovalDto => 'PendingClassApprovalDto',
      _iqtm76wd.AdminPermission => 'AdminPermission',
      _ikq6rbq0.ClassApproval => 'ClassApproval',
      _iwu8lwz6.ClassApprovalStatus => 'ClassApprovalStatus',
      _immuk475.CourseCategory => 'CourseCategory',
      _ifcme4qk.SystemAuditLog => 'SystemAuditLog',
      _it4z223c.AppException => 'AppException',
      _i2j2xfrn.AppUser => 'AppUser',
      _izw8z7ou.Greeting => 'Greeting',
      _itbetnwi.Lecturer => 'Lecturer',
      _iq0ly2ak.ClassDemandDto => 'ClassDemandDto',
      _io3zsf6b.ClassStudentDto => 'ClassStudentDto',
      _iqyoloat.LecturerCourseClassDto => 'LecturerCourseClassDto',
      _ipt2hr1k.LecturerProfileDto => 'LecturerProfileDto',
      _im5rikfg.LecturerActivityLog => 'LecturerActivityLog',
      _iokj3d6r.LecturerCourseClass => 'LecturerCourseClass',
      _irv87c2y.TeachingScheduleProposal => 'TeachingScheduleProposal',
      _il6xaj9m.TeachingScheduleStatus => 'TeachingScheduleStatus',
      _ib3wa59y.ClassScheduleDto => 'ClassScheduleDto',
      _iaaclq68.EligibilityResultDto => 'EligibilityResultDto',
      _ipozmldp.OpenCourseClassDto => 'OpenCourseClassDto',
      _ilcih2k6.RegisteredCourseDto => 'RegisteredCourseDto',
      _ii8dcq83.RegistrationResultDto => 'RegistrationResultDto',
      _ivo6ya0v.ClassSchedule => 'ClassSchedule',
      _intqjpio.CourseClass => 'CourseClass',
      _i6111ktp.CourseClassStatus => 'CourseClassStatus',
      _ivq6o0sg.CourseEquivalent => 'CourseEquivalent',
      _iagk693e.CourseOpeningRequest => 'CourseOpeningRequest',
      _i7f5kvdx.CoursePrerequisite => 'CoursePrerequisite',
      _i9ek3ou2.OpeningRequestStatus => 'OpeningRequestStatus',
      _isg2rjz0.Registration => 'Registration',
      _ick1ofaw.RegistrationAction => 'RegistrationAction',
      _io6lhm66.RegistrationHistory => 'RegistrationHistory',
      _ienvemo7.RegistrationStatus => 'RegistrationStatus',
      _iz7vluge.Semester => 'Semester',
      _inuj73nk.SemesterStatus => 'SemesterStatus',
      _iwzlgl4r.Student => 'Student',
      _igzwjm5d.GpaDto => 'GpaDto',
      _iwyne1wa.StudentProfileDto => 'StudentProfileDto',
      _iiy6nwja.TrainingProgramCourseDto => 'TrainingProgramCourseDto',
      _ia9f4ste.TranscriptDto => 'TranscriptDto',
      _iysyfyey.Course => 'Course',
      _inmihsz6.CourseProgressStatus => 'CourseProgressStatus',
      _iajbyi83.CourseType => 'CourseType',
      _iehbjec4.Faculty => 'Faculty',
      _iqe9gc9z.Major => 'Major',
      _iw15wxpt.StudentTranscript => 'StudentTranscript',
      _ige2gcz9.TrainingProgram => 'TrainingProgram',
      _im8ku9lz.TrainingProgramCourse => 'TrainingProgramCourse',
      _i3gkq2t9.TranscriptStatus => 'TranscriptStatus',
      _i8xfjltp.PullSyncResultDto => 'PullSyncResultDto',
      _ih97hn2e.SyncChangeDto => 'SyncChangeDto',
      _ijhls20r.SyncOperationInputDto => 'SyncOperationInputDto',
      _i0c46qnp.SyncOperationResultDto => 'SyncOperationResultDto',
      _i2e8b5z3.SyncStatusDto => 'SyncStatusDto',
      _iyxfog5l.ProcessedSyncOperation => 'ProcessedSyncOperation',
      _ijoocq8q.SyncChange => 'SyncChange',
      _irvfms91.SyncLog => 'SyncLog',
      _ipxryt3x.SyncOperationStatus => 'SyncOperationStatus',
      _ir0y0iu6.UserRole => 'UserRole',
      _ => null,
    };
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;

    if (data is Map<String, dynamic> && data['__className__'] is String) {
      return (data['__className__'] as String).replaceFirst(
        'course_registration.',
        '',
      );
    }

    switch (data) {
      case _irtsa1cb.Admin():
        return 'Admin';
      case _ilq3ip1w.AdminUserDto():
        return 'AdminUserDto';
      case _iud5fcio.AnalyticsReportDto():
        return 'AnalyticsReportDto';
      case _idhpgcsg.AuditLogDto():
        return 'AuditLogDto';
      case _i78ov9ny.CourseGpaDto():
        return 'CourseGpaDto';
      case _ioqh38vf.NamedCountDto():
        return 'NamedCountDto';
      case _ii94yimq.PendingClassApprovalDto():
        return 'PendingClassApprovalDto';
      case _iqtm76wd.AdminPermission():
        return 'AdminPermission';
      case _ikq6rbq0.ClassApproval():
        return 'ClassApproval';
      case _iwu8lwz6.ClassApprovalStatus():
        return 'ClassApprovalStatus';
      case _immuk475.CourseCategory():
        return 'CourseCategory';
      case _ifcme4qk.SystemAuditLog():
        return 'SystemAuditLog';
      case _it4z223c.AppException():
        return 'AppException';
      case _i2j2xfrn.AppUser():
        return 'AppUser';
      case _izw8z7ou.Greeting():
        return 'Greeting';
      case _itbetnwi.Lecturer():
        return 'Lecturer';
      case _iq0ly2ak.ClassDemandDto():
        return 'ClassDemandDto';
      case _io3zsf6b.ClassStudentDto():
        return 'ClassStudentDto';
      case _iqyoloat.LecturerCourseClassDto():
        return 'LecturerCourseClassDto';
      case _ipt2hr1k.LecturerProfileDto():
        return 'LecturerProfileDto';
      case _im5rikfg.LecturerActivityLog():
        return 'LecturerActivityLog';
      case _iokj3d6r.LecturerCourseClass():
        return 'LecturerCourseClass';
      case _irv87c2y.TeachingScheduleProposal():
        return 'TeachingScheduleProposal';
      case _il6xaj9m.TeachingScheduleStatus():
        return 'TeachingScheduleStatus';
      case _ib3wa59y.ClassScheduleDto():
        return 'ClassScheduleDto';
      case _iaaclq68.EligibilityResultDto():
        return 'EligibilityResultDto';
      case _ipozmldp.OpenCourseClassDto():
        return 'OpenCourseClassDto';
      case _ilcih2k6.RegisteredCourseDto():
        return 'RegisteredCourseDto';
      case _ii8dcq83.RegistrationResultDto():
        return 'RegistrationResultDto';
      case _ivo6ya0v.ClassSchedule():
        return 'ClassSchedule';
      case _intqjpio.CourseClass():
        return 'CourseClass';
      case _i6111ktp.CourseClassStatus():
        return 'CourseClassStatus';
      case _ivq6o0sg.CourseEquivalent():
        return 'CourseEquivalent';
      case _iagk693e.CourseOpeningRequest():
        return 'CourseOpeningRequest';
      case _i7f5kvdx.CoursePrerequisite():
        return 'CoursePrerequisite';
      case _i9ek3ou2.OpeningRequestStatus():
        return 'OpeningRequestStatus';
      case _isg2rjz0.Registration():
        return 'Registration';
      case _ick1ofaw.RegistrationAction():
        return 'RegistrationAction';
      case _io6lhm66.RegistrationHistory():
        return 'RegistrationHistory';
      case _ienvemo7.RegistrationStatus():
        return 'RegistrationStatus';
      case _iz7vluge.Semester():
        return 'Semester';
      case _inuj73nk.SemesterStatus():
        return 'SemesterStatus';
      case _iwzlgl4r.Student():
        return 'Student';
      case _igzwjm5d.GpaDto():
        return 'GpaDto';
      case _iwyne1wa.StudentProfileDto():
        return 'StudentProfileDto';
      case _iiy6nwja.TrainingProgramCourseDto():
        return 'TrainingProgramCourseDto';
      case _ia9f4ste.TranscriptDto():
        return 'TranscriptDto';
      case _iysyfyey.Course():
        return 'Course';
      case _inmihsz6.CourseProgressStatus():
        return 'CourseProgressStatus';
      case _iajbyi83.CourseType():
        return 'CourseType';
      case _iehbjec4.Faculty():
        return 'Faculty';
      case _iqe9gc9z.Major():
        return 'Major';
      case _iw15wxpt.StudentTranscript():
        return 'StudentTranscript';
      case _ige2gcz9.TrainingProgram():
        return 'TrainingProgram';
      case _im8ku9lz.TrainingProgramCourse():
        return 'TrainingProgramCourse';
      case _i3gkq2t9.TranscriptStatus():
        return 'TranscriptStatus';
      case _i8xfjltp.PullSyncResultDto():
        return 'PullSyncResultDto';
      case _ih97hn2e.SyncChangeDto():
        return 'SyncChangeDto';
      case _ijhls20r.SyncOperationInputDto():
        return 'SyncOperationInputDto';
      case _i0c46qnp.SyncOperationResultDto():
        return 'SyncOperationResultDto';
      case _i2e8b5z3.SyncStatusDto():
        return 'SyncStatusDto';
      case _iyxfog5l.ProcessedSyncOperation():
        return 'ProcessedSyncOperation';
      case _ijoocq8q.SyncChange():
        return 'SyncChange';
      case _irvfms91.SyncLog():
        return 'SyncLog';
      case _ipxryt3x.SyncOperationStatus():
        return 'SyncOperationStatus';
      case _ir0y0iu6.UserRole():
        return 'UserRole';
    }
    className = _iacs.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.')
          ? className
          : 'serverpod_auth_core.$className';
    }
    className = _iais.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.')
          ? className
          : 'serverpod_auth_idp.$className';
    }
    className = _isp.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.') ? className : 'serverpod.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'Admin') {
      return deserialize<_irtsa1cb.Admin>(data['data']);
    }
    if (dataClassName == 'AdminUserDto') {
      return deserialize<_ilq3ip1w.AdminUserDto>(data['data']);
    }
    if (dataClassName == 'AnalyticsReportDto') {
      return deserialize<_iud5fcio.AnalyticsReportDto>(data['data']);
    }
    if (dataClassName == 'AuditLogDto') {
      return deserialize<_idhpgcsg.AuditLogDto>(data['data']);
    }
    if (dataClassName == 'CourseGpaDto') {
      return deserialize<_i78ov9ny.CourseGpaDto>(data['data']);
    }
    if (dataClassName == 'NamedCountDto') {
      return deserialize<_ioqh38vf.NamedCountDto>(data['data']);
    }
    if (dataClassName == 'PendingClassApprovalDto') {
      return deserialize<_ii94yimq.PendingClassApprovalDto>(data['data']);
    }
    if (dataClassName == 'AdminPermission') {
      return deserialize<_iqtm76wd.AdminPermission>(data['data']);
    }
    if (dataClassName == 'ClassApproval') {
      return deserialize<_ikq6rbq0.ClassApproval>(data['data']);
    }
    if (dataClassName == 'ClassApprovalStatus') {
      return deserialize<_iwu8lwz6.ClassApprovalStatus>(data['data']);
    }
    if (dataClassName == 'CourseCategory') {
      return deserialize<_immuk475.CourseCategory>(data['data']);
    }
    if (dataClassName == 'SystemAuditLog') {
      return deserialize<_ifcme4qk.SystemAuditLog>(data['data']);
    }
    if (dataClassName == 'AppException') {
      return deserialize<_it4z223c.AppException>(data['data']);
    }
    if (dataClassName == 'AppUser') {
      return deserialize<_i2j2xfrn.AppUser>(data['data']);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_izw8z7ou.Greeting>(data['data']);
    }
    if (dataClassName == 'Lecturer') {
      return deserialize<_itbetnwi.Lecturer>(data['data']);
    }
    if (dataClassName == 'ClassDemandDto') {
      return deserialize<_iq0ly2ak.ClassDemandDto>(data['data']);
    }
    if (dataClassName == 'ClassStudentDto') {
      return deserialize<_io3zsf6b.ClassStudentDto>(data['data']);
    }
    if (dataClassName == 'LecturerCourseClassDto') {
      return deserialize<_iqyoloat.LecturerCourseClassDto>(data['data']);
    }
    if (dataClassName == 'LecturerProfileDto') {
      return deserialize<_ipt2hr1k.LecturerProfileDto>(data['data']);
    }
    if (dataClassName == 'LecturerActivityLog') {
      return deserialize<_im5rikfg.LecturerActivityLog>(data['data']);
    }
    if (dataClassName == 'LecturerCourseClass') {
      return deserialize<_iokj3d6r.LecturerCourseClass>(data['data']);
    }
    if (dataClassName == 'TeachingScheduleProposal') {
      return deserialize<_irv87c2y.TeachingScheduleProposal>(data['data']);
    }
    if (dataClassName == 'TeachingScheduleStatus') {
      return deserialize<_il6xaj9m.TeachingScheduleStatus>(data['data']);
    }
    if (dataClassName == 'ClassScheduleDto') {
      return deserialize<_ib3wa59y.ClassScheduleDto>(data['data']);
    }
    if (dataClassName == 'EligibilityResultDto') {
      return deserialize<_iaaclq68.EligibilityResultDto>(data['data']);
    }
    if (dataClassName == 'OpenCourseClassDto') {
      return deserialize<_ipozmldp.OpenCourseClassDto>(data['data']);
    }
    if (dataClassName == 'RegisteredCourseDto') {
      return deserialize<_ilcih2k6.RegisteredCourseDto>(data['data']);
    }
    if (dataClassName == 'RegistrationResultDto') {
      return deserialize<_ii8dcq83.RegistrationResultDto>(data['data']);
    }
    if (dataClassName == 'ClassSchedule') {
      return deserialize<_ivo6ya0v.ClassSchedule>(data['data']);
    }
    if (dataClassName == 'CourseClass') {
      return deserialize<_intqjpio.CourseClass>(data['data']);
    }
    if (dataClassName == 'CourseClassStatus') {
      return deserialize<_i6111ktp.CourseClassStatus>(data['data']);
    }
    if (dataClassName == 'CourseEquivalent') {
      return deserialize<_ivq6o0sg.CourseEquivalent>(data['data']);
    }
    if (dataClassName == 'CourseOpeningRequest') {
      return deserialize<_iagk693e.CourseOpeningRequest>(data['data']);
    }
    if (dataClassName == 'CoursePrerequisite') {
      return deserialize<_i7f5kvdx.CoursePrerequisite>(data['data']);
    }
    if (dataClassName == 'OpeningRequestStatus') {
      return deserialize<_i9ek3ou2.OpeningRequestStatus>(data['data']);
    }
    if (dataClassName == 'Registration') {
      return deserialize<_isg2rjz0.Registration>(data['data']);
    }
    if (dataClassName == 'RegistrationAction') {
      return deserialize<_ick1ofaw.RegistrationAction>(data['data']);
    }
    if (dataClassName == 'RegistrationHistory') {
      return deserialize<_io6lhm66.RegistrationHistory>(data['data']);
    }
    if (dataClassName == 'RegistrationStatus') {
      return deserialize<_ienvemo7.RegistrationStatus>(data['data']);
    }
    if (dataClassName == 'Semester') {
      return deserialize<_iz7vluge.Semester>(data['data']);
    }
    if (dataClassName == 'SemesterStatus') {
      return deserialize<_inuj73nk.SemesterStatus>(data['data']);
    }
    if (dataClassName == 'Student') {
      return deserialize<_iwzlgl4r.Student>(data['data']);
    }
    if (dataClassName == 'GpaDto') {
      return deserialize<_igzwjm5d.GpaDto>(data['data']);
    }
    if (dataClassName == 'StudentProfileDto') {
      return deserialize<_iwyne1wa.StudentProfileDto>(data['data']);
    }
    if (dataClassName == 'TrainingProgramCourseDto') {
      return deserialize<_iiy6nwja.TrainingProgramCourseDto>(data['data']);
    }
    if (dataClassName == 'TranscriptDto') {
      return deserialize<_ia9f4ste.TranscriptDto>(data['data']);
    }
    if (dataClassName == 'Course') {
      return deserialize<_iysyfyey.Course>(data['data']);
    }
    if (dataClassName == 'CourseProgressStatus') {
      return deserialize<_inmihsz6.CourseProgressStatus>(data['data']);
    }
    if (dataClassName == 'CourseType') {
      return deserialize<_iajbyi83.CourseType>(data['data']);
    }
    if (dataClassName == 'Faculty') {
      return deserialize<_iehbjec4.Faculty>(data['data']);
    }
    if (dataClassName == 'Major') {
      return deserialize<_iqe9gc9z.Major>(data['data']);
    }
    if (dataClassName == 'StudentTranscript') {
      return deserialize<_iw15wxpt.StudentTranscript>(data['data']);
    }
    if (dataClassName == 'TrainingProgram') {
      return deserialize<_ige2gcz9.TrainingProgram>(data['data']);
    }
    if (dataClassName == 'TrainingProgramCourse') {
      return deserialize<_im8ku9lz.TrainingProgramCourse>(data['data']);
    }
    if (dataClassName == 'TranscriptStatus') {
      return deserialize<_i3gkq2t9.TranscriptStatus>(data['data']);
    }
    if (dataClassName == 'PullSyncResultDto') {
      return deserialize<_i8xfjltp.PullSyncResultDto>(data['data']);
    }
    if (dataClassName == 'SyncChangeDto') {
      return deserialize<_ih97hn2e.SyncChangeDto>(data['data']);
    }
    if (dataClassName == 'SyncOperationInputDto') {
      return deserialize<_ijhls20r.SyncOperationInputDto>(data['data']);
    }
    if (dataClassName == 'SyncOperationResultDto') {
      return deserialize<_i0c46qnp.SyncOperationResultDto>(data['data']);
    }
    if (dataClassName == 'SyncStatusDto') {
      return deserialize<_i2e8b5z3.SyncStatusDto>(data['data']);
    }
    if (dataClassName == 'ProcessedSyncOperation') {
      return deserialize<_iyxfog5l.ProcessedSyncOperation>(data['data']);
    }
    if (dataClassName == 'SyncChange') {
      return deserialize<_ijoocq8q.SyncChange>(data['data']);
    }
    if (dataClassName == 'SyncLog') {
      return deserialize<_irvfms91.SyncLog>(data['data']);
    }
    if (dataClassName == 'SyncOperationStatus') {
      return deserialize<_ipxryt3x.SyncOperationStatus>(data['data']);
    }
    if (dataClassName == 'UserRole') {
      return deserialize<_ir0y0iu6.UserRole>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _iacs.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _iais.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod.')) {
      data['className'] = dataClassName.substring(10);
      return _isp.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  void _registerHostProtocols() {
    _iacs.Protocol().registerHostProtocol('course_registration', this);
    _iais.Protocol().registerHostProtocol('course_registration', this);
  }

  @override
  _is.Table? getTableForType(Type t) {
    {
      var table = _iacs.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _iais.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _isp.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _irtsa1cb.Admin:
        return _irtsa1cb.Admin.t;
      case _iqtm76wd.AdminPermission:
        return _iqtm76wd.AdminPermission.t;
      case _ikq6rbq0.ClassApproval:
        return _ikq6rbq0.ClassApproval.t;
      case _immuk475.CourseCategory:
        return _immuk475.CourseCategory.t;
      case _ifcme4qk.SystemAuditLog:
        return _ifcme4qk.SystemAuditLog.t;
      case _i2j2xfrn.AppUser:
        return _i2j2xfrn.AppUser.t;
      case _itbetnwi.Lecturer:
        return _itbetnwi.Lecturer.t;
      case _im5rikfg.LecturerActivityLog:
        return _im5rikfg.LecturerActivityLog.t;
      case _iokj3d6r.LecturerCourseClass:
        return _iokj3d6r.LecturerCourseClass.t;
      case _irv87c2y.TeachingScheduleProposal:
        return _irv87c2y.TeachingScheduleProposal.t;
      case _ivo6ya0v.ClassSchedule:
        return _ivo6ya0v.ClassSchedule.t;
      case _intqjpio.CourseClass:
        return _intqjpio.CourseClass.t;
      case _ivq6o0sg.CourseEquivalent:
        return _ivq6o0sg.CourseEquivalent.t;
      case _iagk693e.CourseOpeningRequest:
        return _iagk693e.CourseOpeningRequest.t;
      case _i7f5kvdx.CoursePrerequisite:
        return _i7f5kvdx.CoursePrerequisite.t;
      case _isg2rjz0.Registration:
        return _isg2rjz0.Registration.t;
      case _io6lhm66.RegistrationHistory:
        return _io6lhm66.RegistrationHistory.t;
      case _iz7vluge.Semester:
        return _iz7vluge.Semester.t;
      case _iwzlgl4r.Student:
        return _iwzlgl4r.Student.t;
      case _iysyfyey.Course:
        return _iysyfyey.Course.t;
      case _iehbjec4.Faculty:
        return _iehbjec4.Faculty.t;
      case _iqe9gc9z.Major:
        return _iqe9gc9z.Major.t;
      case _iw15wxpt.StudentTranscript:
        return _iw15wxpt.StudentTranscript.t;
      case _ige2gcz9.TrainingProgram:
        return _ige2gcz9.TrainingProgram.t;
      case _im8ku9lz.TrainingProgramCourse:
        return _im8ku9lz.TrainingProgramCourse.t;
      case _iyxfog5l.ProcessedSyncOperation:
        return _iyxfog5l.ProcessedSyncOperation.t;
      case _ijoocq8q.SyncChange:
        return _ijoocq8q.SyncChange.t;
      case _irvfms91.SyncLog:
        return _irvfms91.SyncLog.t;
    }
    return null;
  }

  @override
  List<_isp.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'course_registration';

  /// Maps any `Record`s known to this [Protocol] to their JSON representation
  ///
  /// Throws in case the record type is not known.
  ///
  /// This method will return `null` (only) for `null` inputs.
  Map<String, dynamic>? mapRecordToJson(Record? record) {
    if (record == null) {
      return null;
    }
    try {
      return _iacs.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _iais.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
