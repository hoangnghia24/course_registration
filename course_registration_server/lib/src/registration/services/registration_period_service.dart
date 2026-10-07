import 'package:serverpod/serverpod.dart';

import '../../generated/protocol.dart';

class RegistrationWindow {
  const RegistrationWindow({
    required this.semester,
    required this.startTime,
    required this.endTime,
    required this.lecturerStartTime,
    required this.lecturerEndTime,
    required this.status,
    required this.configured,
    this.registrationPeriodId,
  });

  final Semester semester;
  final UuidValue? registrationPeriodId;
  final DateTime startTime;
  final DateTime endTime;
  final DateTime lecturerStartTime;
  final DateTime lecturerEndTime;
  final RegistrationPeriodStatus status;
  final bool configured;

  bool isOpenAt(DateTime value) {
    final now = value.toUtc();
    return configured &&
        status == RegistrationPeriodStatus.active &&
        semester.status == SemesterStatus.open &&
        !now.isBefore(startTime.toUtc()) &&
        !now.isAfter(endTime.toUtc());
  }

  bool isLecturerOpenAt(DateTime value) {
    final now = value.toUtc();
    return configured &&
        status == RegistrationPeriodStatus.active &&
        semester.status == SemesterStatus.open &&
        !now.isBefore(lecturerStartTime.toUtc()) &&
        !now.isAfter(lecturerEndTime.toUtc());
  }

  RegistrationPeriodDto toDto(DateTime now) => RegistrationPeriodDto(
    registrationPeriodId: registrationPeriodId,
    semesterId: semester.id!,
    semesterName: semester.name,
    academicYear: semester.academicYear,
    startTime: startTime.toUtc(),
    endTime: endTime.toUtc(),
    lecturerStartTime: lecturerStartTime.toUtc(),
    lecturerEndTime: lecturerEndTime.toUtc(),
    status: status,
    configured: configured,
    isOpen: isOpenAt(now),
    isLecturerOpen: isLecturerOpenAt(now),
  );
}

abstract final class RegistrationPeriodService {
  static Future<RegistrationWindow> getWindow(
    Session session, {
    required UuidValue semesterId,
    Transaction? transaction,
  }) async {
    final semester = await Semester.db.findById(
      session,
      semesterId,
      transaction: transaction,
    );
    if (semester == null || semester.id == null) {
      throw AppException(
        code: 'semester_not_found',
        message: 'Học kỳ không tồn tại.',
      );
    }
    final period = await RegistrationPeriod.db.findFirstRow(
      session,
      transaction: transaction,
      where: (table) => table.semesterId.equals(semesterId),
    );
    return RegistrationWindow(
      semester: semester,
      registrationPeriodId: period?.id,
      startTime: (period?.startTime ?? semester.startDate).toUtc(),
      endTime: (period?.endTime ?? semester.endDate).toUtc(),
      lecturerStartTime: (period?.lecturerStartTime ?? semester.startDate)
          .toUtc(),
      lecturerEndTime: (period?.lecturerEndTime ?? semester.endDate).toUtc(),
      status: period?.status ?? RegistrationPeriodStatus.draft,
      configured: period != null,
    );
  }

  static Future<RegistrationPeriodDto> getDto(
    Session session, {
    required UuidValue semesterId,
    Transaction? transaction,
    DateTime? now,
  }) async {
    final window = await getWindow(
      session,
      semesterId: semesterId,
      transaction: transaction,
    );
    return window.toDto(now ?? DateTime.now().toUtc());
  }

  static Future<void> requireOpen(
    Session session, {
    required UuidValue semesterId,
    Transaction? transaction,
    DateTime? now,
  }) async {
    final window = await getWindow(
      session,
      semesterId: semesterId,
      transaction: transaction,
    );
    final current = (now ?? DateTime.now()).toUtc();
    if (!window.configured || window.status == RegistrationPeriodStatus.draft) {
      throw AppException(
        code: 'registration_not_started',
        message: 'Chưa đến thời gian đăng ký học phần.',
      );
    }
    if (window.status == RegistrationPeriodStatus.closed ||
        window.semester.status != SemesterStatus.open) {
      throw AppException(
        code: 'registration_closed',
        message: 'Thời gian đăng ký học phần đã kết thúc.',
      );
    }
    if (current.isBefore(window.startTime.toUtc())) {
      throw AppException(
        code: 'registration_not_started',
        message: 'Chưa đến thời gian đăng ký học phần.',
      );
    }
    if (current.isAfter(window.endTime.toUtc())) {
      throw AppException(
        code: 'registration_ended',
        message: 'Thời gian đăng ký học phần đã kết thúc.',
      );
    }
  }

  static Future<void> requireLecturerOpen(
    Session session, {
    required UuidValue semesterId,
    Transaction? transaction,
    DateTime? now,
  }) async {
    final window = await getWindow(
      session,
      semesterId: semesterId,
      transaction: transaction,
    );
    final current = (now ?? DateTime.now()).toUtc();
    if (!window.configured ||
        window.status != RegistrationPeriodStatus.active ||
        window.semester.status != SemesterStatus.open ||
        current.isBefore(window.lecturerStartTime.toUtc()) ||
        current.isAfter(window.lecturerEndTime.toUtc())) {
      throw AppException(
        code: 'lecturer_editing_closed',
        message: 'Ngoài thời gian chỉnh sửa lớp học phần của giảng viên.',
      );
    }
  }
}
