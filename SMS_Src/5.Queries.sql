/*STUDENT MANAGEMENT SYSTEM
Queries
	BY Fareeda S
*/



/*==========================Display Courses with the Average Grade==================================*/
SELECT *FROM View_AverageGrade;


/*=========================List All Students Who Scored an 'A' in Any Course===================*/
SELECT *FROM View_StudentGrade
WHERE Grade='A';


/*=========================List Students Enrolled in More Than One Course========================*/
SELECT s.StudentID,s.FirstName,s.LastName,COUNT(e.CourseID) AS CourseCOUNT
FROM Students s
JOIN Enrollments e ON e.StudentID=s.StudentID
GROUP BY s.StudentID,s.FirstName,s.LastName
HAVING COUNT(e.CourseID)>1
ORDER BY CourseCOUNT DESC;


/*=========================Find Students Not Enrolled in Any Course=========================*/
SELECT s.StudentID,s.FirstName,s.LastName
FROM Students s
LEFT JOIN Enrollments e ON e.StudentID=s.StudentID
WHERE e.CourseID IS NULL;


/*================================Find the Course with the Most Enrollments===================*/
SELECT c.CourseName,COUNT(e.StudentID) AS MostEnrolledCourse
FROM Courses c
JOIN Enrollments e ON e.CourseID=c.CourseID
GROUP BY c.CourseName
ORDER BY MostEnrolledCourse DESC
LIMIT 1;


/*=====================================Get the Most Recent Enrollment Date for Each Student=========================*/
SELECT s.StudentID,s.FirstName,s.LastName,MAX(e.EnrollmentDate) AS MostRecentEnrolled
FROM Students s
JOIN Enrollments e ON e.StudentID=s.StudentID
GROUP BY s.StudentID,s.FirstName,s.LastName
ORDER BY s.StudentID DESC;


/*============================Get the Total Number of 'B' Grades Awarded Across All Courses======================*/
SELECT COUNT(*) AS TotalGradesOfB
FROM Grades 
WHERE Grade='B';


/*===========================Retrieve the Enrollment History for a Specific Student=========================*/
SELECT c.CourseName,e.EnrollmentDate 
FROM Courses c
JOIN Enrollments e ON e.CourseID=c.CourseID
WHERE e.StudentID=1018
ORDER BY e.EnrollmentDate;


/*===========================List Students with the Same Grade in Multiple Courses=====================*/
SELECT s.StudentID,s.FirstName,s.LastName,g.Grade,COUNT(g.CourseID) AS NumberOfCourses
FROM Students s
JOIN Grades g ON g.StudentID=s.StudentID
GROUP BY s.StudentID,s.FirstName,s.LastName,g.Grade
HAVING COUNT(g.CourseID)>1
ORDER BY s.StudentID;


/*==============================Find Students Not Enrolled in any Course========================*/
SELECT s.StudentID,s.FirstName,s.LastName
FROM Students s
LEFT JOIN Enrollments e ON e.StudentID=s.StudentID
WHERE e.CourseID IS NULL;


/*==========================List All Students Enrolled After a Certain Date=====================*/
SELECT s.StudentID,s.FirstName,s.LastName,e.EnrollmentDate
FROM Students s
JOIN Enrollments e ON e.StudentID=s.StudentID
WHERE e.EnrollmentDate>'2021-10-10';
