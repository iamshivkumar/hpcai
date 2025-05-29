-- Creating schema for School Management System

-- Table for Teachers
CREATE TABLE Teachers (
    teacher_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    department VARCHAR(50),
    hire_date DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    
);

-- Table for Students
CREATE TABLE Students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender ENUM('Male', 'Female', 'Other') NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    address TEXT,
    admission_date DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table for Admissions
CREATE TABLE Admissions (
    admission_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    application_date DATE NOT NULL,
    status ENUM('Pending', 'Approved', 'Rejected') NOT NULL,
    class_grade VARCHAR(20),
    documents_submitted TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

-- Table for ID Cards
CREATE TABLE ID_Cards (
    id_card_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    teacher_id INT,
    card_number VARCHAR(20) UNIQUE NOT NULL,
    issue_date DATE NOT NULL,
    expiry_date DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (teacher_id) REFERENCES Teachers(teacher_id)
);

-- Table for Leaving Certificates
CREATE TABLE Leaving_Certificates (
    certificate_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    issue_date DATE NOT NULL,
    reason TEXT,
    certificate_number VARCHAR(20) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

-- Table for Courses
CREATE TABLE Courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_code VARCHAR(20) UNIQUE NOT NULL,
    course_name VARCHAR(100) NOT NULL,
    description TEXT,
    credits INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table for Classes (to manage class-grade assignments)
CREATE TABLE Classes (
    class_id INT PRIMARY KEY AUTO_INCREMENT,
    class_name VARCHAR(50) NOT NULL,
    academic_year YEAR NOT NULL,
    teacher_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (teacher_id) REFERENCES Teachers(teacher_id)
);

-- Table for Student-Class Enrollment
CREATE TABLE Student_Classes (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    class_id INT NOT NULL,
    enrollment_date DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (class_id) REFERENCES Classes(class_id),
    UNIQUE (student_id, class_id)
);

-- Table for AI Lesson Plans
CREATE TABLE Lesson_Plans (
    lesson_plan_id INT PRIMARY KEY AUTO_INCREMENT,
    teacher_id INT NOT NULL,
    course_id INT NOT NULL,
    class_id INT NOT NULL,
    title VARCHAR(100) NOT NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ai_generated BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (teacher_id) REFERENCES Teachers(teacher_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id),
    FOREIGN KEY (class_id) REFERENCES Classes(class_id)
);

-- Table for Attendance (supports fingerprint/facial recognition)
CREATE TABLE Attendance (
    attendance_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    class_id INT NOT NULL,
    attendance_date DATE NOT NULL,
    status ENUM('Present', 'Absent', 'Late') NOT NULL,
    method ENUM('Fingerprint', 'Facial', 'Manual') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (class_id) REFERENCES Classes(class_id)
);

-- Table for Assessments
CREATE TABLE Assessments (
    assessment_id INT PRIMARY KEY AUTO_INCREMENT,
    course_id INT NOT NULL,
    class_id INT NOT NULL,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    assessment_type ENUM('Quiz', 'Assignment', 'Exam') NOT NULL,
    max_score INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ai_generated BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id),
    FOREIGN KEY (class_id) REFERENCES Classes(class_id)
);

-- Table for Student Assessment Submissions
CREATE TABLE Assessment_Submissions (
    submission_id INT PRIMARY KEY AUTO_INCREMENT,
    assessment_id INT NOT NULL,
    student_id INT NOT NULL,
    submission_date DATETIME NOT NULL,
    content TEXT,
    score INT,
    feedback TEXT,
    ai_checked BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (assessment_id) REFERENCES Assessments(assessment_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

-- Table for Tests (AI-created or imported)
CREATE TABLE Tests (
    test_id INT PRIMARY KEY AUTO_INCREMENT,
    course_id INT NOT NULL,
    class_id INT NOT NULL,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    test_date DATE NOT NULL,
    max_score INT NOT NULL,
    ai_generated BOOLEAN DEFAULT FALSE,
    imported BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id),
    FOREIGN KEY (class_id) REFERENCES Classes(class_id)
);

-- Table for HPC (High-Performance Computing) Resources
CREATE TABLE HPC_Resources (
    hpc_id INT PRIMARY KEY AUTO_INCREMENT,
    resource_name VARCHAR(100) NOT NULL,
    description TEXT,
    status ENUM('Available', 'In Use', 'Maintenance') NOT NULL,
    allocated_to_course_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (allocated_to_course_id) REFERENCES Courses(course_id)
);

-- Table for Timetable
CREATE TABLE Timetable (
    timetable_id INT PRIMARY KEY AUTO_INCREMENT,
    class_id INT NOT NULL,
    course_id INT NOT NULL,
    teacher_id INT NOT NULL,
    day_of_week ENUM('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday') NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    room VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (class_id) REFERENCES Classes(class_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id),
    FOREIGN KEY (teacher_id) REFERENCES Teachers(teacher_id)
);

-- Table for Calendar Events
CREATE TABLE Calendar (
    event_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    event_date DATE NOT NULL,
    start_time TIME,
    end_time TIME,
    class_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (class_id) REFERENCES Classes(class_id)
);

-- Table for AI-Driven Activities
CREATE TABLE Activities (
    activity_id INT PRIMARY KEY AUTO_INCREMENT,
    class_id INT NOT NULL,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    activity_date DATE NOT NULL,
    ai_suggested BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (class_id) REFERENCES Classes(class_id)
);

-- Table for Poshan Aahar (Nutrition Tracking)
CREATE TABLE Poshan_Aahar (
    nutrition_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    meal_date DATE NOT NULL,
    meal_type ENUM('Breakfast', 'Lunch', 'Snack', 'Dinner') NOT NULL,
    description TEXT,
    calories INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

-- Table for Student Portfolios
CREATE TABLE Student_Portfolios (
    portfolio_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    content TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

-- Table for Progress Reports
CREATE TABLE Progress_Reports (
    report_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    class_id INT NOT NULL,
    report_date DATE NOT NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (class_id) REFERENCES Classes(class_id)
);

-- Table for Transcripts
CREATE TABLE Transcripts (
    transcript_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    academic_year YEAR NOT NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);