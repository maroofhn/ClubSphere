# ClubSphere: Club & Society Event Registration System

### CS50 SQL Final Project  
By **Maroof Hassan**

---

## Overview
**ClubSphere** is a relational database system designed to help schools and universities manage their student clubs, events, memberships, and attendance efficiently.

The project aims to replace disorganized spreadsheets with a structured SQL database that tracks:
- Students and their club memberships  
- Clubs and their events  
- Event registrations and attendance records  

This database is normalized, optimized, and demonstrates the use of **joins**, **foreign keys**, **indexes**, and **aggregate queries** in SQL.

---

## Project Purpose
To provide an efficient, centralized, and scalable way to:
- Register students in multiple clubs  
- Organize and manage events  
- Record attendance and feedback  
- Generate analytical insights (e.g., most active members or most popular clubs)

---

## Database Structure

### Entities
| Entity | Description |
|--------|--------------|
| **Students** | All registered students |
| **Clubs** | Active clubs or societies |
| **Memberships** | Links students and clubs (many-to-many) |
| **Events** | Activities hosted by clubs |
| **Registrations** | Student signups for events |
| **Attendance** | Event check-ins and feedback |

### Relationships
- **Students ↔ Clubs** → many-to-many via `memberships`  
- **Clubs ↔ Events** → one-to-many  
- **Students ↔ Events** → many-to-many via `registrations`  
- **Registrations ↔ Attendance** → one-to-one  

---

## ⚙️ Files Included
| File | Description |
|------|--------------|
| `DESIGN.md` | Detailed design document including ER diagram, scope, and limitations |
| `schema.sql` | SQL commands to create all tables, relationships, and indexes |
| `queries.sql` | Example SQL queries for CRUD operations and analytics |
