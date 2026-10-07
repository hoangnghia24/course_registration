import 'dart:convert';

import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart';
import 'package:serverpod_auth_idp_server/providers/email.dart';

import '../../auth/app_scopes.dart';
import '../../core/input_validator.dart';
import '../../core/pagination.dart';
import '../../generated/protocol.dart';
import '../../lecturer/services/class_adjustment_service.dart';
import '../../lecturer/services/lecturer_service.dart';
import '../../registration/services/registration_period_service.dart';
import 'admin_permission_service.dart';
import 'analytics_service.dart';
import 'approval_workflow.dart';
import 'audit_service.dart';

typedef AdminContext = ({Admin admin, AppUser user});

abstract final class AdminService {
  static Future<AdminContext> context(Session session) async {
    final authUserId = session.authenticated?.authUserId;
    if (authUserId == null) {
      throw _error('unauthenticated', 'Vui lòng đăng nhập.');
    }
    final user = await AppUser.db.findFirstRow(
      session,
      where: (table) => table.authUserId.equals(authUserId),
    );
    if (user?.id == null || !user!.isActive) {
      throw _error('account_disabled', 'Tài khoản không hoạt động.');
    }
    final admin = await Admin.db.findFirstRow(
      session,
      where: (table) => table.userId.equals(user.id),
    );
    if (admin?.id == null) {
      throw _error('admin_not_found', 'Không tìm thấy admin.');
    }
    return (admin: admin!, user: user);
  }

  static Future<List<AdminUserDto>> getUsers(
    Session session, {
    int page = 1,
    int pageSize = 50,
  }) async {
    final ctx = await context(session);
    await AdminPermissionService.require(session, ctx.admin, 'MANAGE_USER');
    final window = Pagination.window(page: page, pageSize: pageSize);
    final users = await AppUser.db.find(
      session,
      orderBy: (table) => table.fullName,
      limit: window.limit,
      offset: window.offset,
    );
    final result = await _userDtos(session, users);
    result.sort((a, b) => a.fullName.compareTo(b.fullName));
    return result;
  }

  static Future<AdminUserDto> createUser(
    Session session, {
    required String email,
    required String password,
    required String fullName,
    required UserRole role,
    String? phone,
    int? academicYear,
    UuidValue? majorId,
    UuidValue? trainingProgramId,
  }) async {
    final ctx = await context(session);
    await AdminPermissionService.require(session, ctx.admin, 'MANAGE_USER');
    if (!InputValidator.email(email) ||
        !InputValidator.requiredText(fullName, maxLength: 120) ||
        password.length < 8 ||
        password.length > 128 ||
        !_validPhone(phone) ||
        (academicYear != null && !InputValidator.academicYear(academicYear))) {
      throw _error('invalid_user', 'Thông tin người dùng không hợp lệ.');
    }
    final normalizedEmail = email.trim().toLowerCase();
    final existing = await AppUser.db.findFirstRow(
      session,
      where: (table) => table.email.equals(normalizedEmail),
    );
    if (existing != null) {
      throw _error('email_exists', 'Email đã được cấp tài khoản.');
    }
    return session.db.transaction((transaction) async {
      final scope = switch (role) {
        UserRole.student => AppScopes.student,
        UserRole.lecturer => AppScopes.lecturer,
        UserRole.admin => AppScopes.admin,
      };
      final authUser = await AuthServices.instance.authUsers.create(
        session,
        scopes: {scope},
        transaction: transaction,
      );
      await AuthServices.getIdentityProvider<EmailIdp>().admin
          .createEmailAuthentication(
            session,
            authUserId: authUser.id,
            email: normalizedEmail,
            password: password,
            transaction: transaction,
          );
      final user = await AppUser.db.insertRow(
        session,
        AppUser(
          authUserId: authUser.id,
          email: normalizedEmail,
          fullName: fullName.trim(),
          phone: _normalizedPhone(phone),
          role: role,
          isActive: true,
        ),
        transaction: transaction,
      );
      switch (role) {
        case UserRole.student:
          await Student.db.insertRow(
            session,
            Student(
              userId: user.id!,
              studentCode: _automaticRoleCode(UserRole.student, user.id!),
              majorId: majorId,
              trainingProgramId: trainingProgramId,
              academicYear: academicYear ?? DateTime.now().year,
              enrollmentYear: academicYear ?? DateTime.now().year,
              currentSemester: 1,
            ),
            transaction: transaction,
          );
        case UserRole.lecturer:
          await Lecturer.db.insertRow(
            session,
            Lecturer(
              userId: user.id!,
              lecturerCode: _automaticRoleCode(UserRole.lecturer, user.id!),
            ),
            transaction: transaction,
          );
        case UserRole.admin:
          await Admin.db.insertRow(
            session,
            Admin(userId: user.id!),
            transaction: transaction,
          );
      }
      await AuditService.log(
        session,
        actor: ctx.user,
        action: 'CREATE_USER',
        entity: 'user',
        entityId: user.id!,
        newValue: jsonEncode(user.toJson()),
        transaction: transaction,
      );
      return _userDto(session, user, transaction: transaction);
    });
  }

