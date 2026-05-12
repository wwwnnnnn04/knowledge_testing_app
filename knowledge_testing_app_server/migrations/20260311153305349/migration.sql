BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "certificate" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "testId" bigint NOT NULL,
    "attemptId" bigint NOT NULL,
    "percentage" double precision NOT NULL
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "certificate"
    ADD CONSTRAINT "certificate_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "user"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "certificate"
    ADD CONSTRAINT "certificate_fk_1"
    FOREIGN KEY("testId")
    REFERENCES "test"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "certificate"
    ADD CONSTRAINT "certificate_fk_2"
    FOREIGN KEY("attemptId")
    REFERENCES "attempt"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR knowledge_testing_app
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('knowledge_testing_app', '20260311153305349', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260311153305349', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20251208110333922-v3-0-0', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251208110333922-v3-0-0', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_idp
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_idp', '20251208110420531-v3-0-0', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251208110420531-v3-0-0', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_core
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_core', '20251208110412389-v3-0-0', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251208110412389-v3-0-0', "timestamp" = now();


COMMIT;
