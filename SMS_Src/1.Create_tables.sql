/* STUDENT MANAGEMENT SYSTEM 
Schema &Tables
      BY Fareeda S.
*/
      

/*====================================CREATE DATABASE==============================================*/
CREATE DATABASE StudentManegementSystem;
USE StudentManagementSystem;

/*=========================================CREATE TABLES==================================================*/

/*===============CREATE STUDENT TABLE=================*/
CREATE TABLE Students(
StudentID INT AUTO_INCREMENT PRIMARY KEY,
FirstName VARCHAR(50),
LastName VARCHAR(50),
DateOfBirth DATE,
Email VARCHAR(100),
Phone VARCHAR(15),
Address VARCHAR(255)
) AUTO_INCREMENT=1001;

/*===============CREATE COURSE TABLE=================*/
CREATE TABLE Courses(
CourseID INT AUTO_INCREMENT PRIMARY KEY,
CourseName VARCHAR(100),
CourseCode varchar(10),
CourseDescription TEXT,
Credits INT
)AUTO_INCREMENT=101;

/*===============CREATE ENROLLMENT TABLE=================*/
CREATE TABLE Enrollments(
EnrollmentID INT AUTO_INCREMENT PRIMARY KEY,
StudentID INT,
CourseID INT,
EnrollmentDate DATE,
FOREIGN KEY(StudentID) REFERENCES Students(StudentID),
FOREIGN KEY(CourseID) REFERENCES courses(CourseID)
);

/*===============CREATE GRADES TABLE=================*/
CREATE TABLE Grades(
GradeID INT AUTO_INCREMENT PRIMARY KEY,
StudentID INT,
CourseID INT,
Grade CHAR(1),
FOREIGN KEY(StudentID) REFERENCES Students(StudentID),
FOREIGN KEY(CourseID) REFERENCES courses(CourseID)
);
