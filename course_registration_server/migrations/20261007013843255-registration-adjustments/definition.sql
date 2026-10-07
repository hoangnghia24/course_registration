BEGIN;

--
-- Function: gen_random_uuid_v7()
-- Source: https://gist.github.com/kjmph/5bd772b2c2df145aa645b837da7eca74
-- License: MIT (copyright notice included on the generator source code).
--
create or replace function gen_random_uuid_v7()
returns uuid
as $$
begin
  -- use random v4 uuid as starting point (which has the same variant we need)
  -- then overlay timestamp
  -- then set version 7 by flipping the 2 and 1 bit in the version 4 string
  return encode(
    set_bit(
      set_bit(
        overlay(uuid_send(gen_random_uuid())
                placing substring(int8send(floor(extract(epoch from clock_timestamp()) * 1000)::bigint) from 3)
                from 1 for 6
        ),
        52, 1
      ),
      53, 1
    ),
    'hex')::uuid;
end
$$
language plpgsql
volatile;

--
-- Class AdminPermission as table admin_permissions
--
CREATE TABLE "admin_permissions" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "adminId" uuid NOT NULL,
    "permissionName" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE UNIQUE INDEX "admin_permissions_unique" ON "admin_permissions" USING btree ("adminId", "permissionName");

--
-- Class Admin as table admins
--
CREATE TABLE "admins" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "userId" uuid NOT NULL,
    "permissionLevel" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "admins_user_id_unique" ON "admins" USING btree ("userId");

--
-- Class ClassAdjustmentRequest as table class_adjustment_requests
--
CREATE TABLE "class_adjustment_requests" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "courseClassId" uuid NOT NULL,
    "lecturerId" uuid NOT NULL,
    "oldCapacity" bigint NOT NULL,
    "newCapacity" bigint NOT NULL,
    "oldSchedulesJson" text NOT NULL,
    "newSchedulesJson" text NOT NULL,
    "status" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "reviewedAt" timestamp without time zone,
    "reviewedById" uuid,
    "rejectReason" text
);

-- Indexes
CREATE INDEX "class_adjustment_requests_class_status_idx" ON "class_adjustment_requests" USING btree ("courseClassId", "status");
CREATE INDEX "class_adjustment_requests_lecturer_idx" ON "class_adjustment_requests" USING btree ("lecturerId", "createdAt");
CREATE INDEX "class_adjustment_requests_status_idx" ON "class_adjustment_requests" USING btree ("status", "createdAt");

--
-- Class ClassApproval as table class_approvals
--
CREATE TABLE "class_approvals" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "courseClassId" uuid NOT NULL,
    "adminId" uuid NOT NULL,
    "status" text NOT NULL,
    "comment" text,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE UNIQUE INDEX "class_approvals_class_unique" ON "class_approvals" USING btree ("courseClassId");
CREATE INDEX "class_approvals_status_idx" ON "class_approvals" USING btree ("status");

--
-- Class ClassSchedule as table class_schedules
--
CREATE TABLE "class_schedules" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "courseClassId" uuid NOT NULL,
    "dayOfWeek" bigint NOT NULL,
    "startPeriod" bigint NOT NULL,
    "endPeriod" bigint NOT NULL,
    "room" text NOT NULL
);

-- Indexes
CREATE INDEX "class_schedules_class_idx" ON "class_schedules" USING btree ("courseClassId");

--
-- Class CourseCategory as table course_categories
--
CREATE TABLE "course_categories" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "name" text NOT NULL,
    "description" text
);

-- Indexes
CREATE UNIQUE INDEX "course_categories_name_unique" ON "course_categories" USING btree ("name");

--
-- Class CourseClass as table course_classes
--
CREATE TABLE "course_classes" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "courseId" uuid NOT NULL,
    "lecturerId" uuid NOT NULL,
    "semesterId" uuid NOT NULL,
    "classCode" text NOT NULL,
    "capacity" bigint NOT NULL,
    "registeredCount" bigint NOT NULL DEFAULT 0,
    "status" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "course_classes_code_semester_unique" ON "course_classes" USING btree ("classCode", "semesterId");
CREATE INDEX "course_classes_open_idx" ON "course_classes" USING btree ("semesterId", "status");
CREATE INDEX "course_classes_course_idx" ON "course_classes" USING btree ("courseId");

--
-- Class CourseEquivalent as table course_equivalents
--
CREATE TABLE "course_equivalents" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "courseId" uuid NOT NULL,
    "equivalentId" uuid NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "course_equivalents_unique" ON "course_equivalents" USING btree ("courseId", "equivalentId");
CREATE INDEX "course_equivalents_equivalent_idx" ON "course_equivalents" USING btree ("equivalentId");

--
-- Class CourseOpeningRequest as table course_opening_requests
--
CREATE TABLE "course_opening_requests" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "studentId" uuid NOT NULL,
    "courseId" uuid NOT NULL,
    "reason" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "status" text NOT NULL
);

-- Indexes
CREATE INDEX "opening_requests_student_idx" ON "course_opening_requests" USING btree ("studentId", "status");

--
-- Class CoursePrerequisite as table course_prerequisites
--
CREATE TABLE "course_prerequisites" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "courseId" uuid NOT NULL,
    "prerequisiteId" uuid NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "course_prerequisites_unique" ON "course_prerequisites" USING btree ("courseId", "prerequisiteId");

--
-- Class Course as table courses
--
CREATE TABLE "courses" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "courseCode" text NOT NULL,
    "courseName" text NOT NULL,
    "credits" bigint NOT NULL,
    "description" text,
    "courseType" text NOT NULL,
    "categoryId" uuid,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE UNIQUE INDEX "courses_course_code_unique" ON "courses" USING btree ("courseCode");

--
-- Class Faculty as table faculties
--
CREATE TABLE "faculties" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "name" text NOT NULL,
    "code" text NOT NULL,
    "description" text,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE UNIQUE INDEX "faculties_code_unique" ON "faculties" USING btree ("code");

