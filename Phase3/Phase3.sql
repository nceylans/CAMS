-- Consultancy Appointment and Management System (CAMS)
-- Group 17 - Phase 3: INSERT Statements + SQL Queries
-- Betül Merey 33963 | Nehir Ceylan 35242

USE CAMS_DB;

-- SECTION 1: INSERT STATEMENTS

INSERT INTO CLIENT (client_id, name, email, phone, date_of_birth) VALUES
(1, 'Alice Johnson',   'alice@email.com',   '555-1001', '1990-03-15'),
(2, 'Bob Smith',       'bob@email.com',     '555-1002', '1985-07-22'),
(3, 'Clara Davis',     'clara@email.com',   '555-1003', '1992-11-30'),
(4, 'David Lee',       'david@email.com',   '555-1004', '1978-05-10'),
(5, 'Eva Martinez',    'eva@email.com',     '555-1005', '2000-01-18');

INSERT INTO PROFESSIONAL (professional_id, name, specialization, license_number, years_of_experience) VALUES
(1, 'Dr. Sarah White',  'Career Counseling',     'LIC-001', 12),
(2, 'Mr. James Brown',  'Financial Advisory',    'LIC-002', 8),
(3, 'Ms. Linda Green',  'Legal Consultation',    'LIC-003', 15),
(4, 'Dr. Mark Taylor',  'Psychology',            'LIC-004', 10),
(5, 'Ms. Nina Black',   'Business Strategy',     'LIC-005', 6);

INSERT INTO SERVICE (service_id, service_name, description) VALUES
(1, 'Career Counseling',     'Guidance on career development and job transitions'),
(2, 'Financial Planning',    'Personal and corporate financial advisory sessions'),
(3, 'Legal Advice',          'Consultation on legal matters and documentation'),
(4, 'Psychological Support', 'Mental health and wellness counseling'),
(5, 'Business Consulting',   'Strategic planning and business growth consulting');

INSERT INTO LOCATION (location_id, address, location_type) VALUES
(1, '123 Main St, New York',      'Physical'),
(2, '456 Oak Ave, Chicago',       'Physical'),
(3, 'Online - Zoom',              'Online'),
(4, '789 Pine Rd, Los Angeles',   'Physical'),
(5, 'Online - Google Meet',       'Online');

INSERT INTO APPOINTMENT (appointment_id, date, client_id, professional_id, service_id, location_id) VALUES
(1, '2024-01-10', 1, 1, 1, 1),
(2, '2024-01-15', 2, 2, 2, 3),
(3, '2024-02-05', 3, 3, 3, 2),
(4, '2024-02-20', 4, 4, 4, 4),
(5, '2024-03-01', 5, 5, 5, 5),
(6, '2024-03-10', 1, 2, 2, 3),
(7, '2024-03-15', 2, 1, 1, 1),
(8, '2024-04-01', 3, 5, 5, 5),
(9, '2024-04-10', 4, 3, 3, 2),
(10,'2024-04-20', 5, 4, 4, 4);

INSERT INTO PAYMENT (payment_id, appointment_id, amount, payment_date, payment_method, payment_status) VALUES
(1, 1,  150.00, '2024-01-10', 'Credit Card', 'Completed'),
(2, 2,  200.00, '2024-01-15', 'Bank Transfer', 'Completed'),
(3, 3,  175.00, '2024-02-05', 'Cash',         'Completed'),
(4, 4,  120.00, '2024-02-20', 'Credit Card',  'Completed'),
(5, 5,  250.00, '2024-03-01', 'Bank Transfer', 'Completed'),
(6, 6,  200.00, '2024-03-10', 'Credit Card',  'Pending'),
(7, 7,  150.00, '2024-03-15', 'Cash',         'Completed'),
(8, 8,  250.00, '2024-04-01', 'Bank Transfer', 'Completed'),
(9, 9,  175.00, '2024-04-10', 'Credit Card',  'Pending'),
(10,10, 120.00, '2024-04-20', 'Cash',         'Completed');


INSERT INTO REVIEW (review_id, appointment_id, rating, comment) VALUES
(1, 1,  5, 'Excellent session, very helpful!'),
(2, 2,  4, 'Great advice, would recommend.'),
(3, 3,  5, 'Very knowledgeable professional.'),
(4, 4,  3, 'Good session but could be improved.'),
(5, 5,  5, 'Outstanding consultation!'),
(6, 7,  4, 'Very professional and clear.'),
(7, 8,  5, 'Best business consultation I had.'),
(8, 10, 4, 'Helpful and insightful session.');

-- SECTION 2: SQL QUERIES


-- Query 1 — List all clients
-- Description: Retrieve all rows from the CLIENT table.
-- Category: A (Retrieve all rows)
SELECT * FROM CLIENT;

-- Query 2 — Clients born after 1990
-- Description: List clients whose date of birth is after January 1, 1990.
-- Category: A (Selection with WHERE)
SELECT name, email, date_of_birth
FROM CLIENT
WHERE date_of_birth > '1990-01-01';

