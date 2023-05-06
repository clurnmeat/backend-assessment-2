CREATE TABLE "public.user" (
	"id" serial NOT NULL,
	"password" integer NOT NULL,
	"is_employee" BOOLEAN NOT NULL,
	"name" varchar NOT NULL,
	"pet_type" varchar NOT NULL,
	"email" varchar NOT NULL,
	"address" TEXT NOT NULL,
	"zipcode" integer NOT NULL,
	CONSTRAINT "user_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "private.auth" (
	"id" serial NOT NULL,
	"user_id" integer NOT NULL,
	"password_hash" varchar NOT NULL,
	CONSTRAINT "auth_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.employees" (
	"id" serial NOT NULL,
	"user_id" integer NOT NULL,
	"dept_code" integer NOT NULL,
	"em_contact" varchar NOT NULL,
	"SSN" integer NOT NULL,
	CONSTRAINT "employees_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.department" (
	"id" serial NOT NULL,
	"name" varchar NOT NULL,
	"location" TEXT NOT NULL,
	CONSTRAINT "department_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.order" (
	"id" serial NOT NULL,
	"user_id" integer NOT NULL,
	"choice_id" integer NOT NULL,
	CONSTRAINT "order_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.cats" (
	"id" serial NOT NULL,
	"breed" varchar NOT NULL,
	"hair-length" varchar NOT NULL,
	"gender" varchar NOT NULL,
	CONSTRAINT "cats_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.choice" (
	"id" serial NOT NULL,
	"cat_id" integer NOT NULL,
	"dog_id" integer NOT NULL,
	CONSTRAINT "choice_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.dogs" (
	"id" serial NOT NULL,
	"size" varchar NOT NULL,
	"breed" varchar NOT NULL,
	"weight" integer NOT NULL,
	CONSTRAINT "dogs_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



ALTER TABLE "user" ADD CONSTRAINT "user_fk0" FOREIGN KEY ("password") REFERENCES "auth"("password_hash");

ALTER TABLE "auth" ADD CONSTRAINT "auth_fk0" FOREIGN KEY ("user_id") REFERENCES "user"("id");

ALTER TABLE "employees" ADD CONSTRAINT "employees_fk0" FOREIGN KEY ("user_id") REFERENCES "user"("id");
ALTER TABLE "employees" ADD CONSTRAINT "employees_fk1" FOREIGN KEY ("dept_code") REFERENCES "department"("id");


ALTER TABLE "order" ADD CONSTRAINT "order_fk0" FOREIGN KEY ("user_id") REFERENCES "user"("id");
ALTER TABLE "order" ADD CONSTRAINT "order_fk1" FOREIGN KEY ("choice_id") REFERENCES "choice"("id");


ALTER TABLE "choice" ADD CONSTRAINT "choice_fk0" FOREIGN KEY ("cat_id") REFERENCES "cats"("id");
ALTER TABLE "choice" ADD CONSTRAINT "choice_fk1" FOREIGN KEY ("dog_id") REFERENCES "dogs"("id");










