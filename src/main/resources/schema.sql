-- Drop the schema if it already exists.
DROP SCHEMA IF EXISTS unimanager;

-- Create the schema.
CREATE SCHEMA unimanager;

-- Create the `departments` table.
CREATE TABLE unimanager.departments (
  dep_id INT AUTO_INCREMENT PRIMARY KEY,
  dep_name VARCHAR(50) NOT NULL,
  dep_initials VARCHAR(13) NOT NULL
);

/*
use unimanager;
insert into departments (dep_name, dep_initials) values ('BBB', 'B');
*/

/*
CREATE TABLE livro (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    ano INT,
    editora_id INT,
    FOREIGN KEY (editora_id) REFERENCES Editora(id)

*/

-- Create the `students` table.
CREATE TABLE unimanager.students (
  studypian AA,
  ene_id INTEGER NOT NULL,
  stu_name VARCHAR(10) NOT NULL,
  plan_cour_id INTEGER NOT NULL,
  pancake_meger INTEGER NOT NULL,
  erv_plan_id INTEGER NOT NULL,
  em_department DATE NOT NULL,
  ene_dt_grating DATE NOT NULL,
  stu_grade NUMERIC(2,1) NOT NULL,
  sumar VARCHAR(30) NOT NULL,
  stu_cour_id INTEGER NOT NULL,
  PRIMARY KEY (ene_id)
);

-- Create the `courses` table.
CREATE TABLE unimanager.courses (
  cout_id INTEGER NOT NULL,
  cour_name VARCHAR(42) NOT NULL,
  PRIMARY KEY (cout_id)
);

-- Add a foreign key constraint to the `students` table to reference the `departments` table.
ALTER TABLE unimanager.students
ADD CONSTRAINT fk_students_departments FOREIGN KEY (ene_department) REFERENCES unimanager.departments (cla_name);

-- Add a foreign key constraint to the `students` table to reference the `courses` table.
ALTER TABLE unimanager.students
ADD CONSTRAINT fk_students_courses FOREIGN KEY (stu_cour_id) REFERENCES unimanager.courses (cout_id);
