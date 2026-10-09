BEGIN;

-- Each application account must expose only the scope that matches its role.
-- This repairs accounts created while the global auth hook appended `student`
-- to lecturer and administrator scopes.
UPDATE "serverpod_auth_core_user" AS auth_user
SET "scopeNames" = json_build_array(app_user."role")
FROM "users" AS app_user
WHERE app_user."authUserId" = auth_user."id"
  AND auth_user."scopeNames"::jsonb IS DISTINCT FROM
      json_build_array(app_user."role")::jsonb;

-- Keep existing server-side sessions and refresh tokens consistent. Existing
-- short-lived access tokens remain protected by role-record checks and will
-- receive the corrected scope when refreshed.
UPDATE "serverpod_auth_core_session" AS auth_session
SET "scopeNames" = json_build_array(app_user."role")
FROM "users" AS app_user
WHERE app_user."authUserId" = auth_session."authUserId"
  AND auth_session."scopeNames"::jsonb IS DISTINCT FROM
      json_build_array(app_user."role")::jsonb;

UPDATE "serverpod_auth_core_jwt_refresh_token" AS refresh_token
SET "scopeNames" = json_build_array(app_user."role")
FROM "users" AS app_user
WHERE app_user."authUserId" = refresh_token."authUserId"
  AND refresh_token."scopeNames"::jsonb IS DISTINCT FROM
      json_build_array(app_user."role")::jsonb;

--
-- MIGRATION VERSION FOR course_registration
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('course_registration', '20261008001228094-role-scope-consistency', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20261008001228094-role-scope-consistency', "timestamp" = now();

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
