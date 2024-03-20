use "linketinder"
CREATE TABLE "address" (
  "id" integer PRIMARY KEY,
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

INSERT INTO public.people ("id", "email", "name", "description", "address", "password", "created_at", "updated_at", "deleted_at") VALUES (1, 'john.doe@example.com', 'John Doe', 'Description for John Doe', 1, 'password123', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL);
INSERT INTO public.people ("id", "email", "name", "description", "address", "password", "created_at", "updated_at", "deleted_at") VALUES (2, 'jane.doe@example.com', 'Jane Doe', 'Description for Jane Doe', 2, 'password456', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL);
INSERT INTO public.people ("id", "email", "name", "description", "address", "password", "created_at", "updated_at", "deleted_at") VALUES (3, 'alice.smith@example.com', 'Alice Smith', 'Description for Alice Smith', 3, 'password789', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL);
INSERT INTO public.people ("id", "email", "name", "description", "address", "password", "created_at", "updated_at", "deleted_at") VALUES (4, 'bob.johnson@example.com', 'Bob Johnson', 'Description for Bob Johnson', 4, 'passwordabc', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL);
INSERT INTO public.people ("id", "email", "name", "description", "address", "password", "created_at", "updated_at", "deleted_at") VALUES (5, 'emma.watson@example.com', 'Emma Watson', 'Description for Emma Watson', 5, 'passworddef', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL);
INSERT INTO public.people ("id", "email", "name", "description", "address", "password", "created_at", "updated_at", "deleted_at") VALUES (6, 'joao@example.com', 'João', 'Description 1', 6, 'senha123', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL);
INSERT INTO public.people ("id", "email", "name", "description", "address", "password", "created_at", "updated_at", "deleted_at") VALUES (7, 'maria@example.com', 'Maria', 'Description 2', 7, 'senha456', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL);
INSERT INTO public.people ("id", "email", "name", "description", "address", "password", "created_at", "updated_at", "deleted_at") VALUES (8, 'carlos@example.com', 'Carlos', 'Description 3', 8, 'senha789', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL);
INSERT INTO public.people ("id", "email", "name", "description", "address", "password", "created_at", "updated_at", "deleted_at") VALUES (9, 'ana@example.com', 'Ana', 'Description 4', 9, 'senha101112', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL);
INSERT INTO public.people ("id", "email", "name", "description", "address", "password", "created_at", "updated_at", "deleted_at") VALUES (10, 'pedro@example.com', 'Pedro', 'Description 5', 10, 'senha131415', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL);

INSERT INTO public.address ("id", "country", "state", "cep") VALUES (1, 'Brazil', 'Sao Paulo', '01001000');
INSERT INTO public.address ("id", "country", "state", "cep") VALUES (2, 'Brazil', 'Rio de Janeiro', '20040000');
INSERT INTO public.address ("id", "country", "state", "cep") VALUES (3, 'Brazil', 'Brasilia', '70000000');
INSERT INTO public.address ("id", "country", "state", "cep") VALUES (4, 'Brazil', 'Salvador', '40000000');
INSERT INTO public.address ("id", "country", "state", "cep") VALUES (5, 'Brazil', 'Fortaleza', '60000000');
INSERT INTO public.address ("id", "country", "state", "cep") VALUES (6, 'Brasil', 'São Paulo', '01001000');
INSERT INTO public.address ("id", "country", "state", "cep") VALUES (7, 'Brasil', 'Rio de Janeiro', '20040001');
INSERT INTO public.address ("id", "country", "state", "cep") VALUES (8, 'Brasil', 'Minas Gerais', '30110010');
INSERT INTO public.address ("id", "country", "state", "cep") VALUES (9, 'Brasil', 'Bahia', '40010000');
INSERT INTO public.address ("id", "country", "state", "cep") VALUES (10, 'Brasil', 'Paraná', '80010000');

INSERT INTO public.legalpeople ("idPerson", "cnpj") VALUES (1, '12345678000100');
INSERT INTO public.legalpeople ("idPerson", "cnpj") VALUES (2, '98765432000101');
INSERT INTO public.legalpeople ("idPerson", "cnpj") VALUES (3, '24680135000102');
INSERT INTO public.legalpeople ("idPerson", "cnpj") VALUES (4, '13579246000103');
INSERT INTO public.legalpeople ("idPerson", "cnpj") VALUES (5, '11223344000104');

INSERT INTO public.naturalpeople ("idPerson", "cpf", "age") VALUES (1, '12345678900', 30);
INSERT INTO public.naturalpeople ("idPerson", "cpf", "age") VALUES (2, '98765432100', 25);
INSERT INTO public.naturalpeople ("idPerson", "cpf", "age") VALUES (3, '24680135700', 40);
INSERT INTO public.naturalpeople ("idPerson", "cpf", "age") VALUES (4, '13579246800', 35);
INSERT INTO public.naturalpeople ("idPerson", "cpf", "age") VALUES (5, '11223344500', 45);

