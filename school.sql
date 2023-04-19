CREATE DATABASE GradeBook;
USE GradeBook;
-- TASK 2
-- Create Course table
CREATE TABLE Course (
  id INT PRIMARY KEY AUTO_INCREMENT,
  department VARCHAR(255) NOT NULL,
  course_number INT NOT NULL,
  course_name VARCHAR(255) NOT NULL,
  semester VARCHAR(255) NOT NULL,
  year_ INT NOT NULL
);


CREATE TABLE Student (
  id INT PRIMARY KEY AUTO_INCREMENT,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  course_id INT NOT NULL,
  FOREIGN KEY (course_id) REFERENCES Course(id)
);

-- Create Assignment table
CREATE TABLE Assignment (
  id INT PRIMARY KEY AUTO_INCREMENT,
  category VARCHAR(255) NOT NULL,
  percentage DECIMAL(5,2) NOT NULL,
  course_id INT NOT NULL,
  FOREIGN KEY (course_id) REFERENCES Course(id)
);

-- Create Grade table
CREATE TABLE Grade (
  id INT PRIMARY KEY AUTO_INCREMENT,
  assignment_id INT NOT NULL,
  student_id INT NOT NULL,
  score DECIMAL(5,2) NOT NULL,
  FOREIGN KEY (assignment_id) REFERENCES Assignment(id),
  FOREIGN KEY (student_id) REFERENCES Student(id)
);


-- Insert values into Course table
INSERT INTO Course (id, department, course_number, course_name, semester, year_)
VALUES (1, 'Computer Science', 101, 'Intro to Computer Science', 'Fall', 2022);

INSERT INTO Course (department, course_number, course_name, semester, year_)
VALUES ('Chemistry', 201, 'Organic Chemistry I', 'Fall', 2023);

INSERT INTO Course (department, course_number, course_name, semester, year_)
VALUES ('English', 109, 'Introduction to Literature', 'Spring', 2023);

INSERT INTO Course (department, course_number, course_name, semester, year_)
VALUES ('Arts', 301, 'American History', 'Fall', 2022);

-- Insert values into Student table
INSERT INTO Student (id, first_name, last_name, course_id)
VALUES (1, 'John', 'Doe', 1),
       (2, 'Jane', 'Smith', 1),
       (3, 'David', 'Johnson', 1);

-- Insert values into Assignment table
INSERT INTO Assignment (id, category, percentage, course_id)
VALUES (1, 'Participation', 10.0, 1),
       (2, 'Homework', 20.0, 1),
       (3, 'Tests', 50.0, 1),
       (4, 'Projects', 20.0, 1);
       

-- Insert values into Grades table
INSERT INTO Grade (id, assignment_id, student_id, score)
VALUES
(1, 1, 1, 8.5),
(2, 2, 1, 92.0),
(3, 3, 1, 75.0),
(4, 4, 1, 88.0),
(5, 1, 2, 9.0),
(6, 2, 2, 88.5),
(7, 3, 2, 82.0),
(8, 4, 2, 95.0),
(9, 1, 3, 7.0),
(10, 2, 3, 78.0),
(11, 3, 3, 90.0),
(12, 4, 3, 91.5);

-- TASK 3
SELECT * FROM Course;
SELECT * FROM Student;
SELECT * FROM Assignment;
SELECT * FROM Grade;

-- TASK 4
-- Average score
SELECT AVG(score) AS average_score
FROM Grade
WHERE assignment_id = 2;

-- Highest score
SELECT MAX(score) AS highest_score
FROM Grade
WHERE assignment_id = 2;

-- Lowest score
SELECT MIN(score) AS lowest_score
FROM Grade
WHERE assignment_id = 2;

-- TASK 5
-- List all of the students in a given course
SELECT s.* FROM Student s
JOIN Course c ON s.course_id = c.id
WHERE c.id = 1;

-- TASK 6
-- List all of the students in a course and all of their scores on every assignment;
SELECT s.first_name, s.last_name, a.category, g.score
FROM Student s
JOIN Grade g ON s.id = g.student_id
JOIN Assignment a ON g.assignment_id = a.id
WHERE s.course_id = 1;

-- TASK 7
-- Add an assignment to a course
INSERT INTO Assignment (id,category, percentage, course_id)
VALUES (5,'Final Exam', 30.0, 1);

-- Show the changes in the assignment
SELECT * FROM Assignment;

-- TASK 8
-- Change the percentages of the categories for a course;
UPDATE Assignment
SET percentage = 5 WHERE id = 1 AND course_id = 1;
UPDATE Assignment
SET percentage = 20 WHERE id = 2 AND course_id = 1;
UPDATE Assignment
SET percentage = 30 WHERE id = 3 AND course_id = 1;
UPDATE Assignment
SET percentage = 15 WHERE id = 4 AND course_id = 1;

-- Show the changes to the percentage categories for a course
SELECT * FROM Assignment WHERE course_id = 1;

-- Scores before the update of 2 points
SELECT * FROM Grade WHERE assignment_id = 3;

-- TASK 9
-- Add 2 points to the score of each student on an assignment;
UPDATE Grade
SET score = score + 2
WHERE assignment_id = 3;

-- Scores before the update
SELECT * FROM Grade WHERE assignment_id = 3;

-- TASK 10
-- Add 2 points to the score of students whose last name contains a 'Q'
UPDATE Grade g
JOIN Student s ON s.id = g.student_id
SET score = score - 2
WHERE s.last_name LIKE '%Q%';

-- TASK 11
-- Compute the grade for a student
SELECT s.first_name, s.last_name, SUM(a.percentage * g.score / 100) AS grade
FROM Student s
JOIN Grade g ON s.id = g.student_id
JOIN Assignment a ON g.assignment_id = a.id
WHERE s.id = 1
GROUP BY s.id;

-- TASK 12
-- Compute the grade for a student, where the lowest score for a given category is dropped.
SELECT s.first_name, s.last_name, 
  (SUM(g.score) - MIN(g.score)) / (COUNT(g.score) - 1) AS grade
FROM Student s
JOIN Grade g ON s.id = g.student_id
WHERE s.id = 1
GROUP BY s.first_name, s.last_name;


-- Testing
DELETE FROM Course WHERE course_id = 101;
DELETE FROM Course WHERE id = 2;


-- Test case: Verify that the scores of students with last name containing 'Q' are updated by 2 points

-- Insert a student with last name containing 'Q'
INSERT INTO Student (id, first_name, last_name, course_id)
VALUES (4, 'John', 'Qoe', 1);

SELECT * FROM Student;

-- Testing Add 2 points to the score of students whose last name contains a 'Q'
UPDATE Grade g
JOIN Student s ON s.id = g.student_id
SET score = score + 2
WHERE s.last_name LIKE '%Q%';

-- See the score after updating it
SELECT s.first_name, s.last_name, a.category, g.score
FROM Student s
JOIN Grade g ON s.id = g.student_id
JOIN Assignment a ON g.assignment_id = a.id
WHERE s.course_id = 1;

-- Test Case for last name containing Q task 
INSERT INTO Student VALUES (4, 'John', 'Qoe', 1);
INSERT INTO Grade (id, assignment_id, student_id, score)
VALUES
(13,1,4,78.8),
(14,2,4,93.2),
(15,3,4,98.4),
(16,4,4,86.6);

-- List all of the students in a course and all of their scores on every assignment to check the new student and their scores added;
SELECT s.first_name, s.last_name, a.category, g.score
FROM Student s
JOIN Grade g ON s.id = g.student_id
JOIN Assignment a ON g.assignment_id = a.id
WHERE s.course_id = 1;