--
-- Class LecturerActivityLog as table lecturer_activity_logs
--
CREATE TABLE "lecturer_activity_logs" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "lecturerId" uuid NOT NULL,
    "action" text NOT NULL,
    "entity" text NOT NULL,
    "entityId" uuid NOT NULL,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE INDEX "lecturer_activity_logs_idx" ON "lecturer_activity_logs" USING btree ("lecturerId", "createdAt");

--
-- Class LecturerCourseClass as table lecturer_course_classes
--
CREATE TABLE "lecturer_course_classes" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "lecturerId" uuid NOT NULL,
    "courseClassId" uuid NOT NULL,
    "assignedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE UNIQUE INDEX "lecturer_course_classes_unique" ON "lecturer_course_classes" USING btree ("lecturerId", "courseClassId");
CREATE INDEX "lecturer_course_classes_lecturer_idx" ON "lecturer_course_classes" USING btree ("lecturerId");

--
-- Class Lecturer as table lecturers
--
CREATE TABLE "lecturers" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "userId" uuid NOT NULL,
    "lecturerCode" text NOT NULL,
    "facultyId" uuid,
    "academicDegree" text,
    "department" text,
    "academicTitle" text,
    "specialization" text
);

-- Indexes
CREATE UNIQUE INDEX "lecturers_user_id_unique" ON "lecturers" USING btree ("userId");
CREATE UNIQUE INDEX "lecturers_lecturer_code_unique" ON "lecturers" USING btree ("lecturerCode");

--
-- Class Major as table majors
--
CREATE TABLE "majors" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "facultyId" uuid NOT NULL,
    "name" text NOT NULL,
    "code" text NOT NULL,
    "description" text,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE UNIQUE INDEX "majors_code_unique" ON "majors" USING btree ("code");
CREATE INDEX "majors_faculty_id_idx" ON "majors" USING btree ("facultyId");

--
-- Class ProcessedSyncOperation as table processed_sync_operations
--
CREATE TABLE "processed_sync_operations" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "operationId" uuid NOT NULL,
    "userId" uuid NOT NULL,
    "entityType" text NOT NULL,
    "entityId" text,
    "operationType" text NOT NULL,
    "payload" text NOT NULL,
    "status" text NOT NULL,
    "resultPayload" text,
    "errorCode" text,
    "errorMessage" text,
    "serverVersion" bigint NOT NULL DEFAULT 1,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE UNIQUE INDEX "processed_sync_operations_operation_unique" ON "processed_sync_operations" USING btree ("operationId");
CREATE INDEX "processed_sync_operations_user_idx" ON "processed_sync_operations" USING btree ("userId", "createdAt");

--
-- Class RegistrationHistory as table registration_history
--
CREATE TABLE "registration_history" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "studentId" uuid NOT NULL,
    "courseClassId" uuid NOT NULL,
    "action" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deviceInfo" text
);

-- Indexes
CREATE INDEX "registration_history_student_idx" ON "registration_history" USING btree ("studentId", "createdAt");

--
-- Class RegistrationPeriod as table registration_periods
--
CREATE TABLE "registration_periods" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "semesterId" uuid NOT NULL,
    "startTime" timestamp without time zone NOT NULL,
    "endTime" timestamp without time zone NOT NULL,
    "updatedById" uuid,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE UNIQUE INDEX "registration_periods_semester_unique" ON "registration_periods" USING btree ("semesterId");
CREATE INDEX "registration_periods_window_idx" ON "registration_periods" USING btree ("startTime", "endTime");

--
-- Class Registration as table registrations
--
CREATE TABLE "registrations" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "studentId" uuid NOT NULL,
    "courseClassId" uuid NOT NULL,
    "registeredAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "status" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "registrations_student_class_unique" ON "registrations" USING btree ("studentId", "courseClassId");
CREATE INDEX "registrations_student_status_idx" ON "registrations" USING btree ("studentId", "status");
CREATE INDEX "registrations_class_status_idx" ON "registrations" USING btree ("courseClassId", "status");

--
-- Class Semester as table semesters
--
CREATE TABLE "semesters" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "name" text NOT NULL,
    "academicYear" bigint NOT NULL,
    "startDate" timestamp without time zone NOT NULL,
    "endDate" timestamp without time zone NOT NULL,
    "status" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "semesters_name_year_unique" ON "semesters" USING btree ("name", "academicYear");
CREATE INDEX "semesters_status_idx" ON "semesters" USING btree ("status");

--
-- Class StudentTranscript as table student_transcripts
--
CREATE TABLE "student_transcripts" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "studentId" uuid NOT NULL,
    "courseId" uuid NOT NULL,
    "semester" text NOT NULL,
    "midtermScore" double precision,
    "finalScore" double precision,
    "score" double precision NOT NULL,
    "letterGrade" text NOT NULL,
    "status" text NOT NULL,
    "attemptNumber" bigint NOT NULL,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE UNIQUE INDEX "student_transcripts_attempt_unique" ON "student_transcripts" USING btree ("studentId", "courseId", "attemptNumber");
CREATE INDEX "student_transcripts_student_semester_idx" ON "student_transcripts" USING btree ("studentId", "semester");

--
-- Class Student as table students
--
CREATE TABLE "students" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "userId" uuid NOT NULL,
    "studentCode" text NOT NULL,
    "majorId" uuid,
    "trainingProgramId" uuid,
    "academicYear" bigint NOT NULL,
    "enrollmentYear" bigint NOT NULL DEFAULT 0,
    "currentSemester" bigint NOT NULL DEFAULT 1,
    "gpa" double precision NOT NULL,
    "totalCredits" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "students_user_id_unique" ON "students" USING btree ("userId");
CREATE UNIQUE INDEX "students_student_code_unique" ON "students" USING btree ("studentCode");

