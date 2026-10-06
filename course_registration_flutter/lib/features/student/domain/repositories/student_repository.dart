import 'package:course_registration_client/course_registration_client.dart';

abstract interface class StudentRepository {
  Future<StudentProfileDto> getProfile();

  Future<List<TrainingProgramCourseDto>> getTrainingProgram(
    UuidValue studentId,
  );

  Future<List<TranscriptDto>> getTranscript(UuidValue studentId);

  Future<GpaDto> getGpa(UuidValue studentId, {String? semester});
}