  static Future<AdminUserDto> updateUser(
    Session session, {
    required UuidValue userId,
    required String fullName,
    String? phone,
  }) async {
    final ctx = await context(session);
    await AdminPermissionService.require(session, ctx.admin, 'MANAGE_USER');
    final user = await AppUser.db.findById(session, userId);
    if (user == null) {
      throw _error('user_not_found', 'Không tìm thấy người dùng.');
    }
    if (!InputValidator.requiredText(fullName, maxLength: 120) ||
        !_validPhone(phone)) {
      throw _error('invalid_user', 'Thông tin người dùng không hợp lệ.');
    }
    final old = jsonEncode(user.toJson());
    final updated = await AppUser.db.updateRow(
      session,
      user.copyWith(
        fullName: fullName.trim(),
        phone: _normalizedPhone(phone),
        updatedAt: DateTime.now().toUtc(),
      ),
    );
    await AuditService.log(
      session,
      actor: ctx.user,
      action: 'UPDATE_USER',
      entity: 'user',
      entityId: userId,
      oldValue: old,
      newValue: jsonEncode(updated.toJson()),
    );
    return _userDto(session, updated);
  }

  static Future<bool> disableUser(Session session, UuidValue userId) async {
    final ctx = await context(session);
    await AdminPermissionService.require(session, ctx.admin, 'MANAGE_USER');
    if (ctx.user.id == userId) {
      throw _error('self_disable', 'Không thể vô hiệu hóa chính mình.');
    }
    final user = await AppUser.db.findById(session, userId);
    if (user == null) {
      throw _error('user_not_found', 'Không tìm thấy người dùng.');
    }
    await AppUser.db.updateRow(
      session,
      user.copyWith(isActive: false, updatedAt: DateTime.now().toUtc()),
    );
    await AuditService.log(
      session,
      actor: ctx.user,
      action: 'DISABLE_USER',
      entity: 'user',
      entityId: userId,
      oldValue: jsonEncode({'isActive': user.isActive}),
      newValue: jsonEncode({'isActive': false}),
    );
    return true;
  }

  static Future<bool> enableUser(Session session, UuidValue userId) async {
    final ctx = await context(session);
    await AdminPermissionService.require(session, ctx.admin, 'MANAGE_USER');
    final user = await AppUser.db.findById(session, userId);
    if (user == null) {
      throw _error('user_not_found', 'Không tìm thấy người dùng.');
    }
    if (user.isActive) return true;
    await AppUser.db.updateRow(
      session,
      user.copyWith(isActive: true, updatedAt: DateTime.now().toUtc()),
    );
    await AuditService.log(
      session,
      actor: ctx.user,
      action: 'ENABLE_USER',
      entity: 'user',
      entityId: userId,
      oldValue: jsonEncode({'isActive': false}),
      newValue: jsonEncode({'isActive': true}),
    );
    return true;
  }

  static Future<List<Course>> getCourses(
    Session session, {
    int page = 1,
    int pageSize = 50,
  }) async {
    final ctx = await context(session);
    await AdminPermissionService.require(session, ctx.admin, 'MANAGE_COURSE');
    final window = Pagination.window(page: page, pageSize: pageSize);
    return Course.db.find(
      session,
      orderBy: (table) => table.courseCode,
      limit: window.limit,
      offset: window.offset,
    );
  }

  static Future<Course> createCourse(
    Session session, {
    required String courseName,
    required int credits,
    required CourseType courseType,
    String? description,
    UuidValue? categoryId,
  }) async {
    final ctx = await context(session);
    await AdminPermissionService.require(session, ctx.admin, 'MANAGE_COURSE');
    if (!InputValidator.requiredText(courseName, maxLength: 200) ||
        !InputValidator.optionalText(description, maxLength: 2000) ||
        credits < 1 ||
        credits > 10) {
      throw _error(
        'invalid_course',
        'Thông tin môn học không hợp lệ. Tín chỉ phải từ 1 đến 10.',
      );
    }
    final value = await Course.db.insertRow(
      session,
      Course(
        courseCode: _automaticCourseCode(),
        courseName: courseName.trim(),
        credits: credits,
        description: description,
        courseType: courseType,
        categoryId: categoryId,
      ),
    );
    await AuditService.log(
      session,
      actor: ctx.user,
      action: 'CREATE_COURSE',
      entity: 'course',
      entityId: value.id!,
      newValue: jsonEncode(value.toJson()),
    );
    return value;
  }

  static Future<Course> updateCourse(
    Session session, {
    required UuidValue courseId,
    required String courseCode,
    required String courseName,
    required int credits,
    required CourseType courseType,
    String? description,
    UuidValue? categoryId,
  }) async {
    final ctx = await context(session);
    await AdminPermissionService.require(session, ctx.admin, 'MANAGE_COURSE');
    final value = await Course.db.findById(session, courseId);
    if (value == null) {
      throw _error('course_not_found', 'Không tìm thấy môn học.');
    }
    if (!InputValidator.requiredText(courseCode, maxLength: 32) ||
        !InputValidator.requiredText(courseName, maxLength: 200) ||
        !InputValidator.optionalText(description, maxLength: 2000) ||
        credits < 1 ||
        credits > 10) {
      throw _error(
        'invalid_course',
        'Thông tin môn học không hợp lệ. Tín chỉ phải từ 1 đến 10.',
      );
    }
    final old = jsonEncode(value.toJson());
    final updated = await Course.db.updateRow(
      session,
      value.copyWith(
        courseCode: courseCode.trim(),
        courseName: courseName.trim(),
        credits: credits,
        description: description,
        courseType: courseType,
        categoryId: categoryId,
        updatedAt: DateTime.now().toUtc(),
      ),
    );
    await AuditService.log(
      session,
      actor: ctx.user,
      action: 'UPDATE_COURSE',
      entity: 'course',
      entityId: courseId,
      oldValue: old,
      newValue: jsonEncode(updated.toJson()),
    );
    return updated;
  }