--
-- Class SyncChange as table sync_changes
--
CREATE TABLE "sync_changes" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "targetUserId" uuid NOT NULL,
    "entityType" text NOT NULL,
    "entityId" text NOT NULL,
    "changeType" text NOT NULL,
    "payload" text,
    "serverVersion" bigint NOT NULL,
    "changedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE INDEX "sync_changes_user_time_idx" ON "sync_changes" USING btree ("targetUserId", "changedAt");

--
-- Class SyncLog as table sync_logs
--
CREATE TABLE "sync_logs" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "operationId" uuid NOT NULL,
    "action" text NOT NULL,
    "status" text NOT NULL,
    "startedAt" timestamp without time zone NOT NULL,
    "completedAt" timestamp without time zone,
    "errorCode" text,
    "errorMessage" text
);

-- Indexes
CREATE INDEX "sync_logs_operation_idx" ON "sync_logs" USING btree ("operationId", "startedAt");

--
-- Class SystemAuditLog as table system_audit_logs
--
CREATE TABLE "system_audit_logs" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "userId" uuid NOT NULL,
    "action" text NOT NULL,
    "entity" text NOT NULL,
    "entityId" uuid NOT NULL,
    "oldValue" text,
    "newValue" text,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE INDEX "system_audit_logs_created_idx" ON "system_audit_logs" USING btree ("createdAt");
CREATE INDEX "system_audit_logs_user_idx" ON "system_audit_logs" USING btree ("userId", "createdAt");

--
-- Class TeachingScheduleProposal as table teaching_schedule_proposals
--
CREATE TABLE "teaching_schedule_proposals" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "lecturerId" uuid NOT NULL,
    "courseClassId" uuid NOT NULL,
    "dayOfWeek" bigint NOT NULL,
    "startPeriod" bigint NOT NULL,
    "endPeriod" bigint NOT NULL,
    "room" text NOT NULL,
    "status" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE INDEX "teaching_proposals_lecturer_idx" ON "teaching_schedule_proposals" USING btree ("lecturerId", "status");
CREATE INDEX "teaching_proposals_class_idx" ON "teaching_schedule_proposals" USING btree ("courseClassId");

--
-- Class TrainingProgramCourse as table training_program_courses
--
CREATE TABLE "training_program_courses" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "trainingProgramId" uuid NOT NULL,
    "courseId" uuid NOT NULL,
    "semesterNumber" bigint NOT NULL,
    "isRequired" boolean NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "training_program_courses_unique" ON "training_program_courses" USING btree ("trainingProgramId", "courseId");
CREATE INDEX "training_program_courses_semester_idx" ON "training_program_courses" USING btree ("trainingProgramId", "semesterNumber");

--
-- Class TrainingProgram as table training_programs
--
CREATE TABLE "training_programs" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "majorId" uuid NOT NULL,
    "name" text NOT NULL,
    "academicYear" bigint NOT NULL,
    "totalCredits" bigint NOT NULL,
    "description" text,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE UNIQUE INDEX "training_programs_major_year_unique" ON "training_programs" USING btree ("majorId", "academicYear");

--
-- Class AppUser as table users
--
CREATE TABLE "users" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "authUserId" uuid NOT NULL,
    "email" text NOT NULL,
    "fullName" text NOT NULL,
    "phone" text,
    "avatar" text,
    "role" text NOT NULL,
    "isActive" boolean NOT NULL DEFAULT true,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE UNIQUE INDEX "users_auth_user_id_unique" ON "users" USING btree ("authUserId");
CREATE UNIQUE INDEX "users_email_unique" ON "users" USING btree ("email");

