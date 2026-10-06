import 'package:course_registration_client/course_registration_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/services/providers.dart';
import '../../data/lecturer_repository_impl.dart';
import '../../domain/repositories/lecturer_repository.dart';

final lecturerRepositoryProvider = Provider<LecturerRepository>(
  (ref) => LecturerRepositoryImpl(
    ref.watch(clientProvider),
    ref.watch(databaseProvider),
  ),
);
final lecturerProvider = FutureProvider.autoDispose<LecturerProfileDto>(
  (ref) => ref.watch(lecturerRepositoryProvider).getProfile(),
);
final courseClassProvider =
    FutureProvider.autoDispose<List<LecturerCourseClassDto>>(
      (ref) => ref.watch(lecturerRepositoryProvider).getClasses(),
    );
final scheduleProvider =
    FutureProvider.autoDispose<List<TeachingScheduleProposal>>(
      (ref) => ref.watch(lecturerRepositoryProvider).getSchedule(),
    );
final studentListProvider = FutureProvider.autoDispose
    .family<List<ClassStudentDto>, UuidValue>(
      (ref, id) => ref.watch(lecturerRepositoryProvider).getStudents(id),
    );
final classDemandProvider = FutureProvider.autoDispose<List<ClassDemandDto>>(
  (ref) => ref.watch(lecturerRepositoryProvider).getDemand(),
);
final lecturerCoursesProvider = FutureProvider.autoDispose<List<Course>>(
  (ref) => ref.watch(lecturerRepositoryProvider).getCourses(),
);
final lecturerSemestersProvider = FutureProvider.autoDispose<List<Semester>>(
  (ref) => ref.watch(lecturerRepositoryProvider).getSemesters(),
);
final availableRoomsProvider = FutureProvider.autoDispose<List<String>>(
  (ref) => ref.watch(lecturerRepositoryProvider).getAvailableRooms(),
);
