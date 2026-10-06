BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "student_transcripts" ADD COLUMN "midtermScore" double precision;
ALTER TABLE "student_transcripts" ADD COLUMN "finalScore" double precision;

--
-- MIGRATION VERSION FOR course_registration
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('course_registration', '20261006212016344-lecturer-grades', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20261006212016344-lecturer-grades', "timestamp" = now();

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
