BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "attempt" DROP COLUMN "score";
ALTER TABLE "attempt" DROP COLUMN "maxScore";
--
-- ACTION CREATE TABLE
--
CREATE TABLE "result" (
    "id" bigserial PRIMARY KEY,
    "attemptId" bigint NOT NULL,
    "score" bigint NOT NULL,
    "maxScore" bigint NOT NULL,
    "percentage" double precision NOT NULL,
    "passed" boolean NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "attempt_unique" ON "result" USING btree ("attemptId");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "result"
    ADD CONSTRAINT "result_fk_0"
    FOREIGN KEY("attemptId")
    REFERENCES "attempt"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR knowledge_testing_app
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('knowledge_testing_app', '20260311152650023', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260311152650023', "timestamp" = now();

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
