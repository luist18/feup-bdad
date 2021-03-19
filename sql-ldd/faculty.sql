PRAGMA foreign_keys = ON;

/* Student schema */
DROP TABLE IF EXISTS student;

CREATE TABLE student (
  number INTEGER,
  name TEXT NOT NULL,
  CONSTRAINT student_pk PRIMARY KEY (number)
);

/* Prof schema */
DROP TABLE IF EXISTS prof;

CREATE TABLE prof (
  acronym TEXT,
  name NOT NULL,
  CONSTRAINT prof_pk PRIMARY KEY (acronym)
);

/* Course unit schema */
DROP TABLE IF EXISTS course_unit;

CREATE TABLE course_unit (
  code TEXT,
  designation TEXT,
  course TEXT NOT NULL,
  teaching_prof TEXT NOT NULL, /* idk i think that foreign keys can be NULL but not sure im tired and want to watch drive to survive :| */
  CONSTRAINT course_unit_pk PRIMARY KEY (code),
  CONSTRAINT course_unit_teaching_prof_fk FOREIGN KEY (teaching_prof) REFERENCES prof
);

/* Test schema */
DROP TABLE IF EXISTS test;

CREATE TABLE test (
  student_number INTEGER,
  course_unit_code TEXT,
  date DATE,
  grade REAL,
  CONSTRAINT test_pk PRIMARY KEY (student_number, course_unit_code, date),
  CONSTRAINT test_student_fk FOREIGN KEY (student_number) REFERENCES student,
  CONSTRAINT test_course_unit_fk FOREIGN KEY (course_unit_code) REFERENCES course_unit,
  CONSTRAINT grade_check CHECK (grade > 0)
);
