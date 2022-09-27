CREATE TABLE "users" (
  "id" uuid UNIQUE,
  "first_name" varchar NOT NULL,
  "last_name" varchar NOT NULL,
  "age" int NOT NULL,
  "email" varchar UNIQUE NOT NULL,
  "name_user" varchar UNIQUE NOT NULL,
  "password" varchar NOT NULL,
  "id_roles" uuid,
  "is_active" bool DEFAULT true,
  PRIMARY KEY ("id", "id_roles")
);

CREATE TABLE "courses" (
  "id" uuid UNIQUE,
  "title" varchar NOT NULL,
  "description" varchar NOT NULL,
  "id_level" uuid,
  "id_users" uuid UNIQUE,
  "id_category" uuid,
  "is_completed" bool DEFAULT false,
  PRIMARY KEY ("id", "id_level", "id_users", "id_category")
);

CREATE TABLE "videos" (
  "id" uuid UNIQUE,
  "name_video" varchar NOT NULL,
  "url" varchar NOT NULL,
  "id_level" uuid,
  PRIMARY KEY ("id", "id_level")
);

CREATE TABLE "course_video" (
  "id" uuid,
  "id_course" uuid UNIQUE,
  "id_video" uuid UNIQUE,
  PRIMARY KEY ("id", "id_course", "id_video")
);

CREATE TABLE "roles" (
  "id" uuid PRIMARY KEY,
  "name_roles" varchar NOT NULL
);

CREATE TABLE "levels" (
  "id" uuid PRIMARY KEY,
  "name_level" varchar NOT NULL
);

CREATE TABLE "categories" (
  "id" uuid PRIMARY KEY,
  "name_category" varchar NOT NULL
);

ALTER TABLE "courses" ADD FOREIGN KEY ("id_users") REFERENCES "users" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("id_level") REFERENCES "levels" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("id_category") REFERENCES "categories" ("id");

ALTER TABLE "videos" ADD FOREIGN KEY ("id_level") REFERENCES "levels" ("id");

ALTER TABLE "course_video" ADD FOREIGN KEY ("id_video") REFERENCES "videos" ("id");

ALTER TABLE "course_video" ADD FOREIGN KEY ("id_course") REFERENCES "courses" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("id_roles") REFERENCES "roles" ("id");





----creacion de datos

select * from categories
select * from course_video
select * from courses 
select * from levels 
select * from roles 
select * from users 
select * from videos 


---creacion de roles
insert into roles values ('d3c8e49a-875b-42a3-9218-24e80b865841', 'admin');
insert into roles values ('d3c8e49a-875b-42a3-9218-24e80b865842', 'teacher');
insert into roles values ('d3c8e49a-875b-42a3-9218-24e80b865843', 'student');


--creacion de levels
insert into levels values ('2cbc0bd8-3eab-11ed-b878-0242ac120001', 'beginner');
insert into levels values ('2cbc0bd8-3eab-11ed-b878-0242ac120002', 'intermediate');
insert into levels values ('2cbc0bd8-3eab-11ed-b878-0242ac120003', 'advanced');


--creacion de categories
insert into categories values ('7e5b2daa-3ead-11ed-b878-0242ac120001', 'Javascript');
insert into categories values ('7e5b2daa-3ead-11ed-b878-0242ac120002', 'HTML');
insert into categories values ('7e5b2daa-3ead-11ed-b878-0242ac120003', 'CSS');
insert into categories values ('7e5b2daa-3ead-11ed-b878-0242ac120004', 'React');

---creacion videos

insert into videos values('08267b02-3eae-11ed-b878-0242ac120001', 'Introduccion a javascript','https://youtu.be/2SetvwBV-SU', '2cbc0bd8-3eab-11ed-b878-0242ac120001');
insert into videos values('08267b02-3eae-11ed-b878-0242ac120002', 'HTML en 15 min','https://youtu.be/mNbnV3aN3KA', '2cbc0bd8-3eab-11ed-b878-0242ac120002');
insert into videos values('08267b02-3eae-11ed-b878-0242ac120003', 'CSS Animaciones','https://youtu.be/vbWRzI2bS6I', '2cbc0bd8-3eab-11ed-b878-0242ac120003');
insert into videos values('08267b02-3eae-11ed-b878-0242ac120004', 'React Desde cero','https://youtu.be/T_j60n1zgu0', '2cbc0bd8-3eab-11ed-b878-0242ac120002');

---creacion de usuario

insert into users values ('f85b0ef6-3eb0-11ed-b878-0242ac120002', 'Jonathan', 'Rodriguez', '30', 't3rry2492@hotmail.com', 't3rry2492', '123456789', 'd3c8e49a-875b-42a3-9218-24e80b865843', true);
insert into users values ('f85b0ef6-3eb0-11ed-b878-0242ac120003', 'David', 'Rodriguez', '30', 't3rry2492@gmail', 'david2492', 'root', 'd3c8e49a-875b-42a3-9218-24e80b865841',true);
insert into users values ('f85b0ef6-3eb0-11ed-b878-0242ac120004', 'Sahid', 'kick', '30', 'sahid123@gmail', 'sahid123', '4152637485', 'd3c8e49a-875b-42a3-9218-24e80b865842',true);

---creacion de courses 

insert into courses values ('86277bc4-3eb2-11ed-b878-0242ac120001', 'Introduccion de Javascript' , 'Instalacion de Visual Studio Code y funciones' ,'2cbc0bd8-3eab-11ed-b878-0242ac120001', 'f85b0ef6-3eb0-11ed-b878-0242ac120002' , '7e5b2daa-3ead-11ed-b878-0242ac120001', false) ;
insert into courses values ('86277bc4-3eb2-11ed-b878-0242ac120002', 'Introduccion de Javascript' , 'Explicacion De instalacion de visual studio code y funciones', '2cbc0bd8-3eab-11ed-b878-0242ac120001' , 'f85b0ef6-3eb0-11ed-b878-0242ac120004' ,'7e5b2daa-3ead-11ed-b878-0242ac120001', true) ;


--- creacion de course videos

insert into course_video values ('9d9950d8-3eb8-11ed-b878-0242ac120001', '86277bc4-3eb2-11ed-b878-0242ac120002','08267b02-3eae-11ed-b878-0242ac120001');
