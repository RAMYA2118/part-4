# Task 1.1 – Normalization

## a) Partial Dependencies
- student_id → student_name, department, advisor_name
- course_code → course_name, instructor_name

## Transitive Dependencies
- advisor_name → advisor_email
- instructor_name → instructor_email

## b) BCNF Tables

### Students
- student_id (PK)
- student_name
- department
- advisor_id (FK)

### Advisors
- advisor_id (PK)
- advisor_name
- advisor_email

### Instructors
- instructor_id (PK)
- instructor_name
- instructor_email

### Courses
- course_code (PK)
- course_name
- instructor_id (FK)

### Enrollments
- student_id (FK)
- course_code (FK)
- enrollment_year
- marks_obtained
- Primary Key (student_id, course_code)

## c) Integrity
- Entity Integrity: Satisfied
- Referential Integrity: Satisfied
- Domain Integrity: Satisfied
- User-defined Integrity: Satisfied