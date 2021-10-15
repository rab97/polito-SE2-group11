PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "desk" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "free" boolean NOT NULL DEFAULT (0));
INSERT INTO desk VALUES(1,0);
INSERT INTO desk VALUES(2,0);
INSERT INTO desk VALUES(3,0);
INSERT INTO desk VALUES(4,0);
CREATE TABLE IF NOT EXISTS "service" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar NOT NULL, "prefix" varchar NOT NULL DEFAULT (''), "serviceTime" integer NOT NULL);
INSERT INTO service VALUES(1,'Parcels','P',10);
INSERT INTO service VALUES(2,'Accounting','A',5);
INSERT INTO service VALUES(3,'Financial','F',15);
CREATE TABLE IF NOT EXISTS "service_desks_desk" ("serviceId" integer NOT NULL, "deskId" integer NOT NULL, CONSTRAINT "FK_9cf0eb8508fc18bd8297bf1e62f" FOREIGN KEY ("serviceId") REFERENCES "service" ("id") ON DELETE CASCADE ON UPDATE CASCADE, CONSTRAINT "FK_b4226abe065e70b589acedeb7a0" FOREIGN KEY ("deskId") REFERENCES "desk" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION, PRIMARY KEY ("serviceId", "deskId"));
INSERT INTO service_desks_desk VALUES(1,1);
INSERT INTO service_desks_desk VALUES(2,1);
INSERT INTO service_desks_desk VALUES(2,3);
INSERT INTO service_desks_desk VALUES(2,4);
INSERT INTO service_desks_desk VALUES(3,2);
INSERT INTO service_desks_desk VALUES(3,3);
DELETE FROM sqlite_sequence;
INSERT INTO sqlite_sequence VALUES('desk',4);
INSERT INTO sqlite_sequence VALUES('service',3);
-- CREATE INDEX "IDX_9cf0eb8508fc18bd8297bf1e62" ON "service_desks_desk" ("serviceId") ;
-- CREATE INDEX "IDX_b4226abe065e70b589acedeb7a" ON "service_desks_desk" ("deskId") ;
COMMIT;
