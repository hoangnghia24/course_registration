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
-- ACTION CREATE TABLE
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
-- ACTION CREATE TABLE
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
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "processed_sync_operations"
    ADD CONSTRAINT "processed_sync_operations_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "users"("id")
    ON DELETE RESTRICT
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "sync_changes"
    ADD CONSTRAINT "sync_changes_fk_0"
    FOREIGN KEY("targetUserId")
    REFERENCES "users"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR course_registration
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('course_registration', '20261002085151398-phase-7-sync', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20261002085151398-phase-7-sync', "timestamp" = now();

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
