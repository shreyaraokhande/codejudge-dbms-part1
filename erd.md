# Entity Relationship Diagram (ERD)

## Main Entity Relationships

```text
BATCHES
---------
batch_id (PK)
batch_name

        |
        | one-to-many
        ↓

STUDENTS
---------
student_id (PK)
student_name
email
phone
batch_id (FK)

        |
        | one-to-many
        ↓

SUBMISSIONS
-------------
submission_id (PK)
student_id (FK)
problem_id (FK)

        |
        | one-to-many
        ↓

TEST_RESULTS
--------------
result_id (PK)
submission_id (FK)
test_case_id (FK)

--------------------------------------------------

COURSES
---------
course_id (PK)
course_name
course_code

        |
        | many-to-many
        ↓

ENROLLMENTS
-------------
student_id (PK)(FK)
course_id (PK)(FK)
enrollment_date

        ↑
        |
        | many-to-many
        |
STUDENTS

--------------------------------------------------

PROBLEMS
----------
problem_id (PK)
problem_title
difficulty

        |
        | one-to-many
        ↓

TEST_CASES
------------
test_case_id (PK)
problem_id (FK)

--------------------------------------------------

CONTESTS
----------
contest_id (PK)
contest_name

        |
        | many-to-many
        ↓

CONTEST_PROBLEMS
------------------
contest_id (PK)(FK)
problem_id (PK)(FK)

        ↑
        |
        |
PROBLEMS

--------------------------------------------------

ATTENDANCE
------------
attendance_id (PK)
student_id (FK)

SESSIONS
----------
session_id (PK)
student_id (FK)

PLAGIARISM_FLAGS
------------------
flag_id (PK)
submission_id (FK)

REGRADE_REQUESTS
------------------
request_id (PK)
submission_id (FK)

OPERATION_REQUESTS
-------------------
operation_id (PK)
```

---

# Relationship Summary

## One-to-Many Relationships

- batches → students
- students → submissions
- problems → test_cases
- submissions → test_results
- students → attendance
- students → sessions

---

## Many-to-Many Relationships

### students ↔ courses
Implemented using:
- enrollments

### contests ↔ problems
Implemented using:
- contest_problems

---

# Key Design Features

- primary keys uniquely identify records
- foreign keys maintain referential integrity
- composite keys manage mapping tables
- normalized design reduces redundancy
- constraints improve data quality

---

# Final ERD Conclusion

The ERD represents a normalized relational database structure for the CodeJudge platform. The design supports educational operations, coding assessments, submissions, contests, and administrative tracking while maintaining scalability and integrity.
