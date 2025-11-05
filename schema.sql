-- ============================================
-- ClubSphere: Club & Society Event Registration System
-- Database Schema by Maroof Hassan
-- ============================================

-- Table: Students
CREATE TABLE students (
    student_id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    grade TEXT,
    joined_date DATE DEFAULT CURRENT_DATE
);

-- Table: Clubs
CREATE TABLE clubs (
    club_id INTEGER PRIMARY KEY AUTOINCREMENT,
    club_name TEXT NOT NULL,
    category TEXT,
    advisor TEXT,
    founded_year INTEGER
);

-- Table: Memberships (link between students and clubs)
CREATE TABLE memberships (
    membership_id INTEGER PRIMARY KEY AUTOINCREMENT,
    student_id INTEGER NOT NULL,
    club_id INTEGER NOT NULL,
    joined_on DATE DEFAULT CURRENT_DATE,
    role TEXT DEFAULT 'Member',
    FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (club_id) REFERENCES clubs(club_id) ON DELETE CASCADE
);

-- Table: Events (organized by clubs)
CREATE TABLE events (
    event_id INTEGER PRIMARY KEY AUTOINCREMENT,
    club_id INTEGER NOT NULL,
    event_name TEXT NOT NULL,
    event_date DATE NOT NULL,
    location TEXT,
    capacity INTEGER DEFAULT 100,
    FOREIGN KEY (club_id) REFERENCES clubs(club_id) ON DELETE CASCADE
);

-- Table: Registrations (students registering for events)
CREATE TABLE registrations (
    registration_id INTEGER PRIMARY KEY AUTOINCREMENT,
    event_id INTEGER NOT NULL,
    student_id INTEGER NOT NULL,
    registered_on DATE DEFAULT CURRENT_DATE,
    status TEXT DEFAULT 'Registered',
    FOREIGN KEY (event_id) REFERENCES events(event_id) ON DELETE CASCADE,
    FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE
);

-- Table: Attendance (linked to registrations)
CREATE TABLE attendance (
    attendance_id INTEGER PRIMARY KEY AUTOINCREMENT,
    registration_id INTEGER NOT NULL,
    checked_in_on DATE,
    feedback_score INTEGER CHECK (feedback_score BETWEEN 1 AND 5),
    FOREIGN KEY (registration_id) REFERENCES registrations(registration_id) ON DELETE CASCADE
);

-- ============================================
-- Indexes (to optimize performance)
-- ============================================

CREATE INDEX idx_student_id ON memberships(student_id);
CREATE INDEX idx_club_id ON memberships(club_id);
CREATE INDEX idx_event_id ON registrations(event_id);
CREATE INDEX idx_registration_id ON attendance(registration_id);

