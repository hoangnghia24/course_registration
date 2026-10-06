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
CREATE TABLE "admins" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "userId" uuid NOT NULL,
    "permissionLevel" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "admins_user_id_unique" ON "admins" USING btree ("userId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "lecturers" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "userId" uuid NOT NULL,
    "lecturerCode" text NOT NULL,
    "facultyId" uuid,
    "academicDegree" text
);

-- Indexes
CREATE UNIQUE INDEX "lecturers_user_id_unique" ON "lecturers" USING btree ("userId");
CREATE UNIQUE INDEX "lecturers_lecturer_code_unique" ON "lecturers" USING btree ("lecturerCode");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "students" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "userId" uuid NOT NULL,
    "studentCode" text NOT NULL,
    "majorId" uuid,
    "academicYear" bigint NOT NULL,
    "gpa" double precision NOT NULL,
    "totalCredits" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "students_user_id_unique" ON "students" USING btree ("userId");
CREATE UNIQUE INDEX "students_student_code_unique" ON "students" USING btree ("studentCode");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "users" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "authUserId" uuid NOT NULL,
    "email" text NOT NULL,
    "fullName" text NOT NULL,
    "phone" text,
    "avatar" text,
    "role" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE UNIQUE INDEX "users_auth_user_id_unique" ON "users" USING btree ("authUserId");
CREATE UNIQUE INDEX "users_email_unique" ON "users" USING btree ("email");

--
-- ACTION ALTER TABLE
--
ALTER TABLE "serverpod_cloud_storage" ADD COLUMN "contentType" text;
ALTER TABLE "serverpod_cloud_storage" ADD COLUMN "cacheControl" text;
ALTER TABLE "serverpod_cloud_storage" ADD COLUMN "contentDisposition" text;
ALTER TABLE "serverpod_cloud_storage" ADD COLUMN "contentEncoding" text;
ALTER TABLE "serverpod_cloud_storage" ADD COLUMN "customMetadata" text;
--
-- ACTION CREATE TABLE
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
-- ACTION ALTER TABLE
--
ALTER TABLE "serverpod_cloud_storage_direct_upload" ADD COLUMN "maxFileSize" bigint NOT NULL DEFAULT 10485760;
ALTER TABLE "serverpod_cloud_storage_direct_upload" ADD COLUMN "contentLength" bigint;
ALTER TABLE "serverpod_cloud_storage_direct_upload" ADD COLUMN "preventOverwrite" boolean NOT NULL DEFAULT false;
ALTER TABLE "serverpod_cloud_storage_direct_upload" ADD COLUMN "contentType" text;
ALTER TABLE "serverpod_cloud_storage_direct_upload" ADD COLUMN "cacheControl" text;
ALTER TABLE "serverpod_cloud_storage_direct_upload" ADD COLUMN "contentDisposition" text;
ALTER TABLE "serverpod_cloud_storage_direct_upload" ADD COLUMN "contentEncoding" text;
ALTER TABLE "serverpod_cloud_storage_direct_upload" ADD COLUMN "customMetadata" text;
--
-- ACTION ALTER TABLE
--
ALTER TABLE "serverpod_future_call" ADD COLUMN "scheduling" json;
--
-- ACTION CREATE TABLE
--
CREATE TABLE "serverpod_future_call_claim" (
    "id" bigserial PRIMARY KEY,
    "futureCallId" bigint,
    "lastHeartbeatTime" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "future_call_unique_idx" ON "serverpod_future_call_claim" USING btree ("futureCallId");

--
-- ACTION ALTER TABLE
--
DROP INDEX "serverpod_log_sessionLogId_idx";
CREATE INDEX "serverpod_log_sessionLogId_idx" ON "serverpod_log" USING btree ("sessionLogId", "order");
--
-- ACTION ALTER TABLE
--
CREATE INDEX "serverpod_message_log_sessionLogId_idx" ON "serverpod_message_log" USING btree ("sessionLogId", "order");
--
-- ACTION ALTER TABLE
--
DROP INDEX "serverpod_query_log_sessionLogId_idx";
CREATE INDEX "serverpod_query_log_sessionLogId_idx" ON "serverpod_query_log" USING btree ("sessionLogId", "order");
--
-- ACTION ALTER TABLE
--
ALTER TABLE "serverpod_auth_core_profile" DROP CONSTRAINT IF EXISTS "serverpod_auth_core_profile_fk_1";
--
-- ACTION DROP TABLE
--
DROP TABLE "serverpod_auth_idp_rate_limited_request_attempt" CASCADE;

--
-- ACTION CREATE TABLE
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
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "admins"
    ADD CONSTRAINT "admins_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "users"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "lecturers"
    ADD CONSTRAINT "lecturers_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "users"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "students"
    ADD CONSTRAINT "students_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "users"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "serverpod_future_call_claim"
    ADD CONSTRAINT "serverpod_future_call_claim_fk_0"
    FOREIGN KEY("futureCallId")
    REFERENCES "serverpod_future_call"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "serverpod_auth_core_profile"
    ADD CONSTRAINT "serverpod_auth_core_profile_fk_1"
    FOREIGN KEY("imageId")
    REFERENCES "serverpod_auth_core_profile_image"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    DEFERRABLE INITIALLY DEFERRED;

--
-- MIGRATION VERSION FOR course_registration
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('course_registration', '20260930174219689-phase-2-core', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260930174219689-phase-2-core', "timestamp" = now();

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