  static Future<bool> deleteCourse(Session session, UuidValue courseId) async {
    final ctx = await context(session);
    await AdminPermissionService.require(session, ctx.admin, 'MANAGE_COURSE');
    final value = await Course.db.findById(session, courseId);
    if (value == null) return false;
    await Course.db.deleteRow(session, value);
    await AuditService.log(
      session,
      actor: ctx.user,
      action: 'DELETE_COURSE',
      entity: 'course',
      entityId: courseId,
      oldValue: jsonEncode(value.toJson()),
    );
    return true;
  }

  static Future<List<TrainingProgram>> getTrainingPrograms(
    Session session,
  ) async {
    final ctx = await context(session);
    await AdminPermissionService.require(session, ctx.admin, 'MANAGE_PROGRAM');
    return TrainingProgram.db.find(session);
  }

  static Future<List<Major>> getMajors(Session session) async {
    final ctx = await context(session);
    await AdminPermissionService.require(session, ctx.admin, 'MANAGE_PROGRAM');
    return Major.db.find(session);
  }

  static Future<List<TrainingProgramCourse>> getProgramCourses(
    Session session,
    UuidValue programId,
  ) async {
    final ctx = await context(session);
    await AdminPermissionService.require(session, ctx.admin, 'MANAGE_PROGRAM');
    return TrainingProgramCourse.db.find(
      session,
      where: (table) => table.trainingProgramId.equals(programId),
    );
  }

  static Future<List<CoursePrerequisite>> getPrerequisites(
    Session session,
  ) async {
    final ctx = await context(session);
    await AdminPermissionService.require(session, ctx.admin, 'MANAGE_COURSE');
    return CoursePrerequisite.db.find(session);
  }

  static Future<List<CourseEquivalent>> getEquivalents(Session session) async {
    final ctx = await context(session);
    await AdminPermissionService.require(session, ctx.admin, 'MANAGE_COURSE');
    return CourseEquivalent.db.find(session);
  }

  static Future<TrainingProgram> createTrainingProgram(
    Session session, {
    required UuidValue majorId,
    required String code,
    required String name,
    required int academicYear,
    required int totalCredits,
    required int semesterCount,
    required TrainingProgramStatus status,
    String? description,
  }) async {
    final ctx = await context(session);
    await AdminPermissionService.require(session, ctx.admin, 'MANAGE_PROGRAM');
    if (!InputValidator.programCode(code) ||
        !InputValidator.requiredText(name, maxLength: 200) ||
        !InputValidator.academicYear(academicYear) ||
        !InputValidator.totalCredits(totalCredits) ||
        !InputValidator.semesterCount(semesterCount) ||
        !InputValidator.optionalText(description, maxLength: 2000)) {
      throw _error('invalid_program', 'Thông tin chương trình không hợp lệ.');
    }
    final value = await TrainingProgram.db.insertRow(
      session,
      TrainingProgram(
        majorId: majorId,
        code: code.trim().toUpperCase(),
        name: name.trim(),
        academicYear: academicYear,
        totalCredits: totalCredits,
        semesterCount: semesterCount,
        status: status,
        description: description,
      ),
    );
    await _auditCreate(
      session,
      ctx.user,
      'CREATE_PROGRAM',
      'training_program',
      value.id!,
      value.toJson(),
    );
    return value;
  }

  static Future<TrainingProgram> updateTrainingProgram(
    Session session, {
    required UuidValue programId,
    required String code,
    required String name,
    required int academicYear,
    required int totalCredits,
    required int semesterCount,
    required TrainingProgramStatus status,
    String? description,
  }) async {
    final ctx = await context(session);
    await AdminPermissionService.require(session, ctx.admin, 'MANAGE_PROGRAM');
    final value = await TrainingProgram.db.findById(session, programId);
    if (value == null) {
      throw _error('program_not_found', 'Không tìm thấy chương trình.');
    }
    if (!InputValidator.programCode(code) ||
        !InputValidator.requiredText(name, maxLength: 200) ||
        !InputValidator.academicYear(academicYear) ||
        !InputValidator.totalCredits(totalCredits) ||
        !InputValidator.semesterCount(semesterCount) ||
        !InputValidator.optionalText(description, maxLength: 2000)) {
      throw _error('invalid_program', 'Thông tin chương trình không hợp lệ.');
    }
    final old = jsonEncode(value.toJson());
    final updated = await TrainingProgram.db.updateRow(
      session,
      value.copyWith(
        code: code.trim().toUpperCase(),
        name: name.trim(),
        academicYear: academicYear,
        totalCredits: totalCredits,
        semesterCount: semesterCount,
        status: status,
        description: description,
        updatedAt: DateTime.now().toUtc(),
      ),
    );
    await AuditService.log(
      session,
      actor: ctx.user,
      action: 'UPDATE_PROGRAM',
      entity: 'training_program',
      entityId: programId,
      oldValue: old,
      newValue: jsonEncode(updated.toJson()),
    );
    return updated;
  }

