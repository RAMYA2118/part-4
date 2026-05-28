-- 1. Correct missing batch values safely

SELECT student_id, name, batch
FROM students
WHERE batch IS NULL;

UPDATE students
SET batch = 'FT-WEB-23'
WHERE batch IS NULL;

SELECT student_id, name, batch
FROM students
WHERE batch = 'FT-WEB-23';

-- 2. Fix incorrect email domain

SELECT student_id, email
FROM students
WHERE email LIKE '%@gmial.com';

UPDATE students
SET email = REPLACE(email, '@gmial.com', '@gmail.com')
WHERE email LIKE '%@gmial.com';

SELECT student_id, email
FROM students
WHERE email LIKE '%@gmail.com';

-- 3. Update submission status after review

SELECT submission_id, status
FROM submissions
WHERE score >= 80 AND status = 'pending';

UPDATE submissions
SET status = 'approved'
WHERE score >= 80 AND status = 'pending';

SELECT submission_id, status
FROM submissions
WHERE status = 'approved';

-- 4. Correct course duration

SELECT course_id, duration_weeks
FROM courses
WHERE duration_weeks = 0;

UPDATE courses
SET duration_weeks = 12
WHERE duration_weeks = 0;

SELECT course_id, duration_weeks
FROM courses
WHERE duration_weeks = 12;