--
-- Class CloudStorageEntry as table serverpod_cloud_storage
--
CREATE TABLE "serverpod_cloud_storage" (
    "id" bigserial PRIMARY KEY,
    "storageId" text NOT NULL,
    "path" text NOT NULL,
    "addedTime" timestamp without time zone NOT NULL,
    "expiration" timestamp without time zone,
    "byteData" bytea NOT NULL,
    "verified" boolean NOT NULL,
    "contentType" text,
    "cacheControl" text,
    "contentDisposition" text,
    "contentEncoding" text,
    "customMetadata" text
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_cloud_storage_path_idx" ON "serverpod_cloud_storage" USING btree ("storageId", "path");
CREATE INDEX "serverpod_cloud_storage_expiration" ON "serverpod_cloud_storage" USING btree ("expiration");

--
-- Class CloudStorageDirectDownloadEntry as table serverpod_cloud_storage_direct_download
--
CREATE TABLE "serverpod_cloud_storage_direct_download" (
    "id" bigserial PRIMARY KEY,
    "storageId" text NOT NULL,
    "path" text NOT NULL,
    "expiration" timestamp without time zone NOT NULL,
    "authKey" text NOT NULL,
    "downloadFileName" text,
    "contentType" text
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_cloud_storage_direct_download_auth_key" ON "serverpod_cloud_storage_direct_download" USING btree ("authKey");
CREATE INDEX "serverpod_cloud_storage_direct_download_expiration" ON "serverpod_cloud_storage_direct_download" USING btree ("expiration");

--
-- Class CloudStorageDirectUploadEntry as table serverpod_cloud_storage_direct_upload
--
CREATE TABLE "serverpod_cloud_storage_direct_upload" (
    "id" bigserial PRIMARY KEY,
    "storageId" text NOT NULL,
    "path" text NOT NULL,
    "expiration" timestamp without time zone NOT NULL,
    "authKey" text NOT NULL,
    "maxFileSize" bigint NOT NULL DEFAULT 10485760,
    "contentLength" bigint,
    "preventOverwrite" boolean NOT NULL DEFAULT false,
    "contentType" text,
    "cacheControl" text,
    "contentDisposition" text,
    "contentEncoding" text,
    "customMetadata" text
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_cloud_storage_direct_upload_storage_path" ON "serverpod_cloud_storage_direct_upload" USING btree ("storageId", "path");

--
-- Class FutureCallEntry as table serverpod_future_call
--
CREATE TABLE "serverpod_future_call" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "time" timestamp without time zone NOT NULL,
    "serializedObject" text,
    "serverId" text NOT NULL,
    "identifier" text,
    "scheduling" json
);

-- Indexes
CREATE INDEX "serverpod_future_call_time_idx" ON "serverpod_future_call" USING btree ("time");
CREATE INDEX "serverpod_future_call_serverId_idx" ON "serverpod_future_call" USING btree ("serverId");
CREATE INDEX "serverpod_future_call_identifier_idx" ON "serverpod_future_call" USING btree ("identifier");

--
-- Class FutureCallClaimEntry as table serverpod_future_call_claim
--
CREATE TABLE "serverpod_future_call_claim" (
    "id" bigserial PRIMARY KEY,
    "futureCallId" bigint,
    "lastHeartbeatTime" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "future_call_unique_idx" ON "serverpod_future_call_claim" USING btree ("futureCallId");

--
-- Class ServerHealthConnectionInfo as table serverpod_health_connection_info
--
CREATE TABLE "serverpod_health_connection_info" (
    "id" bigserial PRIMARY KEY,
    "serverId" text NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    "active" bigint NOT NULL,
    "closing" bigint NOT NULL,
    "idle" bigint NOT NULL,
    "granularity" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_health_connection_info_timestamp_idx" ON "serverpod_health_connection_info" USING btree ("timestamp", "serverId", "granularity");

--
-- Class ServerHealthMetric as table serverpod_health_metric
--
CREATE TABLE "serverpod_health_metric" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "serverId" text NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    "isHealthy" boolean NOT NULL,
    "value" double precision NOT NULL,
    "granularity" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_health_metric_timestamp_idx" ON "serverpod_health_metric" USING btree ("timestamp", "serverId", "name", "granularity");

--
-- Class LogEntry as table serverpod_log
--
CREATE TABLE "serverpod_log" (
    "id" bigserial PRIMARY KEY,
    "sessionLogId" bigint NOT NULL,
    "messageId" bigint,
    "reference" text,
    "serverId" text NOT NULL,
    "time" timestamp without time zone NOT NULL,
    "logLevel" bigint NOT NULL,
    "message" text NOT NULL,
    "error" text,
    "stackTrace" text,
    "order" bigint NOT NULL
);

-- Indexes
CREATE INDEX "serverpod_log_sessionLogId_idx" ON "serverpod_log" USING btree ("sessionLogId", "order");

--
-- Class MessageLogEntry as table serverpod_message_log
--
CREATE TABLE "serverpod_message_log" (
    "id" bigserial PRIMARY KEY,
    "sessionLogId" bigint NOT NULL,
    "serverId" text NOT NULL,
    "messageId" bigint NOT NULL,
    "endpoint" text NOT NULL,
    "messageName" text NOT NULL,
    "duration" double precision NOT NULL,
    "error" text,
    "stackTrace" text,
    "slow" boolean NOT NULL,
    "order" bigint NOT NULL
);

-- Indexes
CREATE INDEX "serverpod_message_log_sessionLogId_idx" ON "serverpod_message_log" USING btree ("sessionLogId", "order");

--
-- Class MethodInfo as table serverpod_method
--
CREATE TABLE "serverpod_method" (
    "id" bigserial PRIMARY KEY,
    "endpoint" text NOT NULL,
    "method" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_method_endpoint_method_idx" ON "serverpod_method" USING btree ("endpoint", "method");

--
-- Class DatabaseMigrationVersion as table serverpod_migrations
--
CREATE TABLE "serverpod_migrations" (
    "id" bigserial PRIMARY KEY,
    "module" text NOT NULL,
    "version" text NOT NULL,
    "timestamp" timestamp without time zone
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_migrations_ids" ON "serverpod_migrations" USING btree ("module");

--
-- Class QueryLogEntry as table serverpod_query_log
--
CREATE TABLE "serverpod_query_log" (
    "id" bigserial PRIMARY KEY,
    "serverId" text NOT NULL,
    "sessionLogId" bigint NOT NULL,
    "messageId" bigint,
    "query" text NOT NULL,
    "duration" double precision NOT NULL,
    "numRows" bigint,
    "error" text,
    "stackTrace" text,
    "slow" boolean NOT NULL,
    "order" bigint NOT NULL
);

-- Indexes
CREATE INDEX "serverpod_query_log_sessionLogId_idx" ON "serverpod_query_log" USING btree ("sessionLogId", "order");

--
-- Class ReadWriteTestEntry as table serverpod_readwrite_test
--
CREATE TABLE "serverpod_readwrite_test" (
    "id" bigserial PRIMARY KEY,
    "number" bigint NOT NULL
);

--
-- Class RuntimeSettings as table serverpod_runtime_settings
--
CREATE TABLE "serverpod_runtime_settings" (
    "id" bigserial PRIMARY KEY,
    "logSettings" json NOT NULL,
    "logSettingsOverrides" json NOT NULL,
    "logServiceCalls" boolean NOT NULL,
    "logMalformedCalls" boolean NOT NULL
);

--
-- Class SessionLogEntry as table serverpod_session_log
--
CREATE TABLE "serverpod_session_log" (
    "id" bigserial PRIMARY KEY,
    "serverId" text NOT NULL,
    "time" timestamp without time zone NOT NULL,
    "module" text,
    "endpoint" text,
    "method" text,
    "duration" double precision,
    "numQueries" bigint,
    "slow" boolean,
    "error" text,
    "stackTrace" text,
    "authenticatedUserId" bigint,
    "userId" text,
    "isOpen" boolean,
    "touched" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX "serverpod_session_log_serverid_idx" ON "serverpod_session_log" USING btree ("serverId");
CREATE INDEX "serverpod_session_log_time_idx" ON "serverpod_session_log" USING btree ("time");
CREATE INDEX "serverpod_session_log_touched_idx" ON "serverpod_session_log" USING btree ("touched");
CREATE INDEX "serverpod_session_log_isopen_idx" ON "serverpod_session_log" USING btree ("isOpen");

--
-- Class RefreshToken as table serverpod_auth_core_jwt_refresh_token
--
CREATE TABLE "serverpod_auth_core_jwt_refresh_token" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "authUserId" uuid NOT NULL,
    "scopeNames" json NOT NULL,
    "extraClaims" text,
    "method" text NOT NULL,
    "fixedSecret" bytea NOT NULL,
    "rotatingSecretHash" text NOT NULL,
    "lastUpdatedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE INDEX "serverpod_auth_core_jwt_refresh_token_last_updated_at" ON "serverpod_auth_core_jwt_refresh_token" USING btree ("lastUpdatedAt");

--
-- Class UserProfile as table serverpod_auth_core_profile
--
CREATE TABLE "serverpod_auth_core_profile" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "authUserId" uuid NOT NULL,
    "userName" text,
    "fullName" text,
    "email" text,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "imageId" uuid
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_auth_profile_user_profile_email_auth_user_id" ON "serverpod_auth_core_profile" USING btree ("authUserId");

--
-- Class UserProfileImage as table serverpod_auth_core_profile_image
--
CREATE TABLE "serverpod_auth_core_profile_image" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "userProfileId" uuid NOT NULL,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "storageId" text NOT NULL,
    "path" text NOT NULL,
    "url" text NOT NULL
);

--
-- Class ServerSideSession as table serverpod_auth_core_session
--
CREATE TABLE "serverpod_auth_core_session" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "authUserId" uuid NOT NULL,
    "scopeNames" json NOT NULL,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "lastUsedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "expiresAt" timestamp without time zone,
    "expireAfterUnusedFor" bigint,
    "sessionKeyHash" bytea NOT NULL,
    "sessionKeySalt" bytea NOT NULL,
    "method" text NOT NULL
);

--
-- Class AuthUser as table serverpod_auth_core_user
--
CREATE TABLE "serverpod_auth_core_user" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "createdAt" timestamp without time zone NOT NULL,
    "scopeNames" json NOT NULL,
    "blocked" boolean NOT NULL
);

--
-- Class AnonymousAccount as table serverpod_auth_idp_anonymous_account
--
CREATE TABLE "serverpod_auth_idp_anonymous_account" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "authUserId" uuid NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);

--
-- Class AppleAccount as table serverpod_auth_idp_apple_account
--
CREATE TABLE "serverpod_auth_idp_apple_account" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "userIdentifier" text NOT NULL,
    "refreshToken" text NOT NULL,
    "refreshTokenRequestedWithBundleIdentifier" boolean NOT NULL,
    "lastRefreshedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "authUserId" uuid NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "email" text,
    "isEmailVerified" boolean,
    "isPrivateEmail" boolean,
    "firstName" text,
    "lastName" text
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_auth_apple_account_identifier" ON "serverpod_auth_idp_apple_account" USING btree ("userIdentifier");

--
-- Class EmailAccount as table serverpod_auth_idp_email_account
--
CREATE TABLE "serverpod_auth_idp_email_account" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "authUserId" uuid NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "email" text NOT NULL,
    "passwordHash" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_auth_idp_email_account_email" ON "serverpod_auth_idp_email_account" USING btree ("email");

--
-- Class EmailAccountPasswordResetRequest as table serverpod_auth_idp_email_account_password_reset_request
--
CREATE TABLE "serverpod_auth_idp_email_account_password_reset_request" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "emailAccountId" uuid NOT NULL,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "challengeId" uuid NOT NULL,
    "setPasswordChallengeId" uuid
);

--
-- Class EmailAccountRequest as table serverpod_auth_idp_email_account_request
--
CREATE TABLE "serverpod_auth_idp_email_account_request" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "email" text NOT NULL,
    "challengeId" uuid NOT NULL,
    "createAccountChallengeId" uuid
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_auth_idp_email_account_request_email" ON "serverpod_auth_idp_email_account_request" USING btree ("email");

--
-- Class FacebookAccount as table serverpod_auth_idp_facebook_account
--
CREATE TABLE "serverpod_auth_idp_facebook_account" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "authUserId" uuid NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "userIdentifier" text NOT NULL,
    "email" text,
    "fullName" text,
    "firstName" text,
    "lastName" text
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_auth_facebook_account_user_identifier" ON "serverpod_auth_idp_facebook_account" USING btree ("userIdentifier");

--
-- Class FirebaseAccount as table serverpod_auth_idp_firebase_account
--
CREATE TABLE "serverpod_auth_idp_firebase_account" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "authUserId" uuid NOT NULL,
    "created" timestamp without time zone NOT NULL,
    "email" text,
    "phone" text,
    "userIdentifier" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_auth_firebase_account_user_identifier" ON "serverpod_auth_idp_firebase_account" USING btree ("userIdentifier");

--
-- Class GitHubAccount as table serverpod_auth_idp_github_account
--
CREATE TABLE "serverpod_auth_idp_github_account" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "authUserId" uuid NOT NULL,
    "userIdentifier" text NOT NULL,
    "email" text,
    "created" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_auth_github_account_user_identifier" ON "serverpod_auth_idp_github_account" USING btree ("userIdentifier");

--
-- Class GoogleAccount as table serverpod_auth_idp_google_account
--
CREATE TABLE "serverpod_auth_idp_google_account" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "authUserId" uuid NOT NULL,
    "created" timestamp without time zone NOT NULL,
    "email" text NOT NULL,
    "userIdentifier" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_auth_google_account_user_identifier" ON "serverpod_auth_idp_google_account" USING btree ("userIdentifier");

--
-- Class MicrosoftAccount as table serverpod_auth_idp_microsoft_account
--
CREATE TABLE "serverpod_auth_idp_microsoft_account" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "authUserId" uuid NOT NULL,
    "userIdentifier" text NOT NULL,
    "email" text,
    "created" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_auth_microsoft_account_user_identifier" ON "serverpod_auth_idp_microsoft_account" USING btree ("userIdentifier");

--
-- Class PasskeyAccount as table serverpod_auth_idp_passkey_account
--
CREATE TABLE "serverpod_auth_idp_passkey_account" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "authUserId" uuid NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "keyId" bytea NOT NULL,
    "keyIdBase64" text NOT NULL,
    "clientDataJSON" bytea NOT NULL,
    "attestationObject" bytea NOT NULL,
    "originalChallenge" bytea NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_auth_idp_passkey_account_key_id_base64" ON "serverpod_auth_idp_passkey_account" USING btree ("keyIdBase64");

--
-- Class PasskeyChallenge as table serverpod_auth_idp_passkey_challenge
--
CREATE TABLE "serverpod_auth_idp_passkey_challenge" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "createdAt" timestamp without time zone NOT NULL,
    "challenge" bytea NOT NULL
);

--
-- Class RateLimitedRequestAttempt as table serverpod_auth_idp_rate_limited_request_attempt
--
CREATE TABLE "serverpod_auth_idp_rate_limited_request_attempt" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "domain" text NOT NULL,
    "source" text NOT NULL,
    "key" text NOT NULL,
    "ipAddress" text,
    "attemptedAt" timestamp without time zone NOT NULL,
    "extraData" json
);