  static Future<TrainingProgramCourse> setProgramCourse(
    Session session, {
    required UuidValue programId,
    required UuidValue courseId,
    required int semesterNumber,
    required bool isRequired,
  }) async {
    final ctx = await context(session);
    await AdminPermissionService.require(session, ctx.admin, 'MANAGE_PROGRAM');
    final program = await TrainingProgram.db.findById(session, programId);
    final course = await Course.db.findById(session, courseId);
    if (program == null || course == null) {
      throw _error(
        'program_course_not_found',
        'Chương trình hoặc môn học không tồn tại.',
      );
    }
    if (!InputValidator.semesterNumber(semesterNumber) ||
        semesterNumber > program.semesterCount) {
      throw _error('invalid_semester', 'Học kỳ chương trình không hợp lệ.');
    }
    final existing = await TrainingProgramCourse.db.findFirstRow(
      session,
      where: (table) =>
          table.trainingProgramId.equals(programId) &
          table.courseId.equals(courseId),
    );
    final value = existing == null
        ? await TrainingProgramCourse.db.insertRow(
            session,
            TrainingProgramCourse(
              trainingProgramId: programId,
              courseId: courseId,
              semesterNumber: semesterNumber,
              isRequired: isRequired,
            ),
          )
        : await TrainingProgramCourse.db.updateRow(
            session,
            existing.copyWith(
              semesterNumber: semesterNumber,
              isRequired: isRequired,
            ),
          );
    await _auditCreate(
      session,
      ctx.user,
      'SET_PROGRAM_COURSE',
      'training_program_course',
      value.id!,
      value.toJson(),
    );
    return value;
  }

  static Future<CoursePrerequisite> addPrerequisite(
    Session session,
    UuidValue courseId,
    UuidValue requiredId,
  ) async {
    final ctx = await context(session);
    await AdminPermissionService.require(session, ctx.admin, 'MANAGE_COURSE');
    if (courseId == requiredId ||
        await _createsCycle(session, courseId, requiredId)) {
      throw _error(
        'prerequisite_cycle',
        'Quan hệ tiên quyết tạo thành chu trình.',
      );
    }
    final value = await CoursePrerequisite.db.insertRow(
      session,
      CoursePrerequisite(courseId: courseId, prerequisiteId: requiredId),
    );
    await _auditCreate(
      session,
      ctx.user,
      'ADD_PREREQUISITE',
      'course_prerequisite',
      value.id!,
      value.toJson(),
    );
    return value;
  }

  static Future<bool> removePrerequisite(Session session, UuidValue id) async {
    final ctx = await context(session);
    await AdminPermissionService.require(session, ctx.admin, 'MANAGE_COURSE');
    final value = await CoursePrerequisite.db.findById(session, id);
    if (value == null) return false;
    await CoursePrerequisite.db.deleteRow(session, value);
    await AuditService.log(
      session,
      actor: ctx.user,
      action: 'REMOVE_PREREQUISITE',
      entity: 'course_prerequisite',
      entityId: id,
      oldValue: jsonEncode(value.toJson()),
    );
    return true;
  }

  static Future<CourseEquivalent> addEquivalent(
    Session session,
    UuidValue courseId,
    UuidValue equivalentId,
  ) async {
    final ctx = await context(session);
    await AdminPermissionService.require(session, ctx.admin, 'MANAGE_COURSE');
    if (courseId == equivalentId) {
      throw _error(
        'invalid_equivalent',
        'Môn học không thể tương đương chính nó.',
      );
    }
    final existing = await CourseEquivalent.db.findFirstRow(
      session,
      where: (table) =>
          (table.courseId.equals(courseId) &
              table.equivalentId.equals(equivalentId)) |
          (table.courseId.equals(equivalentId) &
              table.equivalentId.equals(courseId)),
    );
    if (existing != null) return existing;
    final value = await CourseEquivalent.db.insertRow(
      session,
      CourseEquivalent(courseId: courseId, equivalentId: equivalentId),
    );
    await _auditCreate(
      session,
      ctx.user,
      'ADD_EQUIVALENT',
      'course_equivalent',
      value.id!,
      value.toJson(),
    );
    return value;
  }

  static Future<bool> removeEquivalent(Session session, UuidValue id) async {
    final ctx = await context(session);
    await AdminPermissionService.require(session, ctx.admin, 'MANAGE_COURSE');
    final value = await CourseEquivalent.db.findById(session, id);
    if (value == null) return false;
    await CourseEquivalent.db.deleteRow(session, value);
    await AuditService.log(
      session,
      actor: ctx.user,
      action: 'REMOVE_EQUIVALENT',
      entity: 'course_equivalent',
      entityId: id,
      oldValue: jsonEncode(value.toJson()),
    );
    return true;
  }

