# Assumptions

# General Assumptions

The raw CSV files may contain inconsistent, duplicate, or incomplete records. The following assumptions were made while designing the relational schema.

---

# Student Assumptions

- each student has a unique student_id
- email addresses should be unique
- phone numbers are assumed to be unique where available
- a student belongs to one batch at a time

---

# Course Assumptions

- each course has a unique course_id
- course_code values are unique
- course duration must be greater than zero

---

# Enrollment Assumptions

- a student cannot enroll in the same course multiple times simultaneously
- enrollment status must contain valid predefined values

Allowed values:
- active
- completed
- dropped

---

# Problem Assumptions

- each coding problem has a unique problem_id
- problem difficulty is limited to:
  - easy
  - medium
  - hard

---

# Submission Assumptions

- one submission belongs to one student
- one submission belongs to one problem
- score values cannot be negative

---

# Contest Assumptions

- contests may contain multiple problems
- one problem may appear in multiple contests

This many-to-many relationship is handled using:
- contest_problems table

---

# Test Case Assumptions

- each test case belongs to one problem
- hidden test cases are supported using a boolean flag

---

# Attendance Assumptions

Attendance status is restricted to:
- present
- absent
- late

---

# Plagiarism Assumptions

- similarity percentage must remain between 0 and 100
- one submission may have multiple plagiarism checks

---

# Regrade Request Assumptions

Request status values include:
- pending
- approved
- rejected

---

# Database Design Assumptions

- surrogate integer primary keys are preferred
- foreign key constraints are enforced
- normalized design is preferred over denormalized storage
- timestamps are stored where audit tracking is useful

---

# Data Cleaning Assumptions

Because raw CSV files may contain inconsistencies:

- staging/raw imports may be used before inserting into final tables
- invalid or duplicate records should be cleaned before production insertion
- NULL handling may require additional validation during import

---

# Final Assumption

The schema is designed for educational and analytical purposes while following standard DBMS normalization and integrity principles.
