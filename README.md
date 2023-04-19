# Database Systems Group Project

# This repo contains project work for the Database Systems course.

Barsha Chaudhaury and Tyson Gouche worked together with me on this project, but this is a public repository used for conciseness
--will make sure to make private once it has been graded

**Instructions** 

Copy contents of code.sql into any editor or save school.sql file to your computer and upload it to editor of choice 

Run entire code to see all tasks executed 

You can follow these steps for ease: 

1.Install a database management system (DBMS) such as MySQL or PostgreSQL on your computer.

2.Open the DBMS client and connect to the database you just created.

3.Copy the contents of code.sql into the query editor in the DBMS client, or open the file "code.sql" in the DBMS client.

4.Run the entire code to create the necessary tables and insert the values.

5.Once the code has been executed, you can query the database to retrieve data or perform tasks as required.


#  Create a Grade Book Database

**1. Problem Statement**
   
You are asked to implement a grade book to keep track student grades for several couses that a professor teaches. Courses should have the information of department, course number, course name, semester, and year.  For each course, the grade is caculated on various categories, including course participations, homework, tests, projects, etc.  The total percentages of the categories should add to 100% and the total perfect grade should be 100. The number of assignments from each category is unspecified, and can change at any time.  For example, a course may be graded by the distribution: 10% participation, 20% homework, 50% tests, 20% projects. Please note that if there are 5 homework, each homework is worth 20%/5=4% of the grade.

　

**2. Tasks**
   
Design the ER diagram;

Write the commands for creating tables and inserting values;

Show the tables with the contents that you have inserted;

Compute the average/highest/lowest score of an assignment;

List all of the students in a given course;

List all of the students in a course and all of their scores on every assignment;

Add an assignment to a course;

Change the percentages of the categories for a course;

Add 2 points to the score of each student on an assignment;

Add 2 points just to those students whose last name contains a ‘Q’.

Compute the grade for a student;

Compute the grade for a student, where the lowest score for a given category is dropped.
　
