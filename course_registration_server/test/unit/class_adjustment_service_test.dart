import 'package:course_registration_server/src/generated/protocol.dart';
import 'package:course_registration_server/src/lecturer/services/class_adjustment_service.dart';
import 'package:test/test.dart';

void main() {
  final current = [
    ClassScheduleDto(dayOfWeek: 2, startPeriod: 1, endPeriod: 3, room: 'A101'),
    ClassScheduleDto(dayOfWeek: 4, startPeriod: 4, endPeriod: 6, room: 'A102'),
  ];

  test('capacity-only edit with the same schedule needs no conflict check', () {
    final proposed = [current.last, current.first];
    expect(
      ClassAdjustmentService.schedulesChanged(current, proposed),
      isFalse,
    );
  });

  test('changed time or room still requires conflict check', () {
    final changedTime = [
      ClassScheduleDto(
        dayOfWeek: 2,
        startPeriod: 2,
        endPeriod: 4,
        room: 'A101',
      ),
      current.last,
    ];
    final changedRoom = [
      ClassScheduleDto(
        dayOfWeek: 2,
        startPeriod: 1,
        endPeriod: 3,
        room: 'B201',
      ),
      current.last,
    ];
    expect(
      ClassAdjustmentService.schedulesChanged(current, changedTime),
      isTrue,
    );
    expect(
      ClassAdjustmentService.schedulesChanged(current, changedRoom),
      isTrue,
    );
  });
}
