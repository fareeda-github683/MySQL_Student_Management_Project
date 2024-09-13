/* STUDENT MANAGEMENT SYSTEM 
Advanced Concepts-======TRIGGER
      BY Fareeda S.
*/


/*==============================TRIGGER to Automatically Insert a Grade of 'A' When a Student is Enrolled in a New Course=================*/
DELIMITER $$
CREATE TRIGGER AfterEnrollmentInsert
AFTER INSERT ON Enrollments
FOR EACH ROW
BEGIN 
	INSERT INTO Grades(StudentID,CourseID,Grade)
    VALUES(NEW.StudentID,NEW.CourseID,'A');
END $$
DELIMITER ;