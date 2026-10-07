import 'package:course_registration_server/src/auth/app_scopes.dart';
import 'package:course_registration_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:test/test.dart';

import 'test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod('Admin endpoint', (sessionBuilder, endpoints) {
    test('creates a course, reports metrics and records audit', () async {
      final authUserId = UuidValue.withValidation(
        '018f0000-0000-7000-8000-000000000501',
      );
      final session = sessionBuilder.build();
      final user = await AppUser.db.insertRow(
        session,
        AppUser(
          authUserId: authUserId,
          email: 'phase6-admin@example.edu',
          fullName: 'Quản trị hệ thống',
          role: UserRole.admin,
        ),
      );
      final admin = await Admin.db.insertRow(session, Admin(userId: user.id!));
      await AdminPermission.db.insert(
        session,
        {'MANAGE_COURSE', 'VIEW_REPORT', 'VIEW_AUDIT'}
            .map(
              (permission) => AdminPermission(
                adminId: admin.id!,
                permissionName: permission,
              ),
            )
            .toList(),
      );
      final authenticated = sessionBuilder.copyWith(
        authentication: AuthenticationOverride.authenticationInfo(
          authUserId.toString(),
          {AppScopes.admin},
        ),
      );

      final course = await endpoints.admin.createCourse(
        authenticated,
        courseName: 'Quản trị hệ thống',
        credits: 3,
        courseType: CourseType.compulsory,
      );
      final reports = await endpoints.admin.getReports(authenticated);
      final logs = await endpoints.admin.getAuditLogs(authenticated);

      expect(course.courseCode, startsWith('MH'));
      expect(reports.totalCourses, greaterThanOrEqualTo(1));
      expect(logs.single.action, 'CREATE_COURSE');
      expect(logs.single.actorName, 'Quản trị hệ thống');
    });
  });
}
