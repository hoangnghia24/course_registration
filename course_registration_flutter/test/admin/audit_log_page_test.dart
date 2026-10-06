import 'package:course_registration_client/course_registration_client.dart';
import 'package:course_registration_flutter/features/admin/presentation/pages/audit_log_page.dart';
import 'package:course_registration_flutter/features/admin/presentation/providers/admin_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('audit history displays readable values instead of raw JSON', (
    tester,
  ) async {
    final log = AuditLogDto(
      id: UuidValue.withValidation('018f0000-0000-7000-8000-000000000301'),
      actorName: 'Phòng đào tạo',
      action: 'DISABLE_USER',
      entity: 'user',
      entityId: UuidValue.withValidation(
        '018f0000-0000-7000-8000-000000000302',
      ),
      oldValue:
          '{"__className__":"AppUser","id":"technical-id","fullName":"Nguyễn Văn A","isActive":true}',
      newValue: '{"__className__":"AppUser","isActive":false}',
      createdAt: DateTime.utc(2026, 10, 7, 3, 5),
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          auditLogProvider.overrideWith((ref) async => [log]),
        ],
        child: const MaterialApp(home: AuditLogPage()),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.textContaining('Họ tên: Nguyễn Văn A'), findsOneWidget);
    expect(
      find.textContaining('Trạng thái tài khoản: Đang hoạt động'),
      findsOneWidget,
    );
    expect(find.text('Trạng thái tài khoản: Đã vô hiệu hóa'), findsOneWidget);
    expect(find.textContaining('technical-id'), findsNothing);
    expect(find.textContaining('className'), findsNothing);
    expect(find.textContaining('{"'), findsNothing);
  });
}
