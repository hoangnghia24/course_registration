abstract final class ConflictResolver {
  static String localStatus(String serverStatus, String? errorCode) {
    if (serverStatus == 'CONFLICT' || errorCode == 'VERSION_CONFLICT') {
      return 'CONFLICT';
    }
    if (serverStatus == 'AUTH_REQUIRED' || errorCode == 'AUTH_REQUIRED') {
      return 'AUTH_REQUIRED';
    }
    if (serverStatus == 'SYNCED') return 'SYNCED';
    return 'FAILED';
  }

  static String userMessage(String? code, String? fallback) => switch (code) {
    'CLASS_FULL' =>
      'Lớp học phần đã đủ sĩ số. Yêu cầu đăng ký của bạn không được chấp nhận.',
    'PREREQUISITE_NOT_MET' => 'Bạn chưa đáp ứng điều kiện tiên quyết.',
    'SCHEDULE_CONFLICT' => 'Học phần bị trùng lịch với lịch hiện tại.',
    'CREDIT_LIMIT_EXCEEDED' => 'Yêu cầu vượt quá giới hạn tín chỉ.',
    'AUTH_REQUIRED' => 'Cần đăng nhập lại để tiếp tục đồng bộ.',
    'VERSION_CONFLICT' => 'Dữ liệu máy chủ đã thay đổi. Đã giữ bản máy chủ.',
    _ => fallback ?? 'Không thể đồng bộ thao tác.',
  };
}