  static Future<List<PendingClassApprovalDto>> getPendingClasses(
    Session session,
  ) async {
    final ctx = await context(session);
    await AdminPermissionService.require(session, ctx.admin, 'APPROVE_CLASS');
    final classes = await CourseClass.db.find(
      session,
      where: (table) => table.status.equals(CourseClassStatus.closed),
    );
    final result = <PendingClassApprovalDto>[];
    for (final value in classes) {
      final proposals = await TeachingScheduleProposal.db.find(
        session,
        where: (table) =>
            table.courseClassId.equals(value.id) &
            table.status.equals(TeachingScheduleStatus.pending),
      );
      if (proposals.isEmpty) continue;
      final course = await Course.db.findById(session, value.courseId);
      final lecturer = await Lecturer.db.findById(session, value.lecturerId);
      final user = lecturer == null
          ? null
          : await AppUser.db.findById(session, lecturer.userId);
      if (course == null) continue;
      result.add(
        PendingClassApprovalDto(
          courseClassId: value.id!,
          classCode: value.classCode,
          courseCode: course.courseCode,
          courseName: course.courseName,
          lecturerName: user?.fullName ?? 'Chưa cập nhật',
          capacity: value.capacity,
          proposals: proposals,
        ),
      );
    }
    return result;
  }

  static Future<ClassApproval> decideClass(
    Session session,
    UuidValue courseClassId,
    bool approve,
    String? comment,
  ) async {
    final ctx = await context(session);
    await AdminPermissionService.require(session, ctx.admin, 'APPROVE_CLASS');
    return session.db.transaction((transaction) async {
      final courseClass = await CourseClass.db.findById(
        session,
        courseClassId,
        transaction: transaction,
        lockMode: LockMode.forUpdate,
      );
      if (courseClass == null) {
        throw _error('class_not_found', 'Không tìm thấy lớp.');
      }
      final status = ApprovalWorkflow.resolve(approve: approve);
      final existing = await ClassApproval.db.findFirstRow(
        session,
        transaction: transaction,
        where: (table) => table.courseClassId.equals(courseClassId),
      );
      final approval = existing == null
          ? await ClassApproval.db.insertRow(
              session,
              ClassApproval(
                courseClassId: courseClassId,
                adminId: ctx.admin.id!,
                status: status,
                comment: comment,
              ),
              transaction: transaction,
            )
          : await ClassApproval.db.updateRow(
              session,
              existing.copyWith(
                adminId: ctx.admin.id!,
                status: status,
                comment: comment,
                createdAt: DateTime.now().toUtc(),
              ),
              transaction: transaction,
            );
      await CourseClass.db.updateRow(
        session,
        courseClass.copyWith(status: ApprovalWorkflow.classStatus(status)),
        transaction: transaction,
      );
      final proposals = await TeachingScheduleProposal.db.find(
        session,
        transaction: transaction,
        where: (table) =>
            table.courseClassId.equals(courseClassId) &
            table.status.equals(TeachingScheduleStatus.pending),
      );
      if (approve) {
        await ClassSchedule.db.deleteWhere(
          session,
          where: (table) => table.courseClassId.equals(courseClassId),
          transaction: transaction,
        );
      }
      for (final proposal in proposals) {
        await TeachingScheduleProposal.db.updateRow(
          session,
          proposal.copyWith(
            status: approve
                ? TeachingScheduleStatus.approved
                : TeachingScheduleStatus.rejected,
          ),
          transaction: transaction,
        );
        if (approve) {
          await ClassSchedule.db.insertRow(
            session,
            ClassSchedule(
              courseClassId: courseClassId,
              dayOfWeek: proposal.dayOfWeek,
              startPeriod: proposal.startPeriod,
              endPeriod: proposal.endPeriod,
              room: proposal.room,
            ),
            transaction: transaction,
          );
        }
      }
      final openingRequests = await CourseOpeningRequest.db.find(
        session,
        transaction: transaction,
        where: (table) =>
            table.courseId.equals(courseClass.courseId) &
            table.status.equals(OpeningRequestStatus.pending),
      );
      for (final request in openingRequests) {
        await CourseOpeningRequest.db.updateRow(
          session,
          request.copyWith(
            status: approve
                ? OpeningRequestStatus.approved
                : OpeningRequestStatus.rejected,
          ),
          transaction: transaction,
        );
      }
      await AuditService.log(
        session,
        actor: ctx.user,
        action: approve ? 'APPROVE_CLASS' : 'REJECT_CLASS',
        entity: 'course_class',
        entityId: courseClassId,
        oldValue: jsonEncode({'status': courseClass.status.name}),
        newValue: jsonEncode({'status': status.name, 'comment': comment}),
        transaction: transaction,
      );
      return approval;
    });
  }

  static Future<List<CourseOpeningRequest>> getOpeningRequests(
    Session session,
  ) async {
    final ctx = await context(session);
    await AdminPermissionService.require(session, ctx.admin, 'APPROVE_CLASS');
    return CourseOpeningRequest.db.find(session);
  }

  static Future<List<ClassAdjustmentRequestDto>> getAdjustmentRequests(
    Session session, {
    ClassAdjustmentStatus? status,
  }) async {
    final ctx = await context(session);
    await AdminPermissionService.require(session, ctx.admin, 'APPROVE_CLASS');
    final requests = await ClassAdjustmentRequest.db.find(
      session,
      where: status == null ? null : (table) => table.status.equals(status),
      orderBy: (table) => table.createdAt.desc(),
    );
    final result = <ClassAdjustmentRequestDto>[];
    for (final request in requests) {
      result.add(await ClassAdjustmentService.toDto(session, request));
    }
    return result;
  }

