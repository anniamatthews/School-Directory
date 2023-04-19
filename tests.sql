DROP TABLE IF EXISTS Courses;
CREATE TABLE Courses(
  course_id int PRIMARY KEY,
  department varchar(255),
  course_number int,
  course_name varchar(255),
  semester varchar(255),
  year int

);


DROP TABLE IF EXISTS Students;
CREATE TABLE Students(
  student_id INT PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  course_id INT

);


DROP TABLE IF EXISTS Assignments;
CREATE TABLE Assignments(
  assignment_id INT PRIMARY KEY,
  category VARCHAR(255),
  percentage DECIMAL(5,2),
  course_id INT,
  FOREIGN KEY (course_id) REFERENCES Courses(course_id)

);

DROP TABLE IF EXISTS Grade;
CREATE TABLE Grade(
  grade_id INT PRIMARY KEY,
  assignment_id INT,
  student_id INT,
  score DECIMAL(5,2),
  FOREIGN KEY (assignment_id) REFERENCES Assignments(assignment_id),
  FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

INSERT INTO Courses (course_id, department, course_number, course_name, semester, year)
VALUES (1, 'Computer Science', 101, 'Intro to Computer Science', 'Fall', 2022);


-- Insert values into Student table
INSERT INTO Students (student_id, first_name, last_name, course_id)
VALUES (1, 'John', 'Doe', 1),
       (2, 'Jane', 'Smith', 1),
       (3, 'David', 'Johnson', 1);

-- Insert values into Assignment table
INSERT INTO Assignments (assignment_id, category, percentage, course_id)
VALUES (1, 'Participation', 10.0, 1),
       (2, 'Homework', 20.0, 1),
       (3, 'Tests', 50.0, 1),
       (4, 'Projects', 20.0, 1);
       

-- Insert values into Grade table
INSERT INTO Grade (grade_id, assignment_id, student_id, score)
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



-- Test Case for last name containing Q task 
INSERT INTO Students VALUES (4, 'John', 'Qoe', 1);
INSERT INTO Grade (grade_id, assignment_id, student_id, score)
VALUES(13,1,4,78.8),
(14,2,4.93.2),
(15,3,4,98,4),
(16,4,4,86.6)

-- Testing for Task 10

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


-- Test Case for last name containing Q task 
INSERT INTO Student VALUES (4, 'John', 'Qoe', 1);
INSERT INTO Grade (id, assignment_id, student_id, score)
VALUES
(13,1,4,78.8),
(14,2,4,93.2),
(15,3,4,98.4),
(16,4,4,86.6);

-- List all of the students in a course and all of their scores on every assignment;
SELECT s.first_name, s.last_name, a.category, g.score
FROM Student s
JOIN Grade g ON s.id = g.student_id
JOIN Assignment a ON g.assignment_id = a.id
WHERE s.course_id = 1;