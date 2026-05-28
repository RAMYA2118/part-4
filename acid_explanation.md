# ACID Properties Example

Using Scenario 1 (Enrollment Transaction):

## Atomicity
The enrollment insertion and seat reduction happen together.
If one operation fails, the whole transaction rolls back.

## Consistency
Database rules remain valid.
Seat count never becomes inconsistent.

## Isolation
Other users cannot see incomplete transaction data before commit.

## Durability
After COMMIT, the enrollment data remains permanently saved even after system restart.