  static Future<ClassAdjustmentRequestDto> decideAdjustmentRequest(
    Session session, {
    required UuidValue requestId,
    required bool approve,
    String? rejectReason,
  }) async {
    final ctx = await context(session);
    await AdminPermissionService.require(session, ctx.admin, 'APPROVE_CLASS');
    if (!approve &&
        !InputValidator.requiredText(rejectReason ?? '', maxLength: 1000)) {
      throw _error(
        'reject_reason_required',
        'Vui lòng nhập lý do từ chối yêu cầu điều chỉnh.',
      );
    }
    return session.db.transaction((transaction) async {
      final request = await ClassAdjustmentRequest.db.findById(
        session,
        requestId,
        transaction: transaction,
        lockMode: LockMode.forUpdate,
      );
      if (request == null) {
        throw _error('request_not_found', 'Không tìm thấy yêu cầu điều chỉnh.');
      }
      if (request.status != ClassAdjustmentStatus.pending) {
        throw _error(
          'request_already_reviewed',
          'Yêu cầu điều chỉnh đã được xử lý trước đó.',
        );
      }
      final courseClass = await CourseClass.db.findById(
        session,
        request.courseClassId,
        transaction: transaction,
        lockMode: LockMode.forUpdate,
      );
      if (courseClass == null) {
        throw _error('class_not_found', 'Lớp học phần không còn tồn tại.');
      }
      if (approve) {
        final currentSchedules = await ClassSchedule.db.find(
          session,
          transaction: transaction,
          where: (table) => table.courseClassId.equals(courseClass.id),
        );
        final currentDtos = currentSchedules
            .map(
              (value) => ClassScheduleDto(
                dayOfWeek: value.dayOfWeek,
                startPeriod: value.startPeriod,
                endPeriod: value.endPeriod,
                room: value.room,
              ),
            )
            .toList(growable: false);
        if (courseClass.capacity != request.oldCapacity ||
            !ClassAdjustmentService.schedulesMatch(
              currentDtos,
              request.oldSchedulesJson,
            )) {
          throw _error(
            'adjustment_stale',
            'Lớp đã thay đổi sau khi yêu cầu được gửi. Hãy từ chối yêu cầu cũ và gửi lại.',
          );
        }
        if (request.newCapacity < courseClass.registeredCount ||
            request.newCapacity < 1 ||
            request.newCapacity > 500) {
          throw _error(
            'invalid_capacity',
            'Sĩ số đề nghị không còn phù hợp với số sinh viên hiện tại.',
          );
        }
        final lecturer = await Lecturer.db.findById(
          session,
          courseClass.lecturerId,
          transaction: transaction,
        );
        if (lecturer == null) {
          throw _error('lecturer_not_found', 'Không tìm thấy giảng viên.');
        }
        final proposedSchedules = ClassAdjustmentService.decodeSchedules(
          request.newSchedulesJson,
        );
        await LecturerService.ensureNoConflict(
          session,
          lecturer: lecturer,
          semesterId: courseClass.semesterId,
          schedules: proposedSchedules,
          excludedClassId: courseClass.id,
          transaction: transaction,
        );
        await ClassSchedule.db.deleteWhere(
          session,
          where: (table) => table.courseClassId.equals(courseClass.id),
          transaction: transaction,
        );
        for (final schedule in proposedSchedules) {
          await ClassSchedule.db.insertRow(
            session,
            ClassSchedule(
              courseClassId: courseClass.id!,
              dayOfWeek: schedule.dayOfWeek,
              startPeriod: schedule.startPeriod,
              endPeriod: schedule.endPeriod,
              room: schedule.room,
            ),
            transaction: transaction,
          );
        }
        final nextStatus = courseClass.status == CourseClassStatus.closed
            ? CourseClassStatus.closed
            : courseClass.registeredCount >= request.newCapacity
            ? CourseClassStatus.full
            : CourseClassStatus.open;
        await CourseClass.db.updateRow(
          session,
          courseClass.copyWith(
            capacity: request.newCapacity,
            status: nextStatus,
          ),
          transaction: transaction,
        );
      }
      final reviewed = await ClassAdjustmentRequest.db.updateRow(
        session,
        request.copyWith(
          status: approve
              ? ClassAdjustmentStatus.approved
              : ClassAdjustmentStatus.rejected,
          reviewedAt: DateTime.now().toUtc(),
          reviewedById: ctx.admin.id!,
          rejectReason: approve ? null : rejectReason!.trim(),
        ),
        transaction: transaction,
      );
      await AuditService.log(
        session,
        actor: ctx.user,
        action: approve
            ? 'APPROVE_CLASS_ADJUSTMENT'
            : 'REJECT_CLASS_ADJUSTMENT',
        entity: 'class_adjustment_request',
        entityId: requestId,
        oldValue: jsonEncode({
          'capacity': request.oldCapacity,
          'schedules': jsonDecode(request.oldSchedulesJson),
        }),
        newValue: jsonEncode({
          'capacity': request.newCapacity,
          'schedules': jsonDecode(request.newSchedulesJson),
          'status': reviewed.status.name,
          'rejectReason': reviewed.rejectReason,
        }),
        transaction: transaction,
      );
      return ClassAdjustmentService.toDto(
        session,
        reviewed,
        transaction: transaction,
      );
    });
  }

