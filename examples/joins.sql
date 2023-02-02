-- Students
CREATE TABLE Students
(StudentId INT, StudentName VARCHAR(10));
INSERT INTO Students (StudentId, StudentName)
SELECT 1,'John'
UNION ALL
SELECT 2,'Matt'
UNION ALL
SELECT 3,'James';

-- Classes
CREATE TABLE Classes
(ClassId INT, ClassName VARCHAR(10));
INSERT INTO Classes (ClassId, ClassName)
SELECT 1,'Maths'
UNION ALL
SELECT 2,'Arts'
UNION ALL
SELECT 3,'History';

-- StudentClass
CREATE TABLE StudentClass
(StudentId INT, ClassId INT);
INSERT INTO StudentClass (StudentId, ClassId)
SELECT 1,1
UNION ALL
SELECT 1,2
UNION ALL
SELECT 3,1
UNION ALL
SELECT 3,2
UNION ALL
SELECT 3,3;

SELECT *
FROM Students;

SELECT *
FROM Classes;

SELECT *
FROM StudentClass;

SELECT Students.StudentName, ClassName
FROM StudentClass
INNER JOIN Students ON StudentClass.StudentId = Students.StudentId
INNER JOIN Classes C on StudentClass.ClassId = C.ClassId;

SELECT st.StudentName, c.ClassName
FROM Students st
LEFT JOIN StudentClass SC on st.StudentId = SC.StudentId
LEFT JOIN Classes C on SC.ClassId = C.ClassId
WHERE c.ClassName IS NULL;

SELECT st.studentname
FROM students st
LEFT JOIN StudentClass SC on st.StudentId = SC.StudentId
WHERE sc.ClassId IS NULL;

DROP TABLE StudentClass;
DROP TABLE Classes;
DROP TABLE Students;
