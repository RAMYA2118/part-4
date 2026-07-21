-- Insert Data
INSERT INTO Advisors VALUES (1,'Ravi','ravi@gmail.com');
INSERT INTO Instructors VALUES (1,'Kumar','kumar@gmail.com');
INSERT INTO Students VALUES (101,'Ramya','CSE',1);
INSERT INTO Courses VALUES ('CS101','Database Management',1);
INSERT INTO Enrollments VALUES (101,'CS101',2025,85);

-- Update Data
UPDATE Instructors
SET instructor_email='newkumar@gmail.com'
WHERE instructor_id=1;

-- Delete Failed Students
DELETE FROM Enrollments
WHERE marks_obtained < 35;

-- Delete All Records
DELETE FROM Enrollments;

-- Query A
SELECT s.student_name, c.course_name
FROM Students s
JOIN Enrollments e ON s.student_id=e.student_id
JOIN Courses c ON e.course_code=c.course_code
WHERE c.course_code IN ('CS101','CS202','CS303');

-- Query B
SELECT *
FROM Enrollments
WHERE marks_obtained BETWEEN 60 AND 85;

-- Query C
SELECT AVG(marks_obtained) AS AverageMarks,
MIN(marks_obtained) AS MinimumMarks,
MAX(marks_obtained) AS MaximumMarks
FROM Enrollments;

-- Query D (INNER JOIN)
SELECT s.student_name, c.course_name
FROM Students s
INNER JOIN Enrollments e ON s.student_id=e.student_id
INNER JOIN Courses c ON e.course_code=c.course_code;

-- Query D (LEFT JOIN)
SELECT s.student_name, c.course_name
FROM Students s
LEFT JOIN Enrollments e ON s.student_id=e.student_id
LEFT JOIN Courses c ON e.course_code=c.course_code;