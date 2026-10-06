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
import 'package:course_registration_server/src/generated/registration/dto/class_schedule_dto.dart'
    as _ig0q9hbn;
import 'package:course_registration_server/src/generated/registration/models/course_class_status.dart'
    as _i2w6mn3n;
import 'package:course_registration_server/src/generated/student/models/course_type.dart'
    as _i6yjtab1;
import 'package:course_registration_server/src/generated/sync/dto/sync_operation_input_dto.dart'
    as _i968sfzk;
import 'package:course_registration_server/src/generated/user_role.dart'
    as _ioux7u11;
import 'package:serverpod/serverpod.dart' as _is;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _iacs;
import 'package:serverpod_auth_idp_server/serverpod_auth_idp_server.dart'
    as _iais;
import '../admin/admin_endpoint.dart' as _ido5l6pj;
import '../auth/email_idp_endpoint.dart' as _iuc1hd5t;
import '../auth/jwt_refresh_endpoint.dart' as _inwq3ztq;
import '../auth/role_access_endpoint.dart' as _i6u0mg39;
import '../greetings/greeting_endpoint.dart' as _il624ik7;
import '../lecturer/lecturer_endpoint.dart' as _ioi4ibhi;
import '../profile/profile_endpoint.dart' as _i6ky944g;
import '../registration/course_registration_endpoint.dart' as _i2breg4l;
import '../student/student_endpoint.dart' as _ib7egavc;
import '../sync/sync_endpoint.dart' as _imb49tzk;