-- Indexes
CREATE INDEX "serverpod_auth_idp_rate_limited_request_attempt_composite" ON "serverpod_auth_idp_rate_limited_request_attempt" USING btree ("domain", "source", "key", "attemptedAt");

--
-- Class SecretChallenge as table serverpod_auth_idp_secret_challenge
--
CREATE TABLE "serverpod_auth_idp_secret_challenge" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "challengeCodeHash" text NOT NULL
);

--
-- Foreign relations for "admin_permissions" table
--
ALTER TABLE ONLY "admin_permissions"
    ADD CONSTRAINT "admin_permissions_fk_0"
    FOREIGN KEY("adminId")
    REFERENCES "admins"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "admins" table
--
ALTER TABLE ONLY "admins"
    ADD CONSTRAINT "admins_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "users"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "class_adjustment_requests" table
--
ALTER TABLE ONLY "class_adjustment_requests"
    ADD CONSTRAINT "class_adjustment_requests_fk_0"
    FOREIGN KEY("courseClassId")
    REFERENCES "course_classes"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "class_adjustment_requests"
    ADD CONSTRAINT "class_adjustment_requests_fk_1"
    FOREIGN KEY("lecturerId")
    REFERENCES "lecturers"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "class_adjustment_requests"
    ADD CONSTRAINT "class_adjustment_requests_fk_2"
    FOREIGN KEY("reviewedById")
    REFERENCES "admins"("id")
    ON DELETE SET NULL
    ON UPDATE NO ACTION;

