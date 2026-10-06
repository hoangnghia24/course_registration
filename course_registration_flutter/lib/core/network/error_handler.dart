class ErrorHandler {
  static String message(Object error) {
    final raw = error.toString();
    if (raw.contains('Network') || raw.contains('Socket')) {
      return 'Không thể kết nối máy chủ. Vui lòng kiểm tra mạng.';
    }
    if (raw.contains('InvalidCredentials')) {
      return 'Email hoặc mật khẩu không chính xác.';
    }
    return 'Đã xảy ra lỗi. Vui lòng thử lại.';
  }
}
