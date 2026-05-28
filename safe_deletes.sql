-- 1. Delete duplicate attendance records

SELECT attendance_id, student_id, class_date
FROM attendance
WHERE attendance_id IN (
    SELECT attendance_id
    FROM (
        SELECT attendance_id,
               ROW_NUMBER() OVER (
                   PARTITION BY student_id, class_date
                   ORDER BY attendance_id
               ) AS rn
        FROM attendance
    ) t
    WHERE rn > 1
);

DELETE FROM attendance
WHERE attendance_id IN (
    SELECT attendance_id
    FROM (
        SELECT attendance_id,
               ROW_NUMBER() OVER (
                   PARTITION BY student_id, class_date
                   ORDER BY attendance_id
               ) AS rn
        FROM attendance
    ) t
    WHERE rn > 1
);

-- 2. Delete rejected temporary submissions

SELECT submission_id, status
FROM submissions
WHERE status = 'rejected'
AND created_at < '2025-01-01';

DELETE FROM submissions
WHERE status = 'rejected'
AND created_at < '2025-01-01';
