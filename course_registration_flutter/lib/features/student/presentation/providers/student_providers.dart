import 'package:course_registration_client/course_registration_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/services/providers.dart';
import '../../data/student_repository_impl.dart';
import '../../domain/repositories/student_repository.dart';

enum GradeScale { four, ten }

extension GradeScaleValue on GradeScale {
  double fromFourPoint(double score) => switch (this) {
    GradeScale.four => score,
    GradeScale.ten => score * 2.5,
  };

  String get maximum => this == GradeScale.four ? '4.0' : '10';
}

class GradeScaleController extends Notifier<GradeScale> {
  @override
  GradeScale build() => GradeScale.four;

  void select(GradeScale value) => state = value;
}

final gradeScaleProvider = NotifierProvider<GradeScaleController, GradeScale>(
  GradeScaleController.new,
);

final studentRepositoryProvider = Provider<StudentRepository>(
  (ref) => StudentRepositoryImpl(
    ref.watch(clientProvider),
    ref.watch(databaseProvider),
  ),
);

final studentProfileProvider = FutureProvider.autoDispose<StudentProfileDto>(
  (ref) => ref.watch(studentRepositoryProvider).getProfile(),
);

final trainingProgramProvider =
    FutureProvider.autoDispose<List<TrainingProgramCourseDto>>((
      ref,
    ) async {
      final profile = await ref.watch(studentProfileProvider.future);
      return ref
          .watch(studentRepositoryProvider)
          .getTrainingProgram(profile.studentId);
    });

final transcriptProvider = FutureProvider.autoDispose<List<TranscriptDto>>((
  ref,
) async {
  final profile = await ref.watch(studentProfileProvider.future);
  return ref.watch(studentRepositoryProvider).getTranscript(profile.studentId);
});

final gpaProvider = FutureProvider.autoDispose<GpaDto>((ref) async {
  final profile = await ref.watch(studentProfileProvider.future);
  return ref.watch(studentRepositoryProvider).getGpa(profile.studentId);
});
