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
-- ACTION CREATE TABLE
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
-- ACTION CREATE TABLE
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

--
-- ACTION CREATE TABLE
--
CREATE TABLE "course_equivalents" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "courseId" uuid NOT NULL,
    "equivalentId" uuid NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "course_equivalents_unique" ON "course_equivalents" USING btree ("courseId", "equivalentId");

--
-- ACTION CREATE TABLE
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
-- ACTION CREATE TABLE
--
CREATE TABLE "course_prerequisites" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "courseId" uuid NOT NULL,
    "prerequisiteId" uuid NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "course_prerequisites_unique" ON "course_prerequisites" USING btree ("courseId", "prerequisiteId");

--
-- ACTION CREATE TABLE
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
-- ACTION CREATE TABLE
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

--
-- ACTION CREATE TABLE
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
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "class_schedules"
    ADD CONSTRAINT "class_schedules_fk_0"
    FOREIGN KEY("courseClassId")
    REFERENCES "course_classes"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
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
-- ACTION CREATE FOREIGN KEY
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
-- ACTION CREATE FOREIGN KEY
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
-- ACTION CREATE FOREIGN KEY
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
-- MIGRATION VERSION FOR course_registration
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('course_registration', '20260930183339078-phase-4-registration', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260930183339078-phase-4-registration', "timestamp" = now();

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
