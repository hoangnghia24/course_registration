import 'dart:convert';

import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart';
import 'package:serverpod_auth_idp_server/providers/email.dart';

import '../../auth/app_scopes.dart';
import '../../core/input_validator.dart';
import '../../core/pagination.dart';
import '../../generated/protocol.dart';
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
    String? roleCode,
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
        !InputValidator.optionalText(roleCode, maxLength: 32) ||
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
          role: role,
          isActive: true,
        ),
        transaction: transaction,
      );
      switch (role) {
        case UserRole.student:
          if (roleCode == null || roleCode.trim().isEmpty) {
            throw _error('invalid_role_code', 'Sinh viên cần MSSV.');
          }
          await Student.db.insertRow(
            session,
            Student(
              userId: user.id!,
              studentCode: roleCode.trim(),
              majorId: majorId,
              trainingProgramId: trainingProgramId,
              academicYear: academicYear ?? DateTime.now().year,
              enrollmentYear: academicYear ?? DateTime.now().year,
              currentSemester: 1,
            ),
            transaction: transaction,
          );
        case UserRole.lecturer:
          if (roleCode == null || roleCode.trim().isEmpty) {
            throw _error('invalid_role_code', 'Giảng viên cần mã giảng viên.');
          }
          await Lecturer.db.insertRow(
            session,
            Lecturer(userId: user.id!, lecturerCode: roleCode.trim()),
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
        !InputValidator.optionalText(phone, maxLength: 32)) {
      throw _error('invalid_user', 'Thông tin người dùng không hợp lệ.');
    }
    final old = jsonEncode(user.toJson());
    final updated = await AppUser.db.updateRow(
      session,
      user.copyWith(
        fullName: fullName.trim(),
        phone: phone,
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
    required String courseCode,
    required String courseName,
    required int credits,
    required CourseType courseType,
    String? description,
    UuidValue? categoryId,
  }) async {
    final ctx = await context(session);
    await AdminPermissionService.require(session, ctx.admin, 'MANAGE_COURSE');
    if (!InputValidator.requiredText(courseCode, maxLength: 32) ||
        !InputValidator.requiredText(courseName, maxLength: 200) ||
        !InputValidator.optionalText(description, maxLength: 2000) ||
        credits < 1 ||
        credits > 10) {
      throw _error('invalid_course', 'Thông tin môn học không hợp lệ.');
    }
    final value = await Course.db.insertRow(
      session,
      Course(
        courseCode: courseCode.trim(),
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
      throw _error('invalid_course', 'Thông tin môn học không hợp lệ.');
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
    required String name,
    required int academicYear,
    required int totalCredits,
    String? description,
  }) async {
    final ctx = await context(session);
    await AdminPermissionService.require(session, ctx.admin, 'MANAGE_PROGRAM');
    if (!InputValidator.requiredText(name, maxLength: 200) ||
        !InputValidator.academicYear(academicYear) ||
        !InputValidator.totalCredits(totalCredits) ||
        !InputValidator.optionalText(description, maxLength: 2000)) {
      throw _error('invalid_program', 'Thông tin chương trình không hợp lệ.');
    }
    final value = await TrainingProgram.db.insertRow(
      session,
      TrainingProgram(
        majorId: majorId,
        name: name.trim(),
        academicYear: academicYear,
        totalCredits: totalCredits,
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
    required String name,
    required int academicYear,
    required int totalCredits,
    String? description,
  }) async {
    final ctx = await context(session);
    await AdminPermissionService.require(session, ctx.admin, 'MANAGE_PROGRAM');
    final value = await TrainingProgram.db.findById(session, programId);
    if (value == null) {
      throw _error('program_not_found', 'Không tìm thấy chương trình.');
    }
    if (!InputValidator.requiredText(name, maxLength: 200) ||
        !InputValidator.academicYear(academicYear) ||
        !InputValidator.totalCredits(totalCredits) ||
        !InputValidator.optionalText(description, maxLength: 2000)) {
      throw _error('invalid_program', 'Thông tin chương trình không hợp lệ.');
    }
    final old = jsonEncode(value.toJson());
    final updated = await TrainingProgram.db.updateRow(
      session,
      value.copyWith(
        name: name.trim(),
        academicYear: academicYear,
        totalCredits: totalCredits,
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
    if (!InputValidator.semesterNumber(semesterNumber)) {
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
  static AppException _error(String code, String message) =>
      AppException(code: code, message: message);
}
