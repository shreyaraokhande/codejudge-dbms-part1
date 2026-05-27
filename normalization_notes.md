# Normalization Notes

# Overview

The raw CodeJudge dataset contained multiple related entities such as students, courses, submissions, contests, and test cases. The database was redesigned into a normalized relational schema to reduce redundancy and improve consistency.

The final schema approximately follows 1NF, 2NF, and 3NF.

---

# First Normal Form (1NF)

The database satisfies 1NF because:

- each table has a primary key
- each column stores atomic values
- repeating groups are removed
- there are no multi-valued columns

Example:

Instead of storing multiple courses in one student row:

```txt
course_names = "DBMS,DSA,OS"
```

the schema uses the enrollments table.

---

# Second Normal Form (2NF)

The database satisfies 2NF because:

- all non-key attributes depend fully on the entire primary key
- partial dependency is removed

Example:

In enrollments table:

```txt
(student_id, course_id)
```

is the composite key.

Attributes like:
- student_name
- course_name

were not stored in enrollments because they depend only on part of the key.

They were moved into:
- students
- courses

tables separately.

---

# Third Normal Form (3NF)

The database satisfies 3NF because:

- transitive dependencies are minimized
- non-key attributes depend only on the primary key

Example:

Instead of storing:

```txt
student_id → batch_id → batch_name
```

the schema separates:
- students
- batches

This prevents repeated batch information.

---

# Examples of Redundant Data Removed

## Example 1

Repeated batch information in students table.

Solution:
- separate batches table

---

## Example 2

Repeated course details in enrollments.

Solution:
- separate courses table

---

## Example 3

Repeated problem metadata in submissions.

Solution:
- separate problems table

---

# Functional Dependencies

## students

```txt
student_id → student_name, email, phone, batch_id
```

---

## courses

```txt
course_id → course_name, course_code
```

---

## problems

```txt
problem_id → problem_title, difficulty, topic
```

---

# Composite Key Dependencies

## enrollments

```txt
(student_id, course_id) → enrollment_date, enrollment_status
```

---

## contest_problems

```txt
(contest_id, problem_id)
```

uniquely identifies each contest-problem mapping.

---

# Trade-Offs

The schema is highly normalized to reduce redundancy and maintain integrity.

However:
- additional joins may slightly increase query complexity
- normalized schemas improve maintainability and consistency

The design prioritizes:
- integrity
- scalability
- clarity
- maintainability

over denormalized performance optimization.

---

# Final Conclusion

The final schema structure reduces duplicate data, improves consistency, enforces relationships through keys and constraints, and follows standard relational database normalization principles.
