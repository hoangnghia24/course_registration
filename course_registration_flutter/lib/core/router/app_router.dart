import 'package:course_registration_client/course_registration_client.dart';
import 'package:go_router/go_router.dart';

import '../../features/authentication/presentation/controllers/auth_state_controller.dart';
import '../../features/authentication/presentation/pages/forgot_password_page.dart';
import '../../features/authentication/presentation/pages/login_page.dart';
import '../../features/authentication/presentation/pages/splash_page.dart';
import '../../features/admin/presentation/pages/admin_dashboard_page.dart';
import '../../features/admin/presentation/pages/audit_log_page.dart';
import '../../features/admin/presentation/pages/class_approval_page.dart';
import '../../features/admin/presentation/pages/course_management_page.dart';
import '../../features/admin/presentation/pages/report_dashboard_page.dart';
import '../../features/admin/presentation/pages/training_program_admin_page.dart';
import '../../features/admin/presentation/pages/user_management_page.dart';
import '../../features/lecturer/presentation/pages/class_demand_page.dart';
import '../../features/lecturer/presentation/pages/class_student_list_page.dart';
import '../../features/lecturer/presentation/pages/course_class_management_page.dart';
import '../../features/lecturer/presentation/pages/create_course_class_page.dart';
import '../../features/lecturer/presentation/pages/lecturer_dashboard_page.dart';
import '../../features/lecturer/presentation/pages/lecturer_profile_page.dart';
import '../../features/lecturer/presentation/pages/lecturer_schedule_page.dart';
import '../../features/registration/presentation/pages/course_registration_dashboard_page.dart';
import '../../features/registration/presentation/pages/course_schedule_page.dart';
import '../../features/registration/presentation/pages/course_search_page.dart';
import '../../features/registration/presentation/pages/my_registered_courses_page.dart';
import '../../features/registration/presentation/pages/registration_confirmation_page.dart';
import '../../features/student/presentation/pages/student_home_page.dart';
import '../../features/student/presentation/pages/student_profile_page.dart';
import '../../features/student/presentation/pages/training_program_page.dart';
import '../../features/student/presentation/pages/transcript_page.dart';
import '../../features/sync/presentation/pages/sync_status_page.dart';

abstract final class AppRouter {
  static GoRouter create(AuthStateController auth) => GoRouter(
    initialLocation: '/splash',
    refreshListenable: auth,
    redirect: (context, state) {
      if (!auth.initialized) return '/splash';
      final publicRoutes = {'/login', '/forgot-password'};
      if (!auth.isAuthenticated) {
        return publicRoutes.contains(state.matchedLocation) ? null : '/login';
      }
      final home = _homeFor(auth.profile!.role);
      if (publicRoutes.contains(state.matchedLocation) ||
          state.matchedLocation == '/splash') {
        return home;
      }
      if (state.matchedLocation.startsWith('/student') &&
          auth.profile!.role != UserRole.student) {
        return home;
      }
      if (state.matchedLocation.startsWith('/lecturer') &&
          auth.profile!.role != UserRole.lecturer) {
        return home;
      }
      if (state.matchedLocation.startsWith('/admin') &&
          auth.profile!.role != UserRole.admin) {
        return home;
      }
      return null;
    },
    routes: [
      GoRoute(path: '/splash', builder: (_, _) => const SplashPage()),
      GoRoute(path: '/login', builder: (_, _) => const LoginPage()),
      GoRoute(path: '/sync', builder: (_, _) => const SyncStatusPage()),
      GoRoute(
        path: '/forgot-password',
        builder: (_, _) => const ForgotPasswordPage(),
      ),
      GoRoute(path: '/student', builder: (_, _) => const StudentHomePage()),
      GoRoute(
        path: '/student/profile',
        builder: (_, _) => const StudentProfilePage(),
      ),
      GoRoute(
        path: '/student/program',
        builder: (_, _) => const TrainingProgramPage(),
      ),
      GoRoute(
        path: '/student/transcript',
        builder: (_, _) => const TranscriptPage(),
      ),
      GoRoute(
        path: '/student/registration',
        builder: (_, _) => const CourseRegistrationDashboardPage(),
      ),
      GoRoute(
        path: '/student/registration/search',
        builder: (_, _) => const CourseSearchPage(),
      ),
      GoRoute(
        path: '/student/registration/confirm',
        builder: (_, state) => RegistrationConfirmationPage(
          courseClass: state.extra! as OpenCourseClassDto,
        ),
      ),
      GoRoute(
        path: '/student/registration/my-courses',
        builder: (_, _) => const MyRegisteredCoursesPage(),
      ),
      GoRoute(
        path: '/student/registration/schedule',
        builder: (_, _) => const CourseSchedulePage(),
      ),
      GoRoute(
        path: '/lecturer',
        builder: (_, _) => const LecturerDashboardPage(),
      ),
      GoRoute(
        path: '/lecturer/profile',
        builder: (_, _) => const LecturerProfilePage(),
      ),
      GoRoute(
        path: '/lecturer/classes',
        builder: (_, _) => const CourseClassManagementPage(),
      ),
      GoRoute(
        path: '/lecturer/classes/create',
        builder: (_, _) => const CreateCourseClassPage(),
      ),
      GoRoute(
        path: '/lecturer/classes/students',
        builder: (_, state) => ClassStudentListPage(
          courseClass: state.extra! as LecturerCourseClassDto,
        ),
      ),
      GoRoute(
        path: '/lecturer/schedule',
        builder: (_, _) => const LecturerSchedulePage(),
      ),
      GoRoute(
        path: '/lecturer/demand',
        builder: (_, _) => const ClassDemandPage(),
      ),
      GoRoute(
        path: '/admin',
        builder: (_, _) => const AdminDashboardPage(),
      ),
      GoRoute(
        path: '/admin/users',
        builder: (_, _) => const UserManagementPage(),
      ),
      GoRoute(
        path: '/admin/courses',
        builder: (_, _) => const CourseManagementPage(),
      ),
      GoRoute(
        path: '/admin/programs',
        builder: (_, _) => const TrainingProgramAdminPage(),
      ),
      GoRoute(
        path: '/admin/approvals',
        builder: (_, _) => const ClassApprovalPage(),
      ),
      GoRoute(
        path: '/admin/reports',
        builder: (_, _) => const ReportDashboardPage(),
      ),
      GoRoute(
        path: '/admin/audit',
        builder: (_, _) => const AuditLogPage(),
      ),
    ],
  );

  static String _homeFor(UserRole role) => switch (role) {
    UserRole.student => '/student',
    UserRole.lecturer => '/lecturer',
    UserRole.admin => '/admin',
  };
}
