# Incident: UPDATE Without WHERE Clause

## What Went Wrong
A developer accidentally executed:

UPDATE submissions
SET status = 'approved';

without using a WHERE clause.

---

## What Data Could Be Affected
All rows in the submissions table were updated, including rejected and pending submissions.

---

## How the Issue Was Detected
QA team noticed unusually high approved submission counts during validation.

---

## Recovery Process
- Transaction logs were checked.
- Backup from previous checkpoint was restored.
- Incorrect records were corrected using audit logs.

---

## Prevention Measures
- Always use SELECT before UPDATE/DELETE.
- Use transactions for critical modifications.
- Enable SQL safe update mode.
- Mandatory peer review for production queries.
- Restrict direct production access.
