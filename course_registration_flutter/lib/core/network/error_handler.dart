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
    return 'Đã xảy ra lỗi. Vui lòng thử lại.';
  }
}
