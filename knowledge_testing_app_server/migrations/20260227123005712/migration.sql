BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "category" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "log" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "action" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "tag" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL
);

--
-- ACTION DROP TABLE
--
DROP TABLE "test" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "test" (
    "id" bigserial PRIMARY KEY,
    "title" text NOT NULL,
    "creatorId" bigint NOT NULL,
    "categoryId" bigint NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "test_tag" (
    "id" bigserial PRIMARY KEY,
    "testId" bigint NOT NULL,
    "tagId" bigint NOT NULL
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "test"
    ADD CONSTRAINT "test_fk_0"
    FOREIGN KEY("creatorId")
    REFERENCES "user"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "test"
    ADD CONSTRAINT "test_fk_1"
    FOREIGN KEY("categoryId")
    REFERENCES "category"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "test_tag"
    ADD CONSTRAINT "test_tag_fk_0"
    FOREIGN KEY("testId")
    REFERENCES "test"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "test_tag"
    ADD CONSTRAINT "test_tag_fk_1"
    FOREIGN KEY("tagId")
    REFERENCES "tag"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR knowledge_testing_app
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('knowledge_testing_app', '20260227123005712', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260227123005712', "timestamp" = now();

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
