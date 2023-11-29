-- Drop the schema if it already exists.
DROP SCHEMA IF EXISTS unimanager;

-- Create the schema.
CREATE SCHEMA unimanager;

-- Create the `departments` table.
CREATE TABLE unimanager.departments (
  dep_id INTEGER AUTO_INCREMENT PRIMARY KEY,
  dep_name VARCHAR(50) NOT NULL,
  dep_initials VARCHAR(13) NOT NULL
);

-- Create the `classes` table.
CREATE TABLE unimanager.classes (
  cla_id INTEGER AUTO_INCREMENT PRIMARY KEY,
  cla_name VARCHAR(40) NOT NULL,
  cla_credits INTEGER NOT NULL,
  cla_dep_id INTEGER NOT NULL
);

-- Create the `courses` table.
CREATE TABLE unimanager.courses (
  cour_id INTEGER AUTO_INCREMENT PRIMARY KEY,
  cour_name VARCHAR(40) NOT NULL
);

-- Create the `students` table.
CREATE TABLE unimanager.students (
  stu_id INTEGER AUTO_INCREMENT PRIMARY KEY,
  stu_name VARCHAR(60) NOT NULL,
  stu_place VARCHAR(30) NOT NULL,
  stu_bdate DATE NOT NULL,
  stu_gender CHAR(1) NOT NULL,
  stu_email VARCHAR(30) NOT NULL,
  stu_cour_id INTEGER NOT NULL
);

-- Create the `studyplans` table.
CREATE TABLE unimanager.studyplans (
  plan_id INTEGER AUTO_INCREMENT PRIMARY KEY,
  plan_cour_id INTEGER NOT NULL,
  plan_cla_id INTEGER NOT NULL,
  plan_semester INTEGER NOT NULL
);

-- Create the `enrollment` table.
CREATE TABLE unimanager.enrollment (
  enr_id INTEGER AUTO_INCREMENT PRIMARY KEY,
  enr_stud_id INTEGER NOT NULL,
  enr_plan_id INTEGER NOT NULL,
  enr_dt_enrollment DATE NOT NULL,
  enr_dt_grading DATE NOT NULL,
  enr_grade NUMERIC(4, 2) NOT NULL
);

-- Add a foreign key constraint to the `students` table to reference the `courses` table.
ALTER TABLE unimanager.students
ADD CONSTRAINT fk_students_courses FOREIGN KEY (stu_cour_id) REFERENCES unimanager.courses (cour_id);

-- Add a foreign key constraint to the `classes` table to reference the `departments` table.
ALTER TABLE unimanager.classes
ADD CONSTRAINT fk_classes_departments FOREIGN KEY (cla_dep_id) REFERENCES unimanager.departments (dep_id);

-- Add a foreign key constraint to the `studyplans` table to reference the `courses` table.
ALTER TABLE unimanager.studyplans
ADD CONSTRAINT fk_studyplans_courses FOREIGN KEY (plan_cour_id) REFERENCES unimanager.courses (cour_id);

-- Add a foreign key constraint to the `studyplans` table to reference the `classes` table.
ALTER TABLE unimanager.studyplans
ADD CONSTRAINT fk_studyplans_classes FOREIGN KEY (plan_cla_id) REFERENCES unimanager.classes (cla_id);

-- Add a foreign key constraint to the `enrollment` table to reference the `students` table.
ALTER TABLE unimanager.enrollment
ADD CONSTRAINT fk_enrollment_students FOREIGN KEY (enr_stud_id) REFERENCES unimanager.students (stu_id);

-- Add a foreign key constraint to the `enrollment` table to reference the `studyplans` table.
ALTER TABLE unimanager.enrollment
ADD CONSTRAINT fk_enrollment_studyplans FOREIGN KEY (enr_plan_id) REFERENCES unimanager.studyplans (plan_id);