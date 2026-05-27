# Keys and Relationships

## Primary Keys

| Table | Primary Key |
|---|---|
| students | student_id |
| batches | batch_id |
| courses | course_id |
| problems | problem_id |
| test_cases | test_case_id |
| contests | contest_id |
| submissions | submission_id |
| test_results | result_id |
| attendance | attendance_id |
| sessions | session_id |
| plagiarism_flags | flag_id |
| regrade_requests | request_id |
| operation_requests | operation_id |

---

# Composite Keys

## enrollments
Composite Primary Key:
- student_id
- course_id

Reason:
A student should not enroll in the same course multiple times.

---

## contest_problems
Composite Primary Key:
- contest_id
- problem_id

Reason:
The same problem should not be linked repeatedly to the same contest.

---

# Candidate Keys

Examples:

## students
- email
- phone

Both can uniquely identify a student.

---

## courses
- course_code

Each course code should remain unique.

---

# Alternate Keys

Alternate keys are candidate keys not selected as primary keys.

Examples:
- email in students
- course_code in courses

---

# Foreign Keys

| Table | Foreign Key | References |
|---|---|---|
| students | batch_id | batches(batch_id) |
| enrollments | student_id | students(student_id) |
| enrollments | course_id | courses(course_id) |
| test_cases | problem_id | problems(problem_id) |
| contest_problems | contest_id | contests(contest_id) |
| contest_problems | problem_id | problems(problem_id) |
| submissions | student_id | students(student_id) |
| submissions | problem_id | problems(problem_id) |
| test_results | submission_id | submissions(submission_id) |
| test_results | test_case_id | test_cases(test_case_id) |
| attendance | student_id | students(student_id) |
| sessions | student_id | students(student_id) |
| plagiarism_flags | submission_id | submissions(submission_id) |
| regrade_requests | submission_id | submissions(submission_id) |

---

# NOT NULL Constraints

Important NOT NULL fields include:

- student_name
- email
- course_name
- course_code
- problem_title
- enrollment_date
- submission_id
- contest_name

Reason:
These fields are essential for valid records.

---

# UNIQUE Constraints

| Table | Column |
|---|---|
| students | email |
| students | phone |
| courses | course_code |

Reason:
Duplicate values would create ambiguity and reduce data integrity.

---

# CHECK Constraints

## enrollments
```sql
CHECK (enrollment_status IN ('active','completed','dropped'))
```

## problems
```sql
CHECK (difficulty IN ('easy','medium','hard'))
```

## attendance
```sql
CHECK (attendance_status IN ('present','absent','late'))
```

## plagiarism_flags
```sql
CHECK (similarity_percentage BETWEEN 0 AND 100)
```

Reason:
CHECK constraints ensure only valid business values are stored.

---

# Relationship Types

## One-to-Many Relationships

- One batch → many students
- One student → many submissions
- One problem → many test_cases
- One submission → many test_results

---

## Many-to-Many Relationships

### students ↔ courses
Handled using:
- enrollments table

### contests ↔ problems
Handled using:
- contest_problems table

---

# Why Constraints Are Important

Constraints help:

- maintain data consistency
- prevent duplicate records
- enforce valid references
- improve database reliability
- reduce invalid or corrupted data
