import 'package:course_registration_client/course_registration_client.dart';

AnalyticsReportDto adminReport() => AnalyticsReportDto(
  totalStudents: 120,
  totalLecturers: 18,
  totalCourses: 42,
  openClasses: 9,
  fullClasses: 3,
  closedClasses: 7,
  studentsByFaculty: [NamedCountDto(name: 'CNTT', count: 120)],
  studentsByMajor: [NamedCountDto(name: 'Software Engineering', count: 80)],
  courseDemand: const [],
  failedCourses: [NamedCountDto(name: 'Calculus', count: 12)],
  courseGpas: [
    CourseGpaDto(
      courseCode: 'CS101',
      courseName: 'Programming',
      averageGpa: 3.25,
    ),
  ],
);

AdminUserDto adminStudent() => AdminUserDto(
  userId: UuidValue.withValidation('018f0000-0000-7000-8000-000000000101'),
  authUserId: UuidValue.withValidation(
    '018f0000-0000-7000-8000-000000000102',
  ),
  email: 'student@example.edu',
  fullName: 'Admin Test Student',
  role: UserRole.student,
  isActive: true,
  roleCode: 'SV001',
);

AdminUserDto disabledAdminStudent() => AdminUserDto(
  userId: UuidValue.withValidation('018f0000-0000-7000-8000-000000000103'),
  authUserId: UuidValue.withValidation(
    '018f0000-0000-7000-8000-000000000104',
  ),
  email: 'disabled@example.edu',
  fullName: 'Disabled Test Student',
  role: UserRole.student,
  isActive: false,
  roleCode: 'SV002',
);
