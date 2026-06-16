# CAMS — Consultancy Appointment and Management System

A database systems project for **CS306**, evolving from ER design to a full-stack PHP web application backed by MySQL and MongoDB.



---

## Stack

- **MySQL** — relational schema, triggers, stored procedures
- **MongoDB** — support ticket system
- **PHP + XAMPP** — web interface

---

## Structure

```
├── Phase1.pdf          # ER diagram
├── Phase2/             # SQL schema (CREATE TABLE)
├── Phase3/             # Sample data + 15 SQL queries
└── Phase4/
    ├── SQLDump.sql     # Full dump (schema, data, triggers, procedures)
    └── Scripts/
        ├── user/       # Client interface
        └── admin/      # Admin interface
```

---

## Database Schema

`CLIENT` · `PROFESSIONAL` · `SERVICE` · `LOCATION` · `APPOINTMENT` · `PAYMENT` · `REVIEW`

---

## Phase 4 Features

**Triggers**
- `before_review_insert` — rejects ratings outside 1–5
- `before_client_delete` — blocks deletion of clients with existing appointments

**Stored Procedures**
- `GetClientAppointments(client_id)`
- `GetProfessionalAvgRating(professional_id)`
- `GetAppointmentsByDateRange(start_date, end_date)`

**MongoDB Support Tickets** — users create tickets and add comments; admins review and resolve them.

---

## Setup

1. Import `Phase4/SQLDump.sql` into a MySQL database named `cams_db`
2. Copy `Scripts/user` and `Scripts/admin` into XAMPP's `htdocs`
3. Install MongoDB PHP driver: `pecl install mongodb` and add `extension=mongodb.so` to `php.ini`
4. Start Apache, MySQL, and MongoDB, then open:
   - `http://localhost/user`
   - `http://localhost/admin`
