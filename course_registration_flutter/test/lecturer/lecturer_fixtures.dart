import 'package:course_registration_client/course_registration_client.dart';

final lecturerId = UuidValue.withValidation(
  '018f0000-0000-7000-8000-000000000401',
);
final classId = UuidValue.withValidation(
  '018f0000-0000-7000-8000-000000000402',
);
final courseId = UuidValue.withValidation(
  '018f0000-0000-7000-8000-000000000403',
);
final semesterId = UuidValue.withValidation(
  '018f0000-0000-7000-8000-000000000404',
);

LecturerProfileDto lecturerProfile() => LecturerProfileDto(
  lecturerId: lecturerId,
  lecturerCode: 'GV001',
  fullName: 'Nguyễn Văn Giảng',
  email: 'giang@example.edu',
  department: 'Khoa học máy tính',
  academicTitle: 'Giảng viên chính',
  specialization: 'Cơ sở dữ liệu',
  facultyName: 'Công nghệ thông tin',
);

LecturerCourseClassDto lecturerClass() => LecturerCourseClassDto(
  courseClassId: classId,
  courseId: courseId,
  semesterId: semesterId,
  courseCode: 'IT101',
  courseName: 'Lập trình cơ bản',
  semesterName: 'Học kỳ 1',
  academicYear: 2026,
  classCode: 'CNTT01',
  capacity: 50,
  registeredCount: 45,
  status: CourseClassStatus.open,
  schedules: const [],
  proposals: const [],
);
