import 'package:course_registration_client/course_registration_client.dart';
import 'package:course_registration_flutter/core/network/error_handler.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  for (final entry in {
    'invalid_program': 'Thông tin chương trình không hợp lệ',
    'program_code_exists': 'Mã chương trình đã tồn tại',
    'program_major_year_exists': 'Ngành này đã có chương trình',
  }.entries) {
    test('program error ${entry.key} explains the failure', () {
      final error = AppException(code: entry.key, message: entry.key);
      expect(ErrorHandler.message(error), contains(entry.value));
    });
  }
}