--
-- Foreign relations for "class_approvals" table
--
ALTER TABLE ONLY "class_approvals"
    ADD CONSTRAINT "class_approvals_fk_0"
    FOREIGN KEY("courseClassId")
    REFERENCES "course_classes"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "class_approvals"
    ADD CONSTRAINT "class_approvals_fk_1"
    FOREIGN KEY("adminId")
    REFERENCES "admins"("id")
    ON DELETE RESTRICT
    ON UPDATE NO ACTION;

--
-- Foreign relations for "class_schedules" table
--
ALTER TABLE ONLY "class_schedules"
    ADD CONSTRAINT "class_schedules_fk_0"
    FOREIGN KEY("courseClassId")
    REFERENCES "course_classes"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "course_classes" table
--
ALTER TABLE ONLY "course_classes"
    ADD CONSTRAINT "course_classes_fk_0"
    FOREIGN KEY("courseId")
    REFERENCES "courses"("id")
    ON DELETE RESTRICT
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "course_classes"
    ADD CONSTRAINT "course_classes_fk_1"
    FOREIGN KEY("lecturerId")
    REFERENCES "lecturers"("id")
    ON DELETE RESTRICT
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "course_classes"
    ADD CONSTRAINT "course_classes_fk_2"
    FOREIGN KEY("semesterId")
    REFERENCES "semesters"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "course_opening_requests" table
--
ALTER TABLE ONLY "course_opening_requests"
    ADD CONSTRAINT "course_opening_requests_fk_0"
    FOREIGN KEY("studentId")
    REFERENCES "students"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "course_opening_requests"
    ADD CONSTRAINT "course_opening_requests_fk_1"
    FOREIGN KEY("courseId")
    REFERENCES "courses"("id")
    ON DELETE RESTRICT
    ON UPDATE NO ACTION;

--
-- Foreign relations for "courses" table
--
ALTER TABLE ONLY "courses"
    ADD CONSTRAINT "courses_fk_0"
    FOREIGN KEY("categoryId")
    REFERENCES "course_categories"("id")
    ON DELETE SET NULL
    ON UPDATE NO ACTION;

--
-- Foreign relations for "lecturer_activity_logs" table
--
ALTER TABLE ONLY "lecturer_activity_logs"
    ADD CONSTRAINT "lecturer_activity_logs_fk_0"
    FOREIGN KEY("lecturerId")
    REFERENCES "lecturers"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "lecturer_course_classes" table
--
ALTER TABLE ONLY "lecturer_course_classes"
    ADD CONSTRAINT "lecturer_course_classes_fk_0"
    FOREIGN KEY("lecturerId")
    REFERENCES "lecturers"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "lecturer_course_classes"
    ADD CONSTRAINT "lecturer_course_classes_fk_1"
    FOREIGN KEY("courseClassId")
    REFERENCES "course_classes"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "lecturers" table
--
ALTER TABLE ONLY "lecturers"
    ADD CONSTRAINT "lecturers_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "users"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "majors" table
