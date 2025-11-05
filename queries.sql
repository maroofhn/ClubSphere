-- ============================================
-- ClubSphere: Example SQL Queries
-- Demonstrating CRUD operations and analytics
-- ============================================

-- 1. View all clubs and their total member counts
SELECT c.club_name, COUNT(m.student_id) AS total_members
FROM clubs c
LEFT JOIN memberships m ON c.club_id = m.club_id
GROUP BY c.club_name
ORDER BY total_members DESC;

-- 2. View all upcoming events with club names
SELECT e.event_name, e.event_date, e.location, c.club_name
FROM events e
JOIN clubs c ON e.club_id = c.club_id
WHERE e.event_date >= DATE('now')
ORDER BY e.event_date ASC;

-- 3. Show all students registered for a specific event (example: event_id = 1)
SELECT s.first_name, s.last_name, r.status
FROM registrations r
JOIN students s ON r.student_id = s.student_id
WHERE r.event_id = 1;

-- 4. Count total registrations per event
SELECT e.event_name, COUNT(r.registration_id) AS total_registrations
FROM events e
LEFT JOIN registrations r ON e.event_id = r.event_id
GROUP BY e.event_name
ORDER BY total_registrations DESC;

-- 5. Find the most active student (attended the most events)
SELECT s.first_name, s.last_name, COUNT(a.attendance_id) AS events_attended
FROM students s
JOIN registrations r ON s.student_id = r.student_id
JOIN attendance a ON r.registration_id = a.registration_id
GROUP BY s.student_id
ORDER BY events_attended DESC
LIMIT 1;

-- 6. Insert a new student, club, event
INSERT INTO students (first_name, last_name, email, grade)
VALUES ('Aisha', 'Khan', 'aisha.khan@example.com', 'Grade 12'),
       ('Omar', 'Ali', 'omar.ali@example.com', 'Grade 11');

INSERT INTO clubs (club_name, category, advisor, founded_year)
VALUES ('Science Club', 'STEM', 'Mr. Ahmed', 2018),
       ('Media Society', 'Arts', 'Ms. Fatima', 2019);

INSERT INTO events (club_id, event_name, event_date, location, capacity)
VALUES (1, 'Science Exhibition', '2025-12-15', 'Main Hall', 100),
       (2, 'Film Night', '2025-12-20', 'Auditorium', 80);


-- 7. Register a student for an event
INSERT INTO registrations (event_id, student_id)
VALUES (1, 1);

-- 8. Update event location
UPDATE events
SET location = 'Auditorium Hall B'
WHERE event_id = 2;

-- 9. Delete cancelled registrations
DELETE FROM registrations
WHERE status = 'Cancelled';

-- 10. Create a quick view (optional extension)
-- This summarizes all events with their registration and attendance totals.
CREATE VIEW event_summary AS
SELECT e.event_name,
       COUNT(DISTINCT r.registration_id) AS total_registrations,
       COUNT(a.attendance_id) AS total_attendance
FROM events e
LEFT JOIN registrations r ON e.event_id = r.event_id
LEFT JOIN attendance a ON r.registration_id = a.registration_id
GROUP BY e.event_id;
