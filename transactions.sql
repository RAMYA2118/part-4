-- Scenario 1: Successful enrollment transaction

START TRANSACTION;

INSERT INTO enrollments(student_id, course_id, status)
VALUES (101, 5, 'active');

UPDATE courses
SET seats_available = seats_available - 1
WHERE course_id = 5;

COMMIT;

-- Scenario 2: Rollback due to invalid fee

START TRANSACTION;

INSERT INTO payments(student_id, amount, payment_status)
VALUES (101, -5000, 'paid');

ROLLBACK;

-- Scenario 3: SAVEPOINT with partial rollback

START TRANSACTION;

INSERT INTO submissions(student_id, score, status)
VALUES (101, 78, 'pending');

SAVEPOINT before_second_insert;

INSERT INTO submissions(student_id, score, status)
VALUES (102, NULL, 'pending');

ROLLBACK TO before_second_insert;

COMMIT;