--
ALTER TABLE ONLY "majors"
    ADD CONSTRAINT "majors_fk_0"
    FOREIGN KEY("facultyId")
    REFERENCES "faculties"("id")
    ON DELETE RESTRICT
    ON UPDATE NO ACTION;

--
-- Foreign relations for "processed_sync_operations" table
--
ALTER TABLE ONLY "processed_sync_operations"
    ADD CONSTRAINT "processed_sync_operations_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "users"("id")
    ON DELETE RESTRICT
    ON UPDATE NO ACTION;

--
-- Foreign relations for "registration_history" table
--
ALTER TABLE ONLY "registration_history"
    ADD CONSTRAINT "registration_history_fk_0"
    FOREIGN KEY("studentId")
    REFERENCES "students"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "registration_history"
    ADD CONSTRAINT "registration_history_fk_1"
    FOREIGN KEY("courseClassId")
    REFERENCES "course_classes"("id")
    ON DELETE RESTRICT
    ON UPDATE NO ACTION;

--
-- Foreign relations for "registration_periods" table
--
ALTER TABLE ONLY "registration_periods"
    ADD CONSTRAINT "registration_periods_fk_0"
    FOREIGN KEY("semesterId")
    REFERENCES "semesters"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "registration_periods"
    ADD CONSTRAINT "registration_periods_fk_1"
    FOREIGN KEY("updatedById")
    REFERENCES "admins"("id")
    ON DELETE SET NULL
    ON UPDATE NO ACTION;

--
-- Foreign relations for "registrations" table
--
ALTER TABLE ONLY "registrations"
    ADD CONSTRAINT "registrations_fk_0"
    FOREIGN KEY("studentId")
    REFERENCES "students"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "registrations"
    ADD CONSTRAINT "registrations_fk_1"
    FOREIGN KEY("courseClassId")
    REFERENCES "course_classes"("id")
    ON DELETE RESTRICT
    ON UPDATE NO ACTION;

--
-- Foreign relations for "student_transcripts" table
--
ALTER TABLE ONLY "student_transcripts"
    ADD CONSTRAINT "student_transcripts_fk_0"
    FOREIGN KEY("studentId")
    REFERENCES "students"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "student_transcripts"
    ADD CONSTRAINT "student_transcripts_fk_1"
    FOREIGN KEY("courseId")
    REFERENCES "courses"("id")
    ON DELETE RESTRICT
    ON UPDATE NO ACTION;

--
-- Foreign relations for "students" table
--
ALTER TABLE ONLY "students"
    ADD CONSTRAINT "students_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "users"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "students"
    ADD CONSTRAINT "students_fk_1"
    FOREIGN KEY("majorId")
    REFERENCES "majors"("id")
    ON DELETE SET NULL
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "students"
    ADD CONSTRAINT "students_fk_2"
    FOREIGN KEY("trainingProgramId")
    REFERENCES "training_programs"("id")
    ON DELETE SET NULL
    ON UPDATE NO ACTION;

--
-- Foreign relations for "sync_changes" table
--
ALTER TABLE ONLY "sync_changes"
    ADD CONSTRAINT "sync_changes_fk_0"
    FOREIGN KEY("targetUserId")
    REFERENCES "users"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "system_audit_logs" table
--
ALTER TABLE ONLY "system_audit_logs"
    ADD CONSTRAINT "system_audit_logs_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "users"("id")
    ON DELETE RESTRICT
    ON UPDATE NO ACTION;

--
-- Foreign relations for "teaching_schedule_proposals" table
--
ALTER TABLE ONLY "teaching_schedule_proposals"
    ADD CONSTRAINT "teaching_schedule_proposals_fk_0"
    FOREIGN KEY("lecturerId")
    REFERENCES "lecturers"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "teaching_schedule_proposals"
    ADD CONSTRAINT "teaching_schedule_proposals_fk_1"
    FOREIGN KEY("courseClassId")
    REFERENCES "course_classes"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "training_program_courses" table
--
ALTER TABLE ONLY "training_program_courses"
    ADD CONSTRAINT "training_program_courses_fk_0"
    FOREIGN KEY("trainingProgramId")
    REFERENCES "training_programs"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "training_program_courses"
    ADD CONSTRAINT "training_program_courses_fk_1"
    FOREIGN KEY("courseId")
    REFERENCES "courses"("id")
    ON DELETE RESTRICT
    ON UPDATE NO ACTION;

--
-- Foreign relations for "training_programs" table
--
ALTER TABLE ONLY "training_programs"
    ADD CONSTRAINT "training_programs_fk_0"
    FOREIGN KEY("majorId")
    REFERENCES "majors"("id")
    ON DELETE RESTRICT
    ON UPDATE NO ACTION;

--
-- Foreign relations for "serverpod_future_call_claim" table
--
ALTER TABLE ONLY "serverpod_future_call_claim"
    ADD CONSTRAINT "serverpod_future_call_claim_fk_0"
    FOREIGN KEY("futureCallId")
    REFERENCES "serverpod_future_call"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "serverpod_log" table
--
ALTER TABLE ONLY "serverpod_log"
    ADD CONSTRAINT "serverpod_log_fk_0"
    FOREIGN KEY("sessionLogId")
    REFERENCES "serverpod_session_log"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "serverpod_message_log" table
--
ALTER TABLE ONLY "serverpod_message_log"
    ADD CONSTRAINT "serverpod_message_log_fk_0"
    FOREIGN KEY("sessionLogId")
    REFERENCES "serverpod_session_log"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "serverpod_query_log" table
--
ALTER TABLE ONLY "serverpod_query_log"
    ADD CONSTRAINT "serverpod_query_log_fk_0"
    FOREIGN KEY("sessionLogId")
    REFERENCES "serverpod_session_log"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "serverpod_auth_core_jwt_refresh_token" table
--
ALTER TABLE ONLY "serverpod_auth_core_jwt_refresh_token"
    ADD CONSTRAINT "serverpod_auth_core_jwt_refresh_token_fk_0"
    FOREIGN KEY("authUserId")
    REFERENCES "serverpod_auth_core_user"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "serverpod_auth_core_profile" table
