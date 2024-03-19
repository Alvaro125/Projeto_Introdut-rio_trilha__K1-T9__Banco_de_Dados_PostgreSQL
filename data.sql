CREATE TABLE "address" (
  "id" integer,
  "country" varchar(80) NOT NULL,
  "state" varchar(50) NOT NULL,
  "cep" char(8) NOT NULL
);

CREATE TABLE "people" (
  "id" integer PRIMARY KEY,
  "email" varchar NOT NULL,
  "name" varchar NOT NULL,
  "description" text NOT NULL,
  "address" integer NOT NULL,
  "password" varchar NOT NULL,
  "created_at" timestamp,
  "updated_at" timestamp,
  "deleted_at" timestamp
);

CREATE TABLE "naturalpeople" (
  "idPerson" integer,
  "cpf" varchar(11) UNIQUE NOT NULL,
  "age" integer NOT NULL
);

CREATE TABLE "legalpeople" (
  "idPerson" integer,
  "cnpj" varchar(14) UNIQUE NOT NULL
);

CREATE TABLE "skills" (
  "idPerson" integer,
  "title" varchar NOT NULL,
  "description" text
);

CREATE TABLE "jobs" (
  "id" integer PRIMARY KEY,
  "idLegalPerson" integer NOT NULL,
  "name" varchar NOT NULL,
  "description" text NOT NULL,
  "local" integer
);

CREATE TABLE "match" (
  "idJob" integer PRIMARY KEY,
  "likeNaturalPerson" integer,
  "status" integer DEFAULT 0
);

COMMENT ON COLUMN "match"."status" IS '1: accept
2: reject
';

ALTER TABLE "address" ADD FOREIGN KEY ("id") REFERENCES "people" ("id");

ALTER TABLE "naturalpeople" ADD FOREIGN KEY ("idPerson") REFERENCES "people" ("id");

ALTER TABLE "legalpeople" ADD FOREIGN KEY ("idPerson") REFERENCES "people" ("id");

ALTER TABLE "skills" ADD FOREIGN KEY ("idPerson") REFERENCES "people" ("id");

ALTER TABLE "jobs" ADD FOREIGN KEY ("idLegalPerson") REFERENCES "legalpeople" ("idPerson");

ALTER TABLE "jobs" ADD FOREIGN KEY ("local") REFERENCES "address" ("id");

ALTER TABLE "match" ADD FOREIGN KEY ("idJob") REFERENCES "jobs" ("id");

ALTER TABLE "match" ADD FOREIGN KEY ("likeNaturalPerson") REFERENCES "naturalpeople" ("idPerson");