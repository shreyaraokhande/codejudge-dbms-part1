# CodeJudge Database Schema Explanation

## Overview

The CodeJudge platform is an online coding practice and evaluation system used by students, instructors, and administrators. The raw CSV dataset was analyzed and converted into a structured relational database schema.

The database is designed to manage:

- students and batches
- courses and enrollments
- coding problems and test cases
- contests and contest-problem mappings
- code submissions and execution results
- attendance and sessions
- plagiarism reports
- regrade requests
- operation requests and imports

The design follows relational database principles and normalization rules to reduce redundancy and improve data integrity.

---

# Main Tables and Purpose

## students
Stores student information such as:
- student_id
- student_name
- email
- phone
- batch_id

Primary Key:
- student_id

Relationships:
- linked with batches
- linked with enrollments
- linked with submissions
- linked with attendance

---

## batches
Stores batch or cohort details.

Primary Key:
- batch_id

One batch can contain many students.

---

## courses
Stores course information.

Primary Key:
- course_id

One course can have many enrollments.

---

## enrollments
Mapping table between students and courses.

Composite Key:
- student_id
- course_id

Purpose:
- handles many-to-many relationship

---

## problems
Stores coding problem information.

Primary Key:
- problem_id

Relationships:
- linked with test_cases
- linked with submissions
- linked with contest_problems

---

## test_cases
Stores test cases for coding problems.

Primary Key:
- test_case_id

Foreign Key:
- problem_id

One problem can have many test cases.

---

## contests
Stores coding contest details.

Primary Key:
- contest_id

---

## contest_problems
Maps problems to contests.

Composite Key:
- contest_id
- problem_id

Used to manage many-to-many relationships.

---

## submissions
Stores student code submissions.

Primary Key:
- submission_id

Foreign Keys:
- student_id
- problem_id

One student can make many submissions.

---

## test_results
Stores execution results of submissions.

Primary Key:
- result_id

Foreign Key:
- submission_id

---

## attendance
Stores attendance records.

Primary Key:
- attendance_id

Foreign Key:
- student_id

---

## sessions
Stores login or activity session information.

Primary Key:
- session_id

Foreign Key:
- student_id

---

## plagiarism_flags
Stores plagiarism detection records.

Primary Key:
- flag_id

Foreign Key:
- submission_id

---

## regrade_requests
Stores re-evaluation requests submitted by students.

Primary Key:
- request_id

Foreign Key:
- submission_id

---

## operation_requests
Stores administrative or operational requests.

Primary Key:
- operation_id

---

# Schema Design Goals

The schema was designed to:

- reduce duplicate data
- maintain referential integrity
- support scalable querying
- support one-to-many and many-to-many relationships
- improve consistency using constraints
- support future expansion

---

# Normalization

The database design approximately follows:

- First Normal Form (1NF)
- Second Normal Form (2NF)
- Third Normal Form (3NF)

Repeated and dependent data was separated into individual related tables.
