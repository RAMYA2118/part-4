CREATE TABLE Advisors (
    advisor_id INT PRIMARY KEY,
    advisor_name VARCHAR(100),
    advisor_email VARCHAR(100)
);

CREATE TABLE Instructors (
    instructor_id INT PRIMARY KEY,
    instructor_name VARCHAR(100),
    instructor_email VARCHAR(100)
);

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    department VARCHAR(100),
    advisor_id INT,
    FOREIGN KEY (advisor_id) REFERENCES Advisors(advisor_id)
);

CREATE TABLE Courses (
    course_code VARCHAR(10) PRIMARY KEY,
    course_name VARCHAR(100),
    instructor_id INT,
    FOREIGN KEY (instructor_id) REFERENCES Instructors(instructor_id)
);

CREATE TABLE Enrollments (
    student_id INT,
    course_code VARCHAR(10),
    enrollment_year INT DEFAULT 2025,
    marks_obtained DECIMAL(5,2),
    PRIMARY KEY (student_id, course_code),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_code) REFERENCES Courses(course_code)
);