  static Future<List<RegistrationPeriodDto>> getRegistrationPeriods(
    Session session,
  ) async {
    final ctx = await context(session);
    await AdminPermissionService.require(session, ctx.admin, 'MANAGE_COURSE');
    final semesters = await Semester.db.find(
      session,
      orderBy: (table) => table.startDate.desc(),
    );
    final now = DateTime.now().toUtc();
    final result = <RegistrationPeriodDto>[];
    for (final semester in semesters) {
      result.add(
        await RegistrationPeriodService.getDto(
          session,
          semesterId: semester.id!,
          now: now,
        ),
      );
    }
    return result;
  }

  static Future<RegistrationPeriodDto> updateRegistrationPeriod(
    Session session, {
    required UuidValue semesterId,
    required DateTime startTime,
    required DateTime endTime,
    DateTime? lecturerStartTime,
    DateTime? lecturerEndTime,
    RegistrationPeriodStatus? status,
  }) async {
    final ctx = await context(session);
    await AdminPermissionService.require(session, ctx.admin, 'MANAGE_COURSE');
    final startUtc = startTime.toUtc();
    final endUtc = endTime.toUtc();
    final lecturerStartUtc = (lecturerStartTime ?? startTime).toUtc();
    final lecturerEndUtc = (lecturerEndTime ?? endTime).toUtc();
    final effectiveStatus = status ?? RegistrationPeriodStatus.active;
    if (!startUtc.isBefore(endUtc) ||
        !lecturerStartUtc.isBefore(lecturerEndUtc)) {
      throw _error(
        'invalid_registration_period',
        'Thời gian bắt đầu phải trước thời gian kết thúc cho từng nhóm người dùng.',
      );
    }
    return session.db.transaction((transaction) async {
      final semester = await Semester.db.findById(
        session,
        semesterId,
        transaction: transaction,
        lockMode: LockMode.forUpdate,
      );
      if (semester == null) {
        throw _error('semester_not_found', 'Không tìm thấy học kỳ.');
      }
      final existing = await RegistrationPeriod.db.findFirstRow(
        session,
        transaction: transaction,
        where: (table) => table.semesterId.equals(semesterId),
        lockMode: LockMode.forUpdate,
      );
      final now = DateTime.now().toUtc();
      final saved = existing == null
          ? await RegistrationPeriod.db.insertRow(
              session,
              RegistrationPeriod(
                semesterId: semesterId,
                startTime: startUtc,
                endTime: endUtc,
                lecturerStartTime: lecturerStartUtc,
                lecturerEndTime: lecturerEndUtc,
                status: effectiveStatus,
                updatedById: ctx.admin.id!,
                createdAt: now,
                updatedAt: now,
              ),
              transaction: transaction,
            )
          : await RegistrationPeriod.db.updateRow(
              session,
              existing.copyWith(
                startTime: startUtc,
                endTime: endUtc,
                lecturerStartTime: lecturerStartUtc,
                lecturerEndTime: lecturerEndUtc,
                status: effectiveStatus,
                updatedById: ctx.admin.id,
                updatedAt: now,
              ),
              transaction: transaction,
            );
      await AuditService.log(
        session,
        actor: ctx.user,
        action: 'UPDATE_REGISTRATION_PERIOD',
        entity: 'registration_period',
        entityId: saved.id!,
        oldValue: existing == null ? null : jsonEncode(existing.toJson()),
        newValue: jsonEncode(saved.toJson()),
        transaction: transaction,
      );
      return (await RegistrationPeriodService.getWindow(
        session,
        semesterId: semesterId,
        transaction: transaction,
      )).toDto(now);
    });
  }

  static Future<CourseOpeningRequest> decideOpeningRequest(
    Session session,
    UuidValue requestId,
    bool approve,
  ) async {
    final ctx = await context(session);
    await AdminPermissionService.require(session, ctx.admin, 'APPROVE_CLASS');
    final value = await CourseOpeningRequest.db.findById(session, requestId);
    if (value == null) {
      throw _error('request_not_found', 'Không tìm thấy yêu cầu.');
    }
    final updated = await CourseOpeningRequest.db.updateRow(
      session,
      value.copyWith(
        status: approve
            ? OpeningRequestStatus.approved
            : OpeningRequestStatus.rejected,
      ),
    );
    await AuditService.log(
      session,
      actor: ctx.user,
      action: approve ? 'APPROVE_OPENING_REQUEST' : 'REJECT_OPENING_REQUEST',
      entity: 'course_opening_request',
      entityId: requestId,
      oldValue: jsonEncode({'status': value.status.name}),
      newValue: jsonEncode({'status': updated.status.name}),
    );
    return updated;
  }

  static Future<AnalyticsReportDto> getReports(Session session) async {
    final ctx = await context(session);
    await AdminPermissionService.require(session, ctx.admin, 'VIEW_REPORT');
    return AnalyticsService.generate(session);
  }

