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
CREATE TABLE "admin_permissions" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "adminId" uuid NOT NULL,
    "permissionName" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE UNIQUE INDEX "admin_permissions_unique" ON "admin_permissions" USING btree ("adminId", "permissionName");

--
-- ACTION CREATE TABLE
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
-- ACTION CREATE TABLE
--
CREATE TABLE "course_categories" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "name" text NOT NULL,
    "description" text
);

-- Indexes
CREATE UNIQUE INDEX "course_categories_name_unique" ON "course_categories" USING btree ("name");

--
-- ACTION ALTER TABLE
--
ALTER TABLE "courses" ADD COLUMN "categoryId" uuid;
--
-- ACTION CREATE TABLE
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
-- ACTION ALTER TABLE
--
ALTER TABLE "users" ADD COLUMN "isActive" boolean NOT NULL DEFAULT true;
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "admin_permissions"
    ADD CONSTRAINT "admin_permissions_fk_0"
    FOREIGN KEY("adminId")
    REFERENCES "admins"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
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
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "courses"
    ADD CONSTRAINT "courses_fk_0"
    FOREIGN KEY("categoryId")
    REFERENCES "course_categories"("id")
    ON DELETE SET NULL
    ON UPDATE NO ACTION;
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "system_audit_logs"
    ADD CONSTRAINT "system_audit_logs_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "users"("id")
    ON DELETE RESTRICT
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR course_registration
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('course_registration', '20260930193514398-phase-6-admin', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260930193514398-phase-6-admin', "timestamp" = now();

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
