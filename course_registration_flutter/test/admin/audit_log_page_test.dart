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

  testWidgets('nested audit data is localized and fits a phone screen', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final log = AuditLogDto(
      id: UuidValue.withValidation('018f0000-0000-7000-8000-000000000303'),
      actorName: 'Nguyễn Hoàng Minh',
      action: 'APPROVE_CLASS_ADJUSTMENT',
      entity: 'class_adjustment_request',
      entityId: UuidValue.withValidation(
        '018f0000-0000-7000-8000-000000000304',
      ),
      oldValue: '{"capacity":30}',
      newValue:
          '{"capacity":35,"schedules":[{"__className__":"ClassScheduleDto","dayOfWeek":6,"startPeriod":7,"endPeriod":9,"room":"LAB-02"}],"status":"approved"}',
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

    expect(find.text('Duyệt yêu cầu điều chỉnh lớp'), findsOneWidget);
    expect(find.textContaining('Lịch học:'), findsOneWidget);
    expect(find.textContaining('Thứ: Thứ Bảy'), findsOneWidget);
    expect(find.textContaining('Trạng thái: Đã duyệt'), findsOneWidget);
    expect(find.textContaining('ClassScheduleDto'), findsNothing);
    expect(tester.takeException(), isNull);
  });
}