  static Future<List<AuditLogDto>> getAuditLogs(
    Session session, {
    int page = 1,
    int pageSize = 50,
  }) async {
    final ctx = await context(session);
    await AdminPermissionService.require(session, ctx.admin, 'VIEW_AUDIT');
    final window = Pagination.window(page: page, pageSize: pageSize);
    final logs = await SystemAuditLog.db.find(
      session,
      orderBy: (table) => table.createdAt.desc(),
      limit: window.limit,
      offset: window.offset,
    );
    final userIds = logs.map((item) => item.userId).toSet();
    final actors = userIds.isEmpty
        ? <AppUser>[]
        : await AppUser.db.find(
            session,
            where: (table) => table.id.inSet(userIds),
          );
    final actorsById = {for (final actor in actors) actor.id!: actor};
    final result = <AuditLogDto>[];
    for (final log in logs) {
      final actor = actorsById[log.userId];
      result.add(
        AuditLogDto(
          id: log.id!,
          actorName: actor?.fullName ?? 'Unknown',
          action: log.action,
          entity: log.entity,
          entityId: log.entityId,
          oldValue: log.oldValue,
          newValue: log.newValue,
          createdAt: log.createdAt,
        ),
      );
    }
    return result;
  }

  static Future<List<AdminPermission>> getPermissions(
    Session session,
    UuidValue adminId,
  ) async {
    final ctx = await context(session);
    await AdminPermissionService.require(session, ctx.admin, 'MANAGE_USER');
    return AdminPermission.db.find(
      session,
      where: (table) => table.adminId.equals(adminId),
    );
  }

  static Future<AdminPermission> grantPermission(
    Session session,
    UuidValue adminId,
    String permission,
  ) async {
    final ctx = await context(session);
    await AdminPermissionService.require(session, ctx.admin, 'MANAGE_USER');
    return AdminPermission.db.insertRow(
      session,
      AdminPermission(adminId: adminId, permissionName: permission),
    );
  }

  static Future<AdminUserDto> _userDto(
    Session session,
    AppUser user, {
    Transaction? transaction,
  }) async {
    String? roleCode;
    switch (user.role) {
      case UserRole.student:
        roleCode = (await Student.db.findFirstRow(
          session,
          transaction: transaction,
          where: (table) => table.userId.equals(user.id),
        ))?.studentCode;
      case UserRole.lecturer:
        roleCode = (await Lecturer.db.findFirstRow(
          session,
          transaction: transaction,
          where: (table) => table.userId.equals(user.id),
        ))?.lecturerCode;
      case UserRole.admin:
        roleCode = null;
    }
    return AdminUserDto(
      userId: user.id!,
      authUserId: user.authUserId,
      email: user.email,
      fullName: user.fullName,
      phone: user.phone,
      role: user.role,
      isActive: user.isActive,
      roleCode: roleCode,
    );
  }

  static Future<List<AdminUserDto>> _userDtos(
    Session session,
    List<AppUser> users,
  ) async {
    final userIds = users.map((item) => item.id!).toSet();
    final students = userIds.isEmpty
        ? <Student>[]
        : await Student.db.find(
            session,
            where: (table) => table.userId.inSet(userIds),
          );
    final lecturers = userIds.isEmpty
        ? <Lecturer>[]
        : await Lecturer.db.find(
            session,
            where: (table) => table.userId.inSet(userIds),
          );
    final studentCodes = {
      for (final item in students) item.userId: item.studentCode,
    };
    final lecturerCodes = {
      for (final item in lecturers) item.userId: item.lecturerCode,
    };
    return users
        .map(
          (user) => AdminUserDto(
            userId: user.id!,
            authUserId: user.authUserId,
            email: user.email,
            fullName: user.fullName,
            phone: user.phone,
            role: user.role,
            isActive: user.isActive,
            roleCode: switch (user.role) {
              UserRole.student => studentCodes[user.id],
              UserRole.lecturer => lecturerCodes[user.id],
              UserRole.admin => null,
            },
          ),
        )
        .toList(growable: false);
  }

  static Future<bool> _createsCycle(
    Session session,
    UuidValue courseId,
    UuidValue requiredId,
  ) async {
    final edges = await CoursePrerequisite.db.find(session);
    final graph = <UuidValue, List<UuidValue>>{};
    for (final edge in edges) {
      graph.putIfAbsent(edge.courseId, () => []).add(edge.prerequisiteId);
    }
    final pending = <UuidValue>[requiredId];
    final visited = <UuidValue>{};
    while (pending.isNotEmpty) {
      final current = pending.removeLast();
      if (current == courseId) return true;
      if (visited.add(current)) pending.addAll(graph[current] ?? const []);
    }
    return false;
  }

  static Future<void> _auditCreate(
    Session session,
    AppUser actor,
    String action,
    String entity,
    UuidValue id,
    Map<String, dynamic> value,
  ) => AuditService.log(
    session,
    actor: actor,
    action: action,
    entity: entity,
    entityId: id,
    newValue: jsonEncode(value),
  );

  static bool _validPhone(String? value) {
    final normalized = value?.trim() ?? '';
    return normalized.isEmpty || RegExp(r'^\d{8,15}$').hasMatch(normalized);
  }

  static String? _normalizedPhone(String? value) {
    final normalized = value?.trim() ?? '';
    return normalized.isEmpty ? null : normalized;
  }

  static String _automaticRoleCode(UserRole role, UuidValue userId) {
    final suffix = userId
        .toString()
        .replaceAll('-', '')
        .substring(22)
        .toUpperCase();
    return '${role == UserRole.student ? 'SV' : 'GV'}$suffix';
  }

  static String _automaticCourseCode() =>
      'MH${DateTime.now().toUtc().microsecondsSinceEpoch.toRadixString(36).toUpperCase()}';

  static AppException _error(String code, String message) =>
      AppException(code: code, message: message);
}
