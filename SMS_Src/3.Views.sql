/* STUDENT MANAGEMENT SYSTEM 
Advanced Concepts-======VIEW
      BY Fareeda S.
*/



/*==========================VIEW to Display Students with Their Grades==============================*/
CREATE VIEW View_StudentGrade AS
SELECT s.StudentID,s.FirstName,s.LastName,c.CourseName,g.Grade
FROM Students s
JOIN Grades g ON g.StudentID=s.StudentID
JOIN Courses c ON c.CourseID=g.CourseID;


/*==========================VIEW to Display Courses with Average Grades==================*/
CREATE VIEW View_AverageGrade AS
SELECT c.CourseID,c.CourseName,AVG(CASE 
	WHEN g.Grade='A' THEN 4
    WHEN g.Grade='B' THEN 3
    WHEN g.Grade='C' THEN 2
    WHEN g.Grade='D' THEN 1
    ELSE 0 END) AS AverageGrade
FROM Courses c
JOIN Grades g ON g.CourseID=c.CourseID    
group by c.CourseID, c.CourseName;