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
-- ACTION CREATE TABLE
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
-- ACTION ALTER TABLE
--
ALTER TABLE "lecturers" ADD COLUMN "department" text;
ALTER TABLE "lecturers" ADD COLUMN "academicTitle" text;
ALTER TABLE "lecturers" ADD COLUMN "specialization" text;
--
-- ACTION CREATE TABLE
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
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "lecturer_activity_logs"
    ADD CONSTRAINT "lecturer_activity_logs_fk_0"
    FOREIGN KEY("lecturerId")
    REFERENCES "lecturers"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
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
-- ACTION CREATE FOREIGN KEY
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
-- MIGRATION VERSION FOR course_registration
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('course_registration', '20260930185206709-phase-5-lecturer', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260930185206709-phase-5-lecturer', "timestamp" = now();

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
