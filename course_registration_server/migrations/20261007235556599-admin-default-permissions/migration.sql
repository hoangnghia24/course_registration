BEGIN;

-- Repair administrators created by the user-management flow before default
-- permission provisioning was added. Administrators that already have one or
-- more explicit permissions are intentionally left unchanged.
UPDATE "admins" AS admin
SET "permissionLevel" = 9
WHERE NOT EXISTS (
  SELECT 1
  FROM "admin_permissions" AS existing
  WHERE existing."adminId" = admin."id"
);

INSERT INTO "admin_permissions" (
  "id",
  "adminId",
  "permissionName",
  "createdAt"
)
SELECT
  gen_random_uuid_v7(),
  admin."id",
  permission."name",
  now()
FROM "admins" AS admin
CROSS JOIN (
  VALUES
    ('MANAGE_USER'),
    ('MANAGE_COURSE'),
    ('MANAGE_PROGRAM'),
    ('APPROVE_CLASS'),
    ('VIEW_REPORT'),
    ('VIEW_AUDIT')
) AS permission("name")
WHERE NOT EXISTS (
  SELECT 1
  FROM "admin_permissions" AS existing
  WHERE existing."adminId" = admin."id"
)
ON CONFLICT ("adminId", "permissionName") DO NOTHING;

--
-- MIGRATION VERSION FOR course_registration
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('course_registration', '20261007235556599-admin-default-permissions', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20261007235556599-admin-default-permissions', "timestamp" = now();

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
