CREATE TABLE batches (
    batch_id INTEGER PRIMARY KEY,
    batch_name VARCHAR(100) NOT NULL,
    start_date DATE,
    end_date DATE
);

CREATE TABLE students (
    student_id INTEGER PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    phone VARCHAR(20) UNIQUE,
    batch_id INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (batch_id) REFERENCES batches(batch_id)
);

CREATE TABLE courses (
    course_id INTEGER PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    course_code VARCHAR(20) UNIQUE NOT NULL,
    duration_weeks INTEGER CHECK(duration_weeks > 0)
);

CREATE TABLE enrollments (
    student_id INTEGER,
    course_id INTEGER,
    enrollment_date DATE NOT NULL,
    enrollment_status VARCHAR(20) CHECK (
        enrollment_status IN ('active','completed','dropped')
    ),
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

CREATE TABLE problems (
    problem_id INTEGER PRIMARY KEY,
    problem_title VARCHAR(200) NOT NULL,
    difficulty VARCHAR(20) CHECK (
        difficulty IN ('easy','medium','hard')
    ),
    topic VARCHAR(100),
    max_score INTEGER CHECK(max_score >= 0)
);

CREATE TABLE test_cases (
    test_case_id INTEGER PRIMARY KEY,
    problem_id INTEGER NOT NULL,
    input_data TEXT,
    expected_output TEXT,
    is_hidden BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (problem_id) REFERENCES problems(problem_id)
);

CREATE TABLE contests (
    contest_id INTEGER PRIMARY KEY,
    contest_name VARCHAR(150) NOT NULL,
    start_time TIMESTAMP,
    end_time TIMESTAMP
);

CREATE TABLE contest_problems (
    contest_id INTEGER,
    problem_id INTEGER,
    PRIMARY KEY (contest_id, problem_id),
    FOREIGN KEY (contest_id) REFERENCES contests(contest_id),
    FOREIGN KEY (problem_id) REFERENCES problems(problem_id)
);

CREATE TABLE submissions (
    submission_id INTEGER PRIMARY KEY,
    student_id INTEGER NOT NULL,
    problem_id INTEGER NOT NULL,
    language_used VARCHAR(50),
    submitted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(30),
    score INTEGER CHECK(score >= 0),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (problem_id) REFERENCES problems(problem_id)
);

CREATE TABLE test_results (
    result_id INTEGER PRIMARY KEY,
    submission_id INTEGER NOT NULL,
    test_case_id INTEGER NOT NULL,
    execution_time FLOAT,
    memory_used FLOAT,
    passed BOOLEAN,
    FOREIGN KEY (submission_id) REFERENCES submissions(submission_id),
    FOREIGN KEY (test_case_id) REFERENCES test_cases(test_case_id)
);

CREATE TABLE attendance (
    attendance_id INTEGER PRIMARY KEY,
    student_id INTEGER NOT NULL,
    attendance_date DATE NOT NULL,
    attendance_status VARCHAR(20) CHECK (
        attendance_status IN ('present','absent','late')
    ),
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

CREATE TABLE sessions (
    session_id INTEGER PRIMARY KEY,
    student_id INTEGER NOT NULL,
    login_time TIMESTAMP,
    logout_time TIMESTAMP,
    ip_address VARCHAR(50),
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

CREATE TABLE plagiarism_flags (
    flag_id INTEGER PRIMARY KEY,
    submission_id INTEGER NOT NULL,
    similarity_percentage FLOAT CHECK (
        similarity_percentage BETWEEN 0 AND 100
    ),
    flagged_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (submission_id) REFERENCES submissions(submission_id)
);

CREATE TABLE regrade_requests (
    request_id INTEGER PRIMARY KEY,
    submission_id INTEGER NOT NULL,
    request_reason TEXT,
    request_status VARCHAR(20) CHECK (
        request_status IN ('pending','approved','rejected')
    ),
    FOREIGN KEY (submission_id) REFERENCES submissions(submission_id)
);

CREATE TABLE operation_requests (
    operation_id INTEGER PRIMARY KEY,
    operation_type VARCHAR(100),
    requested_by VARCHAR(100),
    request_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    operation_status VARCHAR(20)
);
