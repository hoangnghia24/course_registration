import 'package:course_registration_client/course_registration_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/database/app_database.dart';
import '../../../../shared/services/providers.dart';
import '../../data/course_registration_repository_impl.dart';
import '../../domain/repositories/course_registration_repository.dart';

final courseRegistrationRepositoryProvider =
    Provider<CourseRegistrationRepository>(
      (ref) => CourseRegistrationRepositoryImpl(
        ref.watch(clientProvider),
        ref.watch(databaseProvider),
        ref.watch(syncManagerProvider),
      ),
    );

final currentSemesterProvider = FutureProvider.autoDispose<Semester>(
  (ref) => ref.watch(courseRegistrationRepositoryProvider).getCurrentSemester(),
);

final openClassesProvider =
    FutureProvider.autoDispose<List<OpenCourseClassDto>>((
      ref,
    ) async {
      final semester = await ref.watch(currentSemesterProvider.future);
      return ref
          .watch(courseRegistrationRepositoryProvider)
          .getOpenClasses(semester.id!);
    });

final myRegisteredCoursesProvider =
    FutureProvider.autoDispose<List<RegisteredCourseDto>>((
      ref,
    ) async {
      final semester = await ref.watch(currentSemesterProvider.future);
      return ref
          .watch(courseRegistrationRepositoryProvider)
          .getMyCourses(semester.id!);
    });

final availableOpenClassesProvider =
    FutureProvider.autoDispose<List<OpenCourseClassDto>>((ref) async {
      final results = await Future.wait([
        ref.watch(openClassesProvider.future),
        ref.watch(myRegisteredCoursesProvider.future),
      ]);
      return filterAvailableClasses(
        results[0] as List<OpenCourseClassDto>,
        results[1] as List<RegisteredCourseDto>,
      );
    });

List<OpenCourseClassDto> filterAvailableClasses(
  List<OpenCourseClassDto> openClasses,
  List<RegisteredCourseDto> registeredCourses,
) {
  final registeredClassIds = registeredCourses
      .map((course) => course.courseClassId)
      .toSet();
  return openClasses
      .where((course) => !registeredClassIds.contains(course.courseClassId))
      .toList(growable: false);
}

final eligibilityProvider = FutureProvider.autoDispose
    .family<EligibilityResultDto, UuidValue>(
      (ref, courseClassId) => ref
          .watch(courseRegistrationRepositoryProvider)
          .checkEligibility(courseClassId),
    );

final pendingRegistrationsProvider =
    StreamProvider.autoDispose<List<PendingRegistrationLocalData>>(
      (ref) => ref.watch(databaseProvider).watchPendingRegistrations(),
    );
