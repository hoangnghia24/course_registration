import 'package:course_registration_client/course_registration_client.dart';

abstract final class AppLabels {
  static String userRole(UserRole role) => switch (role) {
    UserRole.student => 'Sinh viên',
    UserRole.lecturer => 'Giảng viên',
    UserRole.admin => 'Quản trị viên',
  };

  static String courseType(CourseType type) => switch (type) {
    CourseType.compulsory => 'Bắt buộc',
    CourseType.elective => 'Tự chọn',
  };

  static String courseClassStatus(CourseClassStatus status) => switch (status) {
    CourseClassStatus.open => 'Đang mở',
    CourseClassStatus.full => 'Đã đầy',
    CourseClassStatus.closed => 'Đã đóng',
  };

  static String teachingScheduleStatus(TeachingScheduleStatus status) =>
      switch (status) {
        TeachingScheduleStatus.pending => 'Chờ duyệt',
        TeachingScheduleStatus.approved => 'Đã duyệt',
        TeachingScheduleStatus.rejected => 'Đã từ chối',
      };

  static String syncStatus(String status) => switch (status) {
    'PENDING' => 'Đang chờ',
    'SYNCING' => 'Đang đồng bộ',
    'SYNCED' => 'Đã đồng bộ',
    'FAILED' => 'Thất bại',
    'CONFLICT' => 'Xung đột',
    'AUTH_REQUIRED' => 'Cần đăng nhập lại',
    'CANCELLED' => 'Đã hủy',
    _ => _readableFallback(status),
  };

  static String action(String action) => switch (action) {
    'REGISTER_COURSE' => 'Đăng ký học phần',
    'CANCEL_COURSE' => 'Hủy đăng ký học phần',
    'CREATE_USER' => 'Tạo tài khoản',
    'UPDATE_USER' => 'Cập nhật tài khoản',
    'DISABLE_USER' => 'Vô hiệu hóa tài khoản',
    'CREATE_COURSE' => 'Tạo môn học',
    'UPDATE_COURSE' => 'Cập nhật môn học',
    'DELETE_COURSE' => 'Xóa môn học',
    'CREATE_PROGRAM' => 'Tạo chương trình đào tạo',
    'UPDATE_PROGRAM' => 'Cập nhật chương trình đào tạo',
    'CREATE_CLASS' => 'Tạo lớp học phần',
    'UPDATE_CLASS' => 'Cập nhật lớp học phần',
    'DELETE_CLASS' => 'Xóa lớp học phần',
    'UPDATE_SCHEDULE' => 'Cập nhật lịch học',
    'CREATE_SCHEDULE_PROPOSAL' => 'Đề xuất lịch học',
    'CREATE_REGISTRATION' => 'Tạo đăng ký học phần',
    _ => _readableFallback(action),
  };

  static String _readableFallback(String value) {
    if (value.trim().isEmpty) return 'Không xác định';
    final words = value.toLowerCase().split('_');
    return words
        .map(
          (word) => word.isEmpty
              ? word
              : '${word[0].toUpperCase()}${word.substring(1)}',
        )
        .join(' ');
  }
}
