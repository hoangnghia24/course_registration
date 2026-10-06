class ErrorHandler {
  static String message(Object error) {
    final raw = error.toString();
    if (raw.contains('Network') || raw.contains('Socket')) {
      return 'Không thể kết nối máy chủ. Vui lòng kiểm tra mạng.';
    }
    if (raw.contains('InvalidCredentials')) {
      return 'Email hoặc mật khẩu không chính xác.';
    }
    if (raw.contains('invalid_course')) {
      return 'Thông tin môn học không hợp lệ. Tín chỉ phải từ 1 đến 10.';
    }
    if (raw.contains('course_not_found')) {
      return 'Không tìm thấy môn học. Danh sách sẽ được tải lại.';
    }
    if (raw.contains('self_disable')) {
      return 'Bạn không thể vô hiệu hóa tài khoản đang đăng nhập.';
    }
    if (raw.contains('user_not_found')) {
      return 'Không tìm thấy người dùng. Danh sách sẽ được tải lại.';
    }
    if (raw.contains('email_exists')) {
      return 'Email này đã được cấp tài khoản.';
    }
    if (raw.contains('invalid_role_code')) {
      return 'Vui lòng nhập đúng mã sinh viên hoặc mã giảng viên.';
    }
    if (raw.contains('invalid_user')) {
      return 'Thông tin tài khoản không hợp lệ.';
    }
    if (raw.contains('class_has_students')) {
      return 'Không thể xóa vì lớp đang có sinh viên học.';
    }
    if (raw.contains('teaching_schedule_conflict')) {
      return 'Khung giờ này bị trùng với lịch dạy hiện có.';
    }
    if (raw.contains('room_schedule_conflict')) {
      return 'Phòng học đã được sử dụng trong khung giờ này.';
    }
    if (raw.contains('invalid_grade')) {
      return 'Điểm phải nằm trong khoảng từ 0 đến 10.';
    }
    return 'Đã xảy ra lỗi. Vui lòng thử lại.';
  }
}