--
ALTER TABLE ONLY "serverpod_auth_core_profile"
    ADD CONSTRAINT "serverpod_auth_core_profile_fk_0"
    FOREIGN KEY("authUserId")
    REFERENCES "serverpod_auth_core_user"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "serverpod_auth_core_profile"
    ADD CONSTRAINT "serverpod_auth_core_profile_fk_1"
    FOREIGN KEY("imageId")
    REFERENCES "serverpod_auth_core_profile_image"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    DEFERRABLE INITIALLY DEFERRED;

--
-- Foreign relations for "serverpod_auth_core_profile_image" table
--
ALTER TABLE ONLY "serverpod_auth_core_profile_image"
    ADD CONSTRAINT "serverpod_auth_core_profile_image_fk_0"
    FOREIGN KEY("userProfileId")
    REFERENCES "serverpod_auth_core_profile"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "serverpod_auth_core_session" table
--
ALTER TABLE ONLY "serverpod_auth_core_session"
    ADD CONSTRAINT "serverpod_auth_core_session_fk_0"
    FOREIGN KEY("authUserId")
    REFERENCES "serverpod_auth_core_user"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "serverpod_auth_idp_anonymous_account" table
--
ALTER TABLE ONLY "serverpod_auth_idp_anonymous_account"
    ADD CONSTRAINT "serverpod_auth_idp_anonymous_account_fk_0"
    FOREIGN KEY("authUserId")
    REFERENCES "serverpod_auth_core_user"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "serverpod_auth_idp_apple_account" table
--
ALTER TABLE ONLY "serverpod_auth_idp_apple_account"
    ADD CONSTRAINT "serverpod_auth_idp_apple_account_fk_0"
    FOREIGN KEY("authUserId")
    REFERENCES "serverpod_auth_core_user"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "serverpod_auth_idp_email_account" table
--
ALTER TABLE ONLY "serverpod_auth_idp_email_account"
    ADD CONSTRAINT "serverpod_auth_idp_email_account_fk_0"
    FOREIGN KEY("authUserId")
    REFERENCES "serverpod_auth_core_user"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "serverpod_auth_idp_email_account_password_reset_request" table
--
ALTER TABLE ONLY "serverpod_auth_idp_email_account_password_reset_request"
    ADD CONSTRAINT "serverpod_auth_idp_email_account_password_reset_request_fk_0"
    FOREIGN KEY("emailAccountId")
    REFERENCES "serverpod_auth_idp_email_account"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "serverpod_auth_idp_email_account_password_reset_request"
    ADD CONSTRAINT "serverpod_auth_idp_email_account_password_reset_request_fk_1"
    FOREIGN KEY("challengeId")
    REFERENCES "serverpod_auth_idp_secret_challenge"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "serverpod_auth_idp_email_account_password_reset_request"
    ADD CONSTRAINT "serverpod_auth_idp_email_account_password_reset_request_fk_2"
    FOREIGN KEY("setPasswordChallengeId")
    REFERENCES "serverpod_auth_idp_secret_challenge"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "serverpod_auth_idp_email_account_request" table
--
ALTER TABLE ONLY "serverpod_auth_idp_email_account_request"
    ADD CONSTRAINT "serverpod_auth_idp_email_account_request_fk_0"
    FOREIGN KEY("challengeId")
    REFERENCES "serverpod_auth_idp_secret_challenge"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "serverpod_auth_idp_email_account_request"
    ADD CONSTRAINT "serverpod_auth_idp_email_account_request_fk_1"
    FOREIGN KEY("createAccountChallengeId")
    REFERENCES "serverpod_auth_idp_secret_challenge"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "serverpod_auth_idp_facebook_account" table
--
ALTER TABLE ONLY "serverpod_auth_idp_facebook_account"
    ADD CONSTRAINT "serverpod_auth_idp_facebook_account_fk_0"
    FOREIGN KEY("authUserId")
    REFERENCES "serverpod_auth_core_user"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "serverpod_auth_idp_firebase_account" table
--
ALTER TABLE ONLY "serverpod_auth_idp_firebase_account"
    ADD CONSTRAINT "serverpod_auth_idp_firebase_account_fk_0"
    FOREIGN KEY("authUserId")
    REFERENCES "serverpod_auth_core_user"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "serverpod_auth_idp_github_account" table
--
ALTER TABLE ONLY "serverpod_auth_idp_github_account"
    ADD CONSTRAINT "serverpod_auth_idp_github_account_fk_0"
    FOREIGN KEY("authUserId")
    REFERENCES "serverpod_auth_core_user"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "serverpod_auth_idp_google_account" table
--
ALTER TABLE ONLY "serverpod_auth_idp_google_account"
    ADD CONSTRAINT "serverpod_auth_idp_google_account_fk_0"
    FOREIGN KEY("authUserId")
    REFERENCES "serverpod_auth_core_user"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "serverpod_auth_idp_microsoft_account" table
--
ALTER TABLE ONLY "serverpod_auth_idp_microsoft_account"
    ADD CONSTRAINT "serverpod_auth_idp_microsoft_account_fk_0"
    FOREIGN KEY("authUserId")
    REFERENCES "serverpod_auth_core_user"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "serverpod_auth_idp_passkey_account" table
--
ALTER TABLE ONLY "serverpod_auth_idp_passkey_account"
    ADD CONSTRAINT "serverpod_auth_idp_passkey_account_fk_0"
    FOREIGN KEY("authUserId")
    REFERENCES "serverpod_auth_core_user"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR course_registration
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('course_registration', '20261007013843255-registration-adjustments', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20261007013843255-registration-adjustments', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20260824182259319', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260824182259319', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_core
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_core', '20260924105232991', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260924105232991', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_idp
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_idp', '20260924105404509', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260924105404509', "timestamp" = now();


COMMIT;