-- Query 3 — Appointments with client names (Inner Join)
-- Description: List each appointment date along with the name of the client who booked it.
-- Category: B (Inner join between 2 tables)
SELECT A.appointment_id, A.date, C.name AS client_name
FROM APPOINTMENT A
JOIN CLIENT C ON A.client_id = C.client_id;

-- Query 4 — Total amount paid per client
-- Description: Calculate the total payment amount for each client using JOIN and GROUP BY.
-- Category: E (Join + Group By)
SELECT C.name AS client_name, SUM(P.amount) AS total_paid
FROM CLIENT C
JOIN APPOINTMENT A ON C.client_id = A.client_id
JOIN PAYMENT P ON A.appointment_id = P.appointment_id
GROUP BY C.name
ORDER BY total_paid DESC;

-- Query 5 — Professionals with more than 1 appointment
-- Description: List professionals who have conducted more than one appointment.
-- Category: E (Filtering grouped results with HAVING)
SELECT P.name AS professional_name, COUNT(A.appointment_id) AS appointment_count
FROM PROFESSIONAL P
JOIN APPOINTMENT A ON P.professional_id = A.professional_id
GROUP BY P.name
HAVING COUNT(A.appointment_id) > 1;



-- Query 6 — All services ordered by name
-- Description: List all services in ascending alphabetical order by service name.
-- Category: D (ORDER BY ascending)
SELECT service_id, service_name, description
FROM SERVICE
ORDER BY service_name ASC;

-- Query 7 — Payments with status 'Completed' ordered by amount descending
-- Description: List all completed payments sorted from highest to lowest amount.
-- Category: D (ORDER BY descending)
SELECT payment_id, appointment_id, amount, payment_method
FROM PAYMENT
WHERE payment_status = 'Completed'
ORDER BY amount DESC;

-- Query 8 — Average payment amount per payment method
-- Description: Calculate the average payment amount grouped by payment method.
-- Category: C (AVG with GROUP BY)
SELECT payment_method, AVG(amount) AS avg_amount
FROM PAYMENT
GROUP BY payment_method;

-- Query 9 — Appointment details with client, professional, and service (3-table join)
-- Description: List each appointment showing the client name, professional name, and service name.
-- Category: B (Join between 3 tables)
SELECT A.appointment_id, A.date,
       C.name  AS client_name,
       P.name  AS professional_name,
       S.service_name
FROM APPOINTMENT A
JOIN CLIENT       C ON A.client_id       = C.client_id
JOIN PROFESSIONAL P ON A.professional_id = P.professional_id
JOIN SERVICE      S ON A.service_id      = S.service_id;

-- Query 10 — Clients who have at least one completed payment (EXISTS)
-- Description: List clients who have made at least one payment with status 'Completed'.
-- Category: E (EXISTS)
SELECT C.name, C.email
FROM CLIENT C
WHERE EXISTS (
    SELECT 1
    FROM APPOINTMENT A
    JOIN PAYMENT P ON A.appointment_id = P.appointment_id
    WHERE A.client_id = C.client_id
      AND P.payment_status = 'Completed'
);


-- Query 11 — Count of appointments per service
-- Description: Count how many appointments have been made for each service.
-- Category: C (COUNT with GROUP BY)
SELECT S.service_name, COUNT(A.appointment_id) AS total_appointments
FROM SERVICE S
JOIN APPOINTMENT A ON S.service_id = A.service_id
GROUP BY S.service_name;

-- Query 12 — Most expensive and cheapest payment
-- Description: Show the maximum and minimum payment amounts in the system.
-- Category: C (MAX, MIN)
SELECT MAX(amount) AS max_payment, MIN(amount) AS min_payment
FROM PAYMENT;

-- Query 13 — Clients NOT in any online appointment
-- Description: List clients who have never had an appointment at an online location.
-- Category: E (NOT IN)
SELECT name, email
FROM CLIENT
WHERE client_id NOT IN (
    SELECT A.client_id
    FROM APPOINTMENT A
    JOIN LOCATION L ON A.location_id = L.location_id
    WHERE L.location_type = 'Online'
);

-- Query 14 — Appointments sorted by date then client_id
-- Description: List all appointments ordered by date ascending, then by client_id ascending.
-- Category: D (ORDER BY with multiple columns)
SELECT appointment_id, date, client_id, professional_id
FROM APPOINTMENT
ORDER BY date ASC, client_id ASC;

-- Query 15 — Professionals with average review rating above 4
-- Description: List professionals whose appointments have an average review rating greater than 4.
-- Category: E (Join + Aggregate + HAVING)
SELECT P.name AS professional_name, AVG(R.rating) AS avg_rating
FROM PROFESSIONAL P
JOIN APPOINTMENT A ON P.professional_id = A.professional_id
JOIN REVIEW R ON A.appointment_id = R.appointment_id
GROUP BY P.name
HAVING AVG(R.rating) > 4;
