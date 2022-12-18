CREATE SCHEMA school;

-- task 3

CREATE TABLE school.user(
    user_id INTEGER PRIMARY KEY,
    user_name TEXT NOT NULL,
    user_email TEXT
                        CONSTRAINT proper_email CHECK ( user_email ~* '^[A-Za-z0-9._+%-]+@[A-Za-z0-9.-]+[.][A-Za-z]+$'),
    user_score INTEGER NOT NULL CHECK (user_score BETWEEN 0 AND 100)
);

CREATE TABLE school.course(
    course_id INTEGER PRIMARY KEY,
    course_name TEXT NOT NULL,
    course_length INTEGER NOT NULL
);

CREATE TABLE school.user_X_course(
    user_id INTEGER,
    course_id INTEGER,
    start_date DATE NOT NULL,
    score INTEGER NOT NULL, CHECK (score BETWEEN 0 AND 100),
    completed BOOLEAN NOT NULL,

    CONSTRAINT uc_id PRIMARY KEY (user_id, course_id),
    FOREIGN KEY (user_id) REFERENCES school.user (user_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES school.course (course_id) ON DELETE CASCADE
);

CREATE TABLE school.subscription_type(
    subscription_type_id INTEGER PRIMARY KEY,
    subscription_name TEXT NOT NULL,
    cost_per_month INTEGER NOT NULL
);

CREATE TABLE school.user_X_subscription_type(
    subscription_id INTEGER PRIMARY KEY,
    subscription_type_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    activation_date DATE NOT NULL,
    expiration_date DATE NOT NULL,

    FOREIGN KEY (user_id) REFERENCES school.user (user_id) ON DELETE CASCADE,
    FOREIGN KEY (subscription_id) REFERENCES school.subscription_type (subscription_type_id) ON DELETE CASCADE
);

CREATE TABLE school.subscription_type_X_course(
    subscription_type_id INTEGER,
    course_id INTEGER,

    CONSTRAINT sc_id PRIMARY KEY (subscription_type_id, course_id)
);

CREATE TABLE school.mentor(
    mentor_id INTEGER PRIMARY KEY,
    mentor_name TEXT NOT NULL,
    mentor_email TEXT
                          CONSTRAINT proper_email CHECK (mentor.mentor_email ~* '^[A-Za-z0-9._+%-]+@[A-Za-z0-9.-]+[.][A-Za-z]+$')
);

CREATE TABLE school.user_X_mentor(
    user_id INTEGER,
    mentor_id INTEGER,

    CONSTRAINT um_id PRIMARY KEY (user_id, mentor_id),
    FOREIGN KEY (user_id) REFERENCES school.user (user_id) ON DELETE CASCADE ,
    FOREIGN KEY (mentor_id) REFERENCES school.mentor (mentor_id) ON DELETE CASCADE
);

CREATE TABLE school.teacher(
    teacher_id INTEGER PRIMARY KEY,
    teacher_name TEXT NOT NULL,
    teacher_email TEXT NOT NULL
                           CONSTRAINT proper_email CHECK (teacher.teacher_email ~* '^[A-Za-z0-9._+%-]+@[A-Za-z0-9.-]+[.][A-Za-z]+$')
);

CREATE TABLE school.teacher_X_course(
    teacher_id INTEGER,
    course_id INTEGER,

    CONSTRAINT tc_id PRIMARY KEY (teacher_id, course_id),
    FOREIGN KEY (teacher_id) REFERENCES school.teacher (teacher_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES school.course (course_id) ON DELETE CASCADE
);

CREATE TABLE school.exam(
    exam_id INTEGER PRIMARY KEY,
    exam_name TEXT NOT NULL,
    subject TEXT NOT NULL
);

CREATE TABLE school.course_X_exam(
    course_id INTEGER,
    exam_id INTEGER,
    mandatory BOOLEAN NOT NULL,

    CONSTRAINT ce_id PRIMARY KEY (course_id, exam_id),
    FOREIGN KEY (course_id) REFERENCES school.course (course_id) ON DELETE CASCADE,
    FOREIGN KEY (exam_id) REFERENCES school.exam (exam_id) ON DELETE CASCADE
);

