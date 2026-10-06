import 'package:serverpod/serverpod.dart';

import '../auth/role_guards.dart';
import '../generated/protocol.dart';
import 'services/student_service.dart';

class StudentEndpoint extends StudentGuard {
  Future<StudentProfileDto> getProfile(
    Session session, {
    UuidValue? studentId,
  }) => StudentService.getProfile(session, studentId: studentId);

  Future<List<TrainingProgramCourseDto>> getTrainingProgram(
    Session session, {
    UuidValue? studentId,
    int? page,
    int? pageSize,
  }) => StudentService.getTrainingProgram(
    session,
    studentId: studentId,
    page: page ?? 1,
    pageSize: pageSize ?? 50,
  );

  Future<List<TranscriptDto>> getTranscript(
    Session session, {
    UuidValue? studentId,
    int? page,
    int? pageSize,
  }) => StudentService.getTranscript(
    session,
    studentId: studentId,
    page: page ?? 1,
    pageSize: pageSize ?? 50,
  );

  Future<GpaDto> getGpa(
    Session session, {
    UuidValue? studentId,
    String? semester,
  }) => StudentService.getGpa(
    session,
    studentId: studentId,
    semester: semester,
  );
}
