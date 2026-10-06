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
CREATE TABLE "courses" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "courseCode" text NOT NULL,
    "courseName" text NOT NULL,
    "credits" bigint NOT NULL,
    "description" text,
    "courseType" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE UNIQUE INDEX "courses_course_code_unique" ON "courses" USING btree ("courseCode");

--
-- ACTION CREATE TABLE
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
-- ACTION CREATE TABLE
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
-- ACTION CREATE TABLE
--
CREATE TABLE "student_transcripts" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "studentId" uuid NOT NULL,
    "courseId" uuid NOT NULL,
    "semester" text NOT NULL,
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
-- ACTION ALTER TABLE
--
ALTER TABLE "students" ADD COLUMN "trainingProgramId" uuid;
ALTER TABLE "students" ADD COLUMN "enrollmentYear" bigint NOT NULL DEFAULT 0;
ALTER TABLE "students" ADD COLUMN "currentSemester" bigint NOT NULL DEFAULT 1;
--
-- ACTION CREATE TABLE
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
-- ACTION CREATE TABLE
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
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "majors"
    ADD CONSTRAINT "majors_fk_0"
    FOREIGN KEY("facultyId")
    REFERENCES "faculties"("id")
    ON DELETE RESTRICT
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
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
-- ACTION CREATE FOREIGN KEY
--
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
-- ACTION CREATE FOREIGN KEY
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
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "training_programs"
    ADD CONSTRAINT "training_programs_fk_0"
    FOREIGN KEY("majorId")
    REFERENCES "majors"("id")
    ON DELETE RESTRICT
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR course_registration
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('course_registration', '20260930181256407-phase-3-student', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260930181256407-phase-3-student', "timestamp" = now();

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