class Endpoints extends _is.EndpointDispatch {
  @override
  void initializeEndpoints(_is.Server server) {
    var endpoints = <String, _is.Endpoint>{
      'admin': _ido5l6pj.AdminEndpoint()
        ..initialize(
          server,
          'admin',
          null,
        ),
      'emailIdp': _iuc1hd5t.EmailIdpEndpoint()
        ..initialize(
          server,
          'emailIdp',
          null,
        ),
      'jwtRefresh': _inwq3ztq.JwtRefreshEndpoint()
        ..initialize(
          server,
          'jwtRefresh',
          null,
        ),
      'studentAccess': _i6u0mg39.StudentAccessEndpoint()
        ..initialize(
          server,
          'studentAccess',
          null,
        ),
      'lecturerAccess': _i6u0mg39.LecturerAccessEndpoint()
        ..initialize(
          server,
          'lecturerAccess',
          null,
        ),
      'adminAccess': _i6u0mg39.AdminAccessEndpoint()
        ..initialize(
          server,
          'adminAccess',
          null,
        ),
      'greeting': _il624ik7.GreetingEndpoint()
        ..initialize(
          server,
          'greeting',
          null,
        ),
      'lecturer': _ioi4ibhi.LecturerEndpoint()
        ..initialize(
          server,
          'lecturer',
          null,
        ),
      'profile': _i6ky944g.ProfileEndpoint()
        ..initialize(
          server,
          'profile',
          null,
        ),
      'courseRegistration': _i2breg4l.CourseRegistrationEndpoint()
        ..initialize(
          server,
          'courseRegistration',
          null,
        ),
      'student': _ib7egavc.StudentEndpoint()
        ..initialize(
          server,
          'student',
          null,
        ),
      'sync': _imb49tzk.SyncEndpoint()
        ..initialize(
          server,
          'sync',
          null,
        ),
    };
    connectors['admin'] = _is.EndpointConnector(
      name: 'admin',
      endpoint: endpoints['admin']!,
      methodConnectors: {
        'getUsers': _is.MethodConnector(
          name: 'getUsers',
          params: {
            'page': _is.ParameterDescription(
              name: 'page',
              type: _is.getType<int?>(),
              nullable: true,
            ),
            'pageSize': _is.ParameterDescription(
              name: 'pageSize',
              type: _is.getType<int?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['admin'] as _ido5l6pj.AdminEndpoint).getUsers(
                    session,
                    page: params['page'],
                    pageSize: params['pageSize'],
                  ),
        ),
        'createUser': _is.MethodConnector(
          name: 'createUser',
          params: {
            'email': _is.ParameterDescription(
              name: 'email',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'password': _is.ParameterDescription(
              name: 'password',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'fullName': _is.ParameterDescription(
              name: 'fullName',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'role': _is.ParameterDescription(
              name: 'role',
              type: _is.getType<_ioux7u11.UserRole>(),
              nullable: false,
            ),
            'roleCode': _is.ParameterDescription(
              name: 'roleCode',
              type: _is.getType<String?>(),
              nullable: true,
            ),
            'academicYear': _is.ParameterDescription(
              name: 'academicYear',
              type: _is.getType<int?>(),
              nullable: true,
            ),
            'majorId': _is.ParameterDescription(
              name: 'majorId',
              type: _is.getType<_is.UuidValue?>(),
              nullable: true,
            ),
            'trainingProgramId': _is.ParameterDescription(
              name: 'trainingProgramId',
              type: _is.getType<_is.UuidValue?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['admin'] as _ido5l6pj.AdminEndpoint).createUser(
                    session,
                    email: params['email'],
                    password: params['password'],
                    fullName: params['fullName'],
                    role: params['role'],
                    roleCode: params['roleCode'],
                    academicYear: params['academicYear'],
                    majorId: params['majorId'],
                    trainingProgramId: params['trainingProgramId'],
                  ),
        ),
        'updateUser': _is.MethodConnector(
          name: 'updateUser',
          params: {
            'userId': _is.ParameterDescription(
              name: 'userId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
            'fullName': _is.ParameterDescription(
              name: 'fullName',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'phone': _is.ParameterDescription(
              name: 'phone',
              type: _is.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['admin'] as _ido5l6pj.AdminEndpoint).updateUser(
                    session,
                    userId: params['userId'],
                    fullName: params['fullName'],
                    phone: params['phone'],
                  ),
        ),
        'disableUser': _is.MethodConnector(
          name: 'disableUser',
          params: {
            'userId': _is.ParameterDescription(
              name: 'userId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['admin'] as _ido5l6pj.AdminEndpoint).disableUser(
                    session,
                    userId: params['userId'],
                  ),
        ),
        'getCourses': _is.MethodConnector(
          name: 'getCourses',
          params: {
            'page': _is.ParameterDescription(
              name: 'page',
              type: _is.getType<int?>(),
              nullable: true,
            ),
            'pageSize': _is.ParameterDescription(
              name: 'pageSize',
              type: _is.getType<int?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['admin'] as _ido5l6pj.AdminEndpoint).getCourses(
                    session,
                    page: params['page'],
                    pageSize: params['pageSize'],
                  ),
        ),
        'createCourse': _is.MethodConnector(
          name: 'createCourse',
          params: {
            'courseCode': _is.ParameterDescription(
              name: 'courseCode',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'courseName': _is.ParameterDescription(
              name: 'courseName',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'credits': _is.ParameterDescription(
              name: 'credits',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'courseType': _is.ParameterDescription(
              name: 'courseType',
              type: _is.getType<_i6yjtab1.CourseType>(),
              nullable: false,
            ),
            'description': _is.ParameterDescription(
              name: 'description',
              type: _is.getType<String?>(),
              nullable: true,
            ),
            'categoryId': _is.ParameterDescription(
              name: 'categoryId',
              type: _is.getType<_is.UuidValue?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['admin'] as _ido5l6pj.AdminEndpoint).createCourse(
                    session,
                    courseCode: params['courseCode'],
                    courseName: params['courseName'],
                    credits: params['credits'],
                    courseType: params['courseType'],
                    description: params['description'],
                    categoryId: params['categoryId'],
                  ),
        ),
        'updateCourse': _is.MethodConnector(
          name: 'updateCourse',
          params: {
            'courseId': _is.ParameterDescription(
              name: 'courseId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
            'courseCode': _is.ParameterDescription(
              name: 'courseCode',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'courseName': _is.ParameterDescription(
              name: 'courseName',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'credits': _is.ParameterDescription(
              name: 'credits',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'courseType': _is.ParameterDescription(
              name: 'courseType',
              type: _is.getType<_i6yjtab1.CourseType>(),
              nullable: false,
            ),
            'description': _is.ParameterDescription(
              name: 'description',
              type: _is.getType<String?>(),
              nullable: true,
            ),
            'categoryId': _is.ParameterDescription(
              name: 'categoryId',
              type: _is.getType<_is.UuidValue?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['admin'] as _ido5l6pj.AdminEndpoint).updateCourse(
                    session,
                    courseId: params['courseId'],
                    courseCode: params['courseCode'],
                    courseName: params['courseName'],
                    credits: params['credits'],
                    courseType: params['courseType'],
                    description: params['description'],
                    categoryId: params['categoryId'],
                  ),
        ),
        'deleteCourse': _is.MethodConnector(
          name: 'deleteCourse',
          params: {
            'courseId': _is.ParameterDescription(
              name: 'courseId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['admin'] as _ido5l6pj.AdminEndpoint).deleteCourse(
                    session,
                    courseId: params['courseId'],
                  ),
        ),
        'getTrainingPrograms': _is.MethodConnector(
          name: 'getTrainingPrograms',
          params: {},
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['admin'] as _ido5l6pj.AdminEndpoint)
                  .getTrainingPrograms(session),
        ),
        'getMajors': _is.MethodConnector(
          name: 'getMajors',
          params: {},
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['admin'] as _ido5l6pj.AdminEndpoint)
                  .getMajors(session),
        ),
        'getProgramCourses': _is.MethodConnector(
          name: 'getProgramCourses',
          params: {
            'programId': _is.ParameterDescription(
              name: 'programId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['admin'] as _ido5l6pj.AdminEndpoint)
                  .getProgramCourses(
                    session,
                    programId: params['programId'],
                  ),
        ),
        'getPrerequisites': _is.MethodConnector(
          name: 'getPrerequisites',
          params: {},
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['admin'] as _ido5l6pj.AdminEndpoint)
                  .getPrerequisites(session),
        ),
        'getEquivalents': _is.MethodConnector(
          name: 'getEquivalents',
          params: {},
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['admin'] as _ido5l6pj.AdminEndpoint)
                  .getEquivalents(session),
        ),
        'createTrainingProgram': _is.MethodConnector(
          name: 'createTrainingProgram',
          params: {
            'majorId': _is.ParameterDescription(
              name: 'majorId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
            'name': _is.ParameterDescription(
              name: 'name',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'academicYear': _is.ParameterDescription(
              name: 'academicYear',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'totalCredits': _is.ParameterDescription(
              name: 'totalCredits',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'description': _is.ParameterDescription(
              name: 'description',
              type: _is.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['admin'] as _ido5l6pj.AdminEndpoint)
                  .createTrainingProgram(
                    session,
                    majorId: params['majorId'],
                    name: params['name'],
                    academicYear: params['academicYear'],
                    totalCredits: params['totalCredits'],
                    description: params['description'],
                  ),
        ),
        'updateTrainingProgram': _is.MethodConnector(
          name: 'updateTrainingProgram',
          params: {
            'programId': _is.ParameterDescription(
              name: 'programId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
            'name': _is.ParameterDescription(
              name: 'name',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'academicYear': _is.ParameterDescription(
              name: 'academicYear',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'totalCredits': _is.ParameterDescription(
              name: 'totalCredits',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'description': _is.ParameterDescription(
              name: 'description',
              type: _is.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['admin'] as _ido5l6pj.AdminEndpoint)
                  .updateTrainingProgram(
                    session,
                    programId: params['programId'],
                    name: params['name'],
                    academicYear: params['academicYear'],
                    totalCredits: params['totalCredits'],
                    description: params['description'],
                  ),
        ),
        'setProgramCourse': _is.MethodConnector(
          name: 'setProgramCourse',
          params: {
            'programId': _is.ParameterDescription(
              name: 'programId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
            'courseId': _is.ParameterDescription(
              name: 'courseId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
            'semesterNumber': _is.ParameterDescription(
              name: 'semesterNumber',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'isRequired': _is.ParameterDescription(
              name: 'isRequired',
              type: _is.getType<bool>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['admin'] as _ido5l6pj.AdminEndpoint)
                  .setProgramCourse(
                    session,
                    programId: params['programId'],
                    courseId: params['courseId'],
                    semesterNumber: params['semesterNumber'],
                    isRequired: params['isRequired'],
                  ),
        ),
        'addPrerequisite': _is.MethodConnector(
          name: 'addPrerequisite',
          params: {
            'courseId': _is.ParameterDescription(
              name: 'courseId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
            'requiredCourseId': _is.ParameterDescription(
              name: 'requiredCourseId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['admin'] as _ido5l6pj.AdminEndpoint)
                  .addPrerequisite(
                    session,
                    courseId: params['courseId'],
                    requiredCourseId: params['requiredCourseId'],
                  ),
        ),
        'removePrerequisite': _is.MethodConnector(
          name: 'removePrerequisite',
          params: {
            'prerequisiteId': _is.ParameterDescription(
              name: 'prerequisiteId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['admin'] as _ido5l6pj.AdminEndpoint)
                  .removePrerequisite(
                    session,
                    prerequisiteId: params['prerequisiteId'],
                  ),
        ),
        'addEquivalent': _is.MethodConnector(
          name: 'addEquivalent',
          params: {
            'courseId': _is.ParameterDescription(
              name: 'courseId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
            'equivalentCourseId': _is.ParameterDescription(
              name: 'equivalentCourseId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['admin'] as _ido5l6pj.AdminEndpoint).addEquivalent(
                    session,
                    courseId: params['courseId'],
                    equivalentCourseId: params['equivalentCourseId'],
                  ),
        ),
        'removeEquivalent': _is.MethodConnector(
          name: 'removeEquivalent',
          params: {
            'equivalentId': _is.ParameterDescription(
              name: 'equivalentId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['admin'] as _ido5l6pj.AdminEndpoint)
                  .removeEquivalent(
                    session,
                    equivalentId: params['equivalentId'],
                  ),
        ),
        'getPendingClasses': _is.MethodConnector(
          name: 'getPendingClasses',
          params: {},
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['admin'] as _ido5l6pj.AdminEndpoint)
                  .getPendingClasses(session),
        ),
        'approveClass': _is.MethodConnector(
          name: 'approveClass',
          params: {
            'courseClassId': _is.ParameterDescription(
              name: 'courseClassId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
            'comment': _is.ParameterDescription(
              name: 'comment',
              type: _is.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['admin'] as _ido5l6pj.AdminEndpoint).approveClass(
                    session,
                    courseClassId: params['courseClassId'],
                    comment: params['comment'],
                  ),
        ),
        'rejectClass': _is.MethodConnector(
          name: 'rejectClass',
          params: {
            'courseClassId': _is.ParameterDescription(
              name: 'courseClassId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
            'comment': _is.ParameterDescription(
              name: 'comment',
              type: _is.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['admin'] as _ido5l6pj.AdminEndpoint).rejectClass(
                    session,
                    courseClassId: params['courseClassId'],
                    comment: params['comment'],
                  ),
        ),
        'getOpeningRequests': _is.MethodConnector(
          name: 'getOpeningRequests',
          params: {},
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['admin'] as _ido5l6pj.AdminEndpoint)
                  .getOpeningRequests(session),
        ),
        'decideOpeningRequest': _is.MethodConnector(
          name: 'decideOpeningRequest',
          params: {
            'requestId': _is.ParameterDescription(
              name: 'requestId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
            'approve': _is.ParameterDescription(
              name: 'approve',
              type: _is.getType<bool>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['admin'] as _ido5l6pj.AdminEndpoint)
                  .decideOpeningRequest(
                    session,
                    requestId: params['requestId'],
                    approve: params['approve'],
                  ),
        ),
        'getReports': _is.MethodConnector(
          name: 'getReports',
          params: {},
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['admin'] as _ido5l6pj.AdminEndpoint)
                  .getReports(session),
        ),
        'getAuditLogs': _is.MethodConnector(
          name: 'getAuditLogs',
          params: {
            'page': _is.ParameterDescription(
              name: 'page',
              type: _is.getType<int?>(),
              nullable: true,
            ),
            'pageSize': _is.ParameterDescription(
              name: 'pageSize',
              type: _is.getType<int?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['admin'] as _ido5l6pj.AdminEndpoint).getAuditLogs(
                    session,
                    page: params['page'],
                    pageSize: params['pageSize'],
                  ),
        ),
        'getPermissions': _is.MethodConnector(
          name: 'getPermissions',
          params: {
            'adminId': _is.ParameterDescription(
              name: 'adminId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['admin'] as _ido5l6pj.AdminEndpoint)
                  .getPermissions(
                    session,
                    adminId: params['adminId'],
                  ),
        ),
        'grantPermission': _is.MethodConnector(
          name: 'grantPermission',
          params: {
            'adminId': _is.ParameterDescription(
              name: 'adminId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
            'permission': _is.ParameterDescription(
              name: 'permission',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['admin'] as _ido5l6pj.AdminEndpoint)
                  .grantPermission(
                    session,
                    adminId: params['adminId'],
                    permission: params['permission'],
                  ),
        ),
      },
    );
    connectors['emailIdp'] = _is.EndpointConnector(
      name: 'emailIdp',
      endpoint: endpoints['emailIdp']!,
      methodConnectors: {
        'startRegistration': _is.MethodConnector(
          name: 'startRegistration',
          params: {
            'email': _is.ParameterDescription(
              name: 'email',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .startRegistration(
                    session,
                    email: params['email'],
                  ),
        ),
        'login': _is.MethodConnector(
          name: 'login',
          params: {
            'email': _is.ParameterDescription(
              name: 'email',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'password': _is.ParameterDescription(
              name: 'password',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint).login(
                    session,
                    email: params['email'],
                    password: params['password'],
                  ),
        ),
        'verifyRegistrationCode': _is.MethodConnector(
          name: 'verifyRegistrationCode',
          params: {
            'accountRequestId': _is.ParameterDescription(
              name: 'accountRequestId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
            'verificationCode': _is.ParameterDescription(
              name: 'verificationCode',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .verifyRegistrationCode(
                    session,
                    accountRequestId: params['accountRequestId'],
                    verificationCode: params['verificationCode'],
                  ),
        ),
        'finishRegistration': _is.MethodConnector(
          name: 'finishRegistration',
          params: {
            'registrationToken': _is.ParameterDescription(
              name: 'registrationToken',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'password': _is.ParameterDescription(
              name: 'password',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .finishRegistration(
                    session,
                    registrationToken: params['registrationToken'],
                    password: params['password'],
                  ),
        ),
        'startPasswordReset': _is.MethodConnector(
          name: 'startPasswordReset',
          params: {
            'email': _is.ParameterDescription(
              name: 'email',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .startPasswordReset(
                    session,
                    email: params['email'],
                  ),
        ),
        'verifyPasswordResetCode': _is.MethodConnector(
          name: 'verifyPasswordResetCode',
          params: {
            'passwordResetRequestId': _is.ParameterDescription(
              name: 'passwordResetRequestId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
            'verificationCode': _is.ParameterDescription(
              name: 'verificationCode',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .verifyPasswordResetCode(
                    session,
                    passwordResetRequestId: params['passwordResetRequestId'],
                    verificationCode: params['verificationCode'],
                  ),
        ),
        'finishPasswordReset': _is.MethodConnector(
          name: 'finishPasswordReset',
          params: {
            'finishPasswordResetToken': _is.ParameterDescription(
              name: 'finishPasswordResetToken',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'newPassword': _is.ParameterDescription(
              name: 'newPassword',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .finishPasswordReset(
                    session,
                    finishPasswordResetToken:
                        params['finishPasswordResetToken'],
                    newPassword: params['newPassword'],
                  ),
        ),
        'hasAccount': _is.MethodConnector(
          name: 'hasAccount',
          params: {},
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .hasAccount(session),
        ),
      },
    );
    connectors['jwtRefresh'] = _is.EndpointConnector(
      name: 'jwtRefresh',
      endpoint: endpoints['jwtRefresh']!,
      methodConnectors: {
        'refreshAccessToken': _is.MethodConnector(
          name: 'refreshAccessToken',
          params: {
            'refreshToken': _is.ParameterDescription(
              name: 'refreshToken',
              type: _is.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['jwtRefresh'] as _inwq3ztq.JwtRefreshEndpoint)
                      .refreshAccessToken(
                        session,
                        refreshToken: params['refreshToken'],
                      ),
        ),
      },
    );
    connectors['studentAccess'] = _is.EndpointConnector(
      name: 'studentAccess',
      endpoint: endpoints['studentAccess']!,
      methodConnectors: {
        'ping': _is.MethodConnector(
          name: 'ping',
          params: {},
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['studentAccess']
                          as _i6u0mg39.StudentAccessEndpoint)
                      .ping(session),
        ),
      },
    );
    connectors['lecturerAccess'] = _is.EndpointConnector(
      name: 'lecturerAccess',
      endpoint: endpoints['lecturerAccess']!,
      methodConnectors: {
        'ping': _is.MethodConnector(
          name: 'ping',
          params: {},
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['lecturerAccess']
                          as _i6u0mg39.LecturerAccessEndpoint)
                      .ping(session),
        ),
      },
    );
    connectors['adminAccess'] = _is.EndpointConnector(
      name: 'adminAccess',
      endpoint: endpoints['adminAccess']!,
      methodConnectors: {
        'ping': _is.MethodConnector(
          name: 'ping',
          params: {},
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['adminAccess'] as _i6u0mg39.AdminAccessEndpoint)
                      .ping(session),
        ),
      },
    );
    connectors['greeting'] = _is.EndpointConnector(
      name: 'greeting',
      endpoint: endpoints['greeting']!,
      methodConnectors: {
        'hello': _is.MethodConnector(
          name: 'hello',
          params: {
            'name': _is.ParameterDescription(
              name: 'name',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['greeting'] as _il624ik7.GreetingEndpoint).hello(
                    session,
                    params['name'],
                  ),
        ),
      },
    );
    connectors['lecturer'] = _is.EndpointConnector(
      name: 'lecturer',
      endpoint: endpoints['lecturer']!,
      methodConnectors: {
        'getMyProfile': _is.MethodConnector(
          name: 'getMyProfile',
          params: {},
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['lecturer'] as _ioi4ibhi.LecturerEndpoint)
                  .getMyProfile(session),
        ),
        'getCourses': _is.MethodConnector(
          name: 'getCourses',
          params: {},
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['lecturer'] as _ioi4ibhi.LecturerEndpoint)
                  .getCourses(session),
        ),
        'getSemesters': _is.MethodConnector(
          name: 'getSemesters',
          params: {},
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['lecturer'] as _ioi4ibhi.LecturerEndpoint)
                  .getSemesters(session),
        ),
        'getMyCourseClasses': _is.MethodConnector(
          name: 'getMyCourseClasses',
          params: {
            'page': _is.ParameterDescription(
              name: 'page',
              type: _is.getType<int?>(),
              nullable: true,
            ),
            'pageSize': _is.ParameterDescription(
              name: 'pageSize',
              type: _is.getType<int?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['lecturer'] as _ioi4ibhi.LecturerEndpoint)
                  .getMyCourseClasses(
                    session,
                    page: params['page'],
                    pageSize: params['pageSize'],
                  ),
        ),
        'createCourseClass': _is.MethodConnector(
          name: 'createCourseClass',
          params: {
            'courseId': _is.ParameterDescription(
              name: 'courseId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
            'semesterId': _is.ParameterDescription(
              name: 'semesterId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
            'classCode': _is.ParameterDescription(
              name: 'classCode',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'capacity': _is.ParameterDescription(
              name: 'capacity',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'schedules': _is.ParameterDescription(
              name: 'schedules',
              type: _is.getType<List<_ig0q9hbn.ClassScheduleDto>>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['lecturer'] as _ioi4ibhi.LecturerEndpoint)
                  .createCourseClass(
                    session,
                    courseId: params['courseId'],
                    semesterId: params['semesterId'],
                    classCode: params['classCode'],
                    capacity: params['capacity'],
                    schedules: params['schedules'],
                  ),
        ),
        'updateCourseClass': _is.MethodConnector(
          name: 'updateCourseClass',
          params: {
            'courseClassId': _is.ParameterDescription(
              name: 'courseClassId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
            'classCode': _is.ParameterDescription(
              name: 'classCode',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'capacity': _is.ParameterDescription(
              name: 'capacity',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'status': _is.ParameterDescription(
              name: 'status',
              type: _is.getType<_i2w6mn3n.CourseClassStatus>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['lecturer'] as _ioi4ibhi.LecturerEndpoint)
                  .updateCourseClass(
                    session,
                    courseClassId: params['courseClassId'],
                    classCode: params['classCode'],
                    capacity: params['capacity'],
                    status: params['status'],
                  ),
        ),
        'deleteCourseClass': _is.MethodConnector(
          name: 'deleteCourseClass',
          params: {
            'courseClassId': _is.ParameterDescription(
              name: 'courseClassId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['lecturer'] as _ioi4ibhi.LecturerEndpoint)
                  .deleteCourseClass(
                    session,
                    courseClassId: params['courseClassId'],
                  ),
        ),
        'createTeachingSchedule': _is.MethodConnector(
          name: 'createTeachingSchedule',
          params: {
            'courseClassId': _is.ParameterDescription(
              name: 'courseClassId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
            'schedule': _is.ParameterDescription(
              name: 'schedule',
              type: _is.getType<_ig0q9hbn.ClassScheduleDto>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['lecturer'] as _ioi4ibhi.LecturerEndpoint)
                  .createTeachingSchedule(
                    session,
                    courseClassId: params['courseClassId'],
                    schedule: params['schedule'],
                  ),
        ),
        'getMySchedule': _is.MethodConnector(
          name: 'getMySchedule',
          params: {},
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['lecturer'] as _ioi4ibhi.LecturerEndpoint)
                  .getMySchedule(session),
        ),
        'getRegisteredStudents': _is.MethodConnector(
          name: 'getRegisteredStudents',
          params: {
            'courseClassId': _is.ParameterDescription(
              name: 'courseClassId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
            'page': _is.ParameterDescription(
              name: 'page',
              type: _is.getType<int?>(),
              nullable: true,
            ),
            'pageSize': _is.ParameterDescription(
              name: 'pageSize',
              type: _is.getType<int?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['lecturer'] as _ioi4ibhi.LecturerEndpoint)
                  .getRegisteredStudents(
                    session,
                    courseClassId: params['courseClassId'],
                    page: params['page'],
                    pageSize: params['pageSize'],
                  ),
        ),
        'getClassDemand': _is.MethodConnector(
          name: 'getClassDemand',
          params: {},
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['lecturer'] as _ioi4ibhi.LecturerEndpoint)
                  .getClassDemand(session),
        ),
      },
    );
    connectors['profile'] = _is.EndpointConnector(
      name: 'profile',
      endpoint: endpoints['profile']!,
      methodConnectors: {
        'current': _is.MethodConnector(
          name: 'current',
          params: {},
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['profile'] as _i6ky944g.ProfileEndpoint)
                  .current(session),
        ),
        'ensureProfile': _is.MethodConnector(
          name: 'ensureProfile',
          params: {
            'fullName': _is.ParameterDescription(
              name: 'fullName',
              type: _is.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['profile'] as _i6ky944g.ProfileEndpoint)
                  .ensureProfile(
                    session,
                    fullName: params['fullName'],
                  ),
        ),
      },
    );
    connectors['courseRegistration'] = _is.EndpointConnector(
      name: 'courseRegistration',
      endpoint: endpoints['courseRegistration']!,
      methodConnectors: {
        'getCurrentSemester': _is.MethodConnector(
          name: 'getCurrentSemester',
          params: {},
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['courseRegistration']
                          as _i2breg4l.CourseRegistrationEndpoint)
                      .getCurrentSemester(session),
        ),
        'getOpenClasses': _is.MethodConnector(
          name: 'getOpenClasses',
          params: {
            'semesterId': _is.ParameterDescription(
              name: 'semesterId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
            'page': _is.ParameterDescription(
              name: 'page',
              type: _is.getType<int?>(),
              nullable: true,
            ),
            'pageSize': _is.ParameterDescription(
              name: 'pageSize',
              type: _is.getType<int?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['courseRegistration']
                          as _i2breg4l.CourseRegistrationEndpoint)
                      .getOpenClasses(
                        session,
                        semesterId: params['semesterId'],
                        page: params['page'],
                        pageSize: params['pageSize'],
                      ),
        ),
        'checkEligibility': _is.MethodConnector(
          name: 'checkEligibility',
          params: {
            'studentId': _is.ParameterDescription(
              name: 'studentId',
              type: _is.getType<_is.UuidValue?>(),
              nullable: true,
            ),
            'courseClassId': _is.ParameterDescription(
              name: 'courseClassId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['courseRegistration']
                          as _i2breg4l.CourseRegistrationEndpoint)
                      .checkEligibility(
                        session,
                        studentId: params['studentId'],
                        courseClassId: params['courseClassId'],
                      ),
        ),
        'registerCourse': _is.MethodConnector(
          name: 'registerCourse',
          params: {
            'studentId': _is.ParameterDescription(
              name: 'studentId',
              type: _is.getType<_is.UuidValue?>(),
              nullable: true,
            ),
            'courseClassId': _is.ParameterDescription(
              name: 'courseClassId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
            'deviceInfo': _is.ParameterDescription(
              name: 'deviceInfo',
              type: _is.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['courseRegistration']
                          as _i2breg4l.CourseRegistrationEndpoint)
                      .registerCourse(
                        session,
                        studentId: params['studentId'],
                        courseClassId: params['courseClassId'],
                        deviceInfo: params['deviceInfo'],
                      ),
        ),
        'cancelCourse': _is.MethodConnector(
          name: 'cancelCourse',
          params: {
            'registrationId': _is.ParameterDescription(
              name: 'registrationId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
            'deviceInfo': _is.ParameterDescription(
              name: 'deviceInfo',
              type: _is.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['courseRegistration']
                          as _i2breg4l.CourseRegistrationEndpoint)
                      .cancelCourse(
                        session,
                        registrationId: params['registrationId'],
                        deviceInfo: params['deviceInfo'],
                      ),
        ),
        'getMyCourses': _is.MethodConnector(
          name: 'getMyCourses',
          params: {
            'semesterId': _is.ParameterDescription(
              name: 'semesterId',
              type: _is.getType<_is.UuidValue?>(),
              nullable: true,
            ),
            'page': _is.ParameterDescription(
              name: 'page',
              type: _is.getType<int?>(),
              nullable: true,
            ),
            'pageSize': _is.ParameterDescription(
              name: 'pageSize',
              type: _is.getType<int?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['courseRegistration']
                          as _i2breg4l.CourseRegistrationEndpoint)
                      .getMyCourses(
                        session,
                        semesterId: params['semesterId'],
                        page: params['page'],
                        pageSize: params['pageSize'],
                      ),
        ),
        'createOpeningRequest': _is.MethodConnector(
          name: 'createOpeningRequest',
          params: {
            'courseId': _is.ParameterDescription(
              name: 'courseId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
            'reason': _is.ParameterDescription(
              name: 'reason',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['courseRegistration']
                          as _i2breg4l.CourseRegistrationEndpoint)
                      .createOpeningRequest(
                        session,
                        courseId: params['courseId'],
                        reason: params['reason'],
                      ),
        ),
      },
    );
    connectors['student'] = _is.EndpointConnector(
      name: 'student',
      endpoint: endpoints['student']!,
      methodConnectors: {
        'getProfile': _is.MethodConnector(
          name: 'getProfile',
          params: {
            'studentId': _is.ParameterDescription(
              name: 'studentId',
              type: _is.getType<_is.UuidValue?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['student'] as _ib7egavc.StudentEndpoint)
                  .getProfile(
                    session,
                    studentId: params['studentId'],
                  ),
        ),
        'getTrainingProgram': _is.MethodConnector(
          name: 'getTrainingProgram',
          params: {
            'studentId': _is.ParameterDescription(
              name: 'studentId',
              type: _is.getType<_is.UuidValue?>(),
              nullable: true,
            ),
            'page': _is.ParameterDescription(
              name: 'page',
              type: _is.getType<int?>(),
              nullable: true,
            ),
            'pageSize': _is.ParameterDescription(
              name: 'pageSize',
              type: _is.getType<int?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['student'] as _ib7egavc.StudentEndpoint)
                  .getTrainingProgram(
                    session,
                    studentId: params['studentId'],
                    page: params['page'],
                    pageSize: params['pageSize'],
                  ),
        ),
        'getTranscript': _is.MethodConnector(
          name: 'getTranscript',
          params: {
            'studentId': _is.ParameterDescription(
              name: 'studentId',
              type: _is.getType<_is.UuidValue?>(),
              nullable: true,
            ),
            'page': _is.ParameterDescription(
              name: 'page',
              type: _is.getType<int?>(),
              nullable: true,
            ),
            'pageSize': _is.ParameterDescription(
              name: 'pageSize',
              type: _is.getType<int?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['student'] as _ib7egavc.StudentEndpoint)
                  .getTranscript(
                    session,
                    studentId: params['studentId'],
                    page: params['page'],
                    pageSize: params['pageSize'],
                  ),
        ),
        'getGpa': _is.MethodConnector(
          name: 'getGpa',
          params: {
            'studentId': _is.ParameterDescription(
              name: 'studentId',
              type: _is.getType<_is.UuidValue?>(),
              nullable: true,
            ),
            'semester': _is.ParameterDescription(
              name: 'semester',
              type: _is.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['student'] as _ib7egavc.StudentEndpoint).getGpa(
                    session,
                    studentId: params['studentId'],
                    semester: params['semester'],
                  ),
        ),
      },
    );
    connectors['sync'] = _is.EndpointConnector(
      name: 'sync',
      endpoint: endpoints['sync']!,
      methodConnectors: {
        'ping': _is.MethodConnector(
          name: 'ping',
          params: {},
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['sync'] as _imb49tzk.SyncEndpoint).ping(session),
        ),
        'pushOperations': _is.MethodConnector(
          name: 'pushOperations',
          params: {
            'operations': _is.ParameterDescription(
              name: 'operations',
              type: _is.getType<List<_i968sfzk.SyncOperationInputDto>>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['sync'] as _imb49tzk.SyncEndpoint).pushOperations(
                    session,
                    operations: params['operations'],
                  ),
        ),
        'pullChanges': _is.MethodConnector(
          name: 'pullChanges',
          params: {
            'lastSyncAt': _is.ParameterDescription(
              name: 'lastSyncAt',
              type: _is.getType<DateTime?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['sync'] as _imb49tzk.SyncEndpoint).pullChanges(
                    session,
                    lastSyncAt: params['lastSyncAt'],
                  ),
        ),
        'getSyncStatus': _is.MethodConnector(
          name: 'getSyncStatus',
          params: {},
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['sync'] as _imb49tzk.SyncEndpoint)
                  .getSyncStatus(session),
        ),
        'retryOperation': _is.MethodConnector(
          name: 'retryOperation',
          params: {
            'operationId': _is.ParameterDescription(
              name: 'operationId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['sync'] as _imb49tzk.SyncEndpoint).retryOperation(
                    session,
                    operationId: params['operationId'],
                  ),
        ),
      },
    );
    modules['serverpod_auth_core'] = _iacs.Endpoints()
      ..initializeEndpoints(server);
    modules['serverpod_auth_idp'] = _iais.Endpoints()
      ..initializeEndpoints(server);
  }
}
