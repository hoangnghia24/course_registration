import 'package:course_registration_client/course_registration_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/services/providers.dart';
import '../../data/admin_repository_impl.dart';
import '../../domain/repositories/admin_repository.dart';

final adminRepositoryProvider = Provider<AdminRepository>(
  (ref) => AdminRepositoryImpl(
    ref.watch(clientProvider),
    ref.watch(databaseProvider),
  ),
);
final adminProvider = FutureProvider.autoDispose<AnalyticsReportDto>(
  (ref) => ref.watch(adminRepositoryProvider).getReports(),
);
final userManagementProvider = FutureProvider.autoDispose<List<AdminUserDto>>(
  (ref) => ref.watch(adminRepositoryProvider).getUsers(),
);
final courseManagementProvider = FutureProvider.autoDispose<List<Course>>(
  (ref) => ref.watch(adminRepositoryProvider).getCourses(),
);
final approvalProvider =
    FutureProvider.autoDispose<List<PendingClassApprovalDto>>(
      (ref) => ref.watch(adminRepositoryProvider).getPendingClasses(),
    );
final adjustmentRequestsProvider = FutureProvider.autoDispose
    .family<List<ClassAdjustmentRequestDto>, ClassAdjustmentStatus?>(
      (ref, status) => ref
          .watch(adminRepositoryProvider)
          .getAdjustmentRequests(status: status),
    );
final registrationPeriodsProvider =
    FutureProvider.autoDispose<List<RegistrationPeriodDto>>(
      (ref) => ref.watch(adminRepositoryProvider).getRegistrationPeriods(),
    );
final analyticsProvider = adminProvider;
final auditLogProvider = FutureProvider.autoDispose<List<AuditLogDto>>(
  (ref) => ref.watch(adminRepositoryProvider).getAuditLogs(),
);
final trainingProgramsAdminProvider =
    FutureProvider.autoDispose<List<TrainingProgram>>(
      (ref) => ref.watch(adminRepositoryProvider).getPrograms(),
    );
final majorsAdminProvider = FutureProvider.autoDispose<List<Major>>(
  (ref) => ref.watch(adminRepositoryProvider).getMajors(),
);
final prerequisitesAdminProvider =
    FutureProvider.autoDispose<List<CoursePrerequisite>>(
      (ref) => ref.watch(adminRepositoryProvider).getPrerequisites(),
    );
final equivalentsAdminProvider =
    FutureProvider.autoDispose<List<CourseEquivalent>>(
      (ref) => ref.watch(adminRepositoryProvider).getEquivalents(),
    );
