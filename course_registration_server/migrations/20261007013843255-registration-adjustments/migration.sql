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
-- ACTION CREATE TABLE
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
-- ACTION CREATE FOREIGN KEY
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
-- ACTION CREATE FOREIGN KEY
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
