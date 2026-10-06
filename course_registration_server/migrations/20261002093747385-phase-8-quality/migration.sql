BEGIN;

--
-- ACTION ALTER TABLE
--
CREATE INDEX "course_classes_course_idx" ON "course_classes" USING btree ("courseId");
--
-- ACTION ALTER TABLE
--
CREATE INDEX "course_equivalents_equivalent_idx" ON "course_equivalents" USING btree ("equivalentId");
--
-- ACTION ALTER TABLE
--
CREATE INDEX "registrations_class_status_idx" ON "registrations" USING btree ("courseClassId", "status");

--
-- MIGRATION VERSION FOR course_registration
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('course_registration', '20261002093747385-phase-8-quality', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20261002093747385-phase-8-quality', "timestamp" = now();

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
