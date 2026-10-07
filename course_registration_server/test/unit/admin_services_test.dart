import 'package:course_registration_server/src/admin/services/admin_permission_service.dart';
import 'package:course_registration_server/src/admin/services/analytics_service.dart';
import 'package:course_registration_server/src/admin/services/approval_workflow.dart';
import 'package:course_registration_server/src/generated/protocol.dart';
import 'package:test/test.dart';

void main() {
  test(
    'permission checker is fail-closed and supports explicit permissions',
    () {
      expect(AdminPermissionService.isAllowed({}, 'MANAGE_USER'), isFalse);
      expect(
        AdminPermissionService.isAllowed({'MANAGE_USER'}, 'MANAGE_USER'),
        isTrue,
      );
      expect(
        AdminPermissionService.isAllowed({'VIEW_REPORT'}, 'MANAGE_USER'),
        isFalse,
      );
    },
  );

  test('approval workflow maps decisions to class status', () {
    final approved = ApprovalWorkflow.resolve(approve: true);
    final rejected = ApprovalWorkflow.resolve(approve: false);
    expect(approved, ClassApprovalStatus.approved);
    expect(ApprovalWorkflow.classStatus(approved), CourseClassStatus.open);
    expect(rejected, ClassApprovalStatus.rejected);
    expect(ApprovalWorkflow.classStatus(rejected), CourseClassStatus.closed);
  });

  test('report calculator returns rounded average', () {
    expect(ReportCalculator.average([4, 3, 2.5]), 3.17);
    expect(ReportCalculator.average([]), 0);
  });
}
