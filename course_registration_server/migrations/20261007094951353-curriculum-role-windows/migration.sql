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

-- Preserve all existing rows while extending the curriculum and registration
-- window models. Serverpod's generated drop/recreate plan is intentionally not
-- used here because both tables are referenced by live academic data.
ALTER TABLE "training_programs" ADD COLUMN "code" text;
UPDATE "training_programs" AS program
SET "code" = upper(regexp_replace(major."code", '[^A-Za-z0-9]+', '-', 'g'))
             || '-' || program."academicYear"::text
FROM "majors" AS major
WHERE major."id" = program."majorId";
ALTER TABLE "training_programs" ALTER COLUMN "code" SET NOT NULL;
ALTER TABLE "training_programs" ADD COLUMN "semesterCount" bigint NOT NULL DEFAULT 8;
ALTER TABLE "training_programs" ALTER COLUMN "semesterCount" DROP DEFAULT;
ALTER TABLE "training_programs" ADD COLUMN "status" text NOT NULL DEFAULT 'active';
ALTER TABLE "training_programs" ALTER COLUMN "status" DROP DEFAULT;
CREATE UNIQUE INDEX "training_programs_code_unique"
    ON "training_programs" USING btree ("code");
ALTER TABLE "training_programs"
    ADD CONSTRAINT "training_programs_semester_count_check"
    CHECK ("semesterCount" BETWEEN 1 AND 20),
    ADD CONSTRAINT "training_programs_total_credits_check"
    CHECK ("totalCredits" BETWEEN 1 AND 300),
    ADD CONSTRAINT "training_programs_status_check"
    CHECK ("status" IN ('draft', 'active', 'archived'));

ALTER TABLE "registration_periods" ADD COLUMN "lecturerStartTime" timestamp without time zone;
ALTER TABLE "registration_periods" ADD COLUMN "lecturerEndTime" timestamp without time zone;
ALTER TABLE "registration_periods" ADD COLUMN "status" text;
UPDATE "registration_periods"
SET "lecturerStartTime" = "startTime",
    "lecturerEndTime" = "endTime",
    "status" = 'active';
ALTER TABLE "registration_periods" ALTER COLUMN "lecturerStartTime" SET NOT NULL;
ALTER TABLE "registration_periods" ALTER COLUMN "lecturerEndTime" SET NOT NULL;
ALTER TABLE "registration_periods" ALTER COLUMN "status" SET NOT NULL;
ALTER TABLE "registration_periods"
    ADD CONSTRAINT "registration_periods_student_window_check"
    CHECK ("startTime" < "endTime"),
    ADD CONSTRAINT "registration_periods_lecturer_window_check"
    CHECK ("lecturerStartTime" < "lecturerEndTime"),
    ADD CONSTRAINT "registration_periods_status_check"
    CHECK ("status" IN ('draft', 'active', 'closed'));

ALTER TABLE "training_program_courses"
    ADD CONSTRAINT "training_program_courses_semester_check"
    CHECK ("semesterNumber" BETWEEN 1 AND 20);
ALTER TABLE "course_classes"
    ADD CONSTRAINT "course_classes_capacity_check"
    CHECK ("capacity" > 0 AND "registeredCount" >= 0 AND "registeredCount" <= "capacity");
ALTER TABLE "class_schedules"
    ADD CONSTRAINT "class_schedules_period_check"
    CHECK ("dayOfWeek" BETWEEN 2 AND 8 AND "startPeriod" >= 1 AND "endPeriod" >= "startPeriod" AND "endPeriod" <= 20);

--
-- MIGRATION VERSION FOR course_registration
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('course_registration', '20261007094951353-curriculum-role-windows', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20261007094951353-curriculum-role-windows', "timestamp" = now();

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
