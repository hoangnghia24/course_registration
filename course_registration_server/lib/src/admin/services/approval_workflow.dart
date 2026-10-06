import '../../generated/protocol.dart';

abstract final class ApprovalWorkflow {
  static ClassApprovalStatus resolve({required bool approve}) =>
      approve ? ClassApprovalStatus.approved : ClassApprovalStatus.rejected;

  static CourseClassStatus classStatus(ClassApprovalStatus status) =>
      status == ClassApprovalStatus.approved
      ? CourseClassStatus.open
      : CourseClassStatus.closed;
}
