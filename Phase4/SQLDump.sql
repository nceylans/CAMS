
-- Consultancy Appointment and Management System (CAMS)
-- Phase 2: SQL Schema


CREATE DATABASE cams_db;
USE cams_db;

CREATE TABLE CLIENT (
    client_id       INT       AUTO_INCREMENT      PRIMARY KEY,
    name            VARCHAR(100)    NOT NULL,
    email           VARCHAR(150)    NOT NULL UNIQUE,
    phone           VARCHAR(20),
    date_of_birth   DATE
);

CREATE TABLE PROFESSIONAL (
    professional_id     INT     AUTO_INCREMENT        PRIMARY KEY,
    name                VARCHAR(100)    NOT NULL,
    specialization      VARCHAR(100)    NOT NULL,
    license_number      VARCHAR(50)     NOT NULL UNIQUE,
    years_of_experience INT
);

CREATE TABLE SERVICE (
    service_id      INT    AUTO_INCREMENT         PRIMARY KEY,
    service_name    VARCHAR(100)    NOT NULL,
    description     TEXT
);

CREATE TABLE LOCATION (
    location_id     INT      AUTO_INCREMENT       PRIMARY KEY,
    address         VARCHAR(255)    NOT NULL,
    location_type   VARCHAR(50)     NOT NULL  
);


CREATE TABLE APPOINTMENT (
    appointment_id      INT  AUTO_INCREMENT   PRIMARY KEY,
    date                DATE    NOT NULL,
    client_id           INT     NOT NULL,
    professional_id     INT     NOT NULL,
    service_id          INT     NOT NULL,
    location_id         INT     NOT NULL,
    FOREIGN KEY (client_id)         REFERENCES CLIENT(client_id),
    FOREIGN KEY (professional_id)   REFERENCES PROFESSIONAL(professional_id),
    FOREIGN KEY (service_id)        REFERENCES SERVICE(service_id),
    FOREIGN KEY (location_id)       REFERENCES LOCATION(location_id)
);


CREATE TABLE PAYMENT (
    payment_id      INT             NOT NULL,
    appointment_id  INT             NOT NULL,
    amount          DECIMAL(10, 2)  NOT NULL,
    payment_date    DATE            NOT NULL,
    payment_method  VARCHAR(50),
    payment_status  VARCHAR(50)     NOT NULL,
    PRIMARY KEY (payment_id, appointment_id),
    FOREIGN KEY (appointment_id) REFERENCES APPOINTMENT(appointment_id)
);


CREATE TABLE REVIEW (
    review_id       INT     NOT NULL,
    appointment_id  INT     NOT NULL,
    rating          INT     CHECK (rating BETWEEN 1 AND 5),
    comment         TEXT,
    PRIMARY KEY (review_id, appointment_id),
    FOREIGN KEY (appointment_id) REFERENCES APPOINTMENT(appointment_id)
);

SHOW DATABASES;

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


-- Consultancy Appointment and Management System (CAMS)
-- Phase 3: SQL Queries
-- Group 17: Betül Merey & Nehir Ceylan

USE cams_db;

-- Query 1 - Category A: Retrieve all rows
-- Description: Retrieve all rows and columns from the CLIENT table.
SELECT * FROM CLIENT;

-- Query 2 - Category A: Selection + Projection
-- Description: List the name, email, and date of birth of clients born after January 1, 1990.
SELECT name, email, date_of_birth
FROM CLIENT
WHERE date_of_birth > '1990-01-01';

-- Query 3 - Category B: Inner join between 2 tables
-- Description: List each appointment ID and date along with the name of the client who booked it.
SELECT A.appointment_id, A.date, C.name AS client_name
FROM APPOINTMENT A
JOIN CLIENT C ON A.client_id = C.client_id;

-- Query 4 - Category B: Join between 3 tables
-- Description: List each appointment showing the date, client name, professional name, and service name.
SELECT A.appointment_id, A.date,
       C.name AS client_name,
       P.name AS professional_name,
       S.service_name
FROM APPOINTMENT A
JOIN CLIENT C ON A.client_id = C.client_id
JOIN PROFESSIONAL P ON A.professional_id = P.professional_id
JOIN SERVICE S ON A.service_id = S.service_id;

-- Query 5 - Category D: ORDER BY ascending
-- Description: List all services sorted in ascending alphabetical order by service name.
SELECT service_id, service_name, description
FROM SERVICE
ORDER BY service_name ASC;

-- Query 6 - Category D: ORDER BY descending
-- Description: List all completed payments sorted from highest to lowest amount.
SELECT payment_id, appointment_id, amount, payment_method
FROM PAYMENT
WHERE payment_status = 'Completed'
ORDER BY amount DESC;

-- Query 7 - Category C: COUNT with GROUP BY
-- Description: Count how many appointments have been made for each service.
SELECT S.service_name, COUNT(A.appointment_id) AS total_appointments
FROM SERVICE S
JOIN APPOINTMENT A ON S.service_id = A.service_id
GROUP BY S.service_name;

-- Query 8 - Category C: AVG with GROUP BY
-- Description: Calculate the average payment amount grouped by payment method.
SELECT payment_method, AVG(amount) AS avg_amount
FROM PAYMENT
GROUP BY payment_method;

-- Query 9 - Category E: Nested query / subquery (NOT IN)
-- Description: Find client IDs of clients who have had an appointment but have not submitted any review.
SELECT DISTINCT client_id 
FROM APPOINTMENT 
WHERE appointment_id NOT IN (SELECT appointment_id FROM REVIEW);

-- Query 10 - Category E: EXISTS
-- Description: List names and emails of clients who have made at least one payment with status 'Completed'.
SELECT C.name, C.email
FROM CLIENT C
WHERE EXISTS (
    SELECT 1
    FROM APPOINTMENT A
    JOIN PAYMENT P ON A.appointment_id = P.appointment_id
    WHERE A.client_id = C.client_id
      AND P.payment_status = 'Completed'
);

-- PHASE 4 TRGGERS
-- it is to prevent invalid rating, ratign must be between 1-5
DELIMITER $$

CREATE TRIGGER before_review_insert
BEFORE INSERT ON REVIEW
FOR EACH ROW
BEGIN
    IF NEW.rating < 1 OR NEW.rating > 5 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid rating! Rating must be between 1 and 5.';
    END IF;
END$$

DELIMITER ;


-- if there is active appointment, you cannot delete this client 

DELIMITER $$

CREATE TRIGGER before_client_delete
BEFORE DELETE ON CLIENT
FOR EACH ROW
BEGIN
    DECLARE appointment_count INT;
    
    SELECT COUNT(*) INTO appointment_count
    FROM APPOINTMENT
    WHERE client_id = OLD.client_id;
    
    IF appointment_count > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete client! Client has existing appointments.';
    END IF;
END$$

DELIMITER ;



-- PHASE 4 STORED PROCEDURE


-- show all appointments and related details for a given client
DELIMITER $$

CREATE PROCEDURE GetClientAppointments(IN p_client_id INT)
BEGIN
    SELECT 
        A.appointment_id,
        A.date,
        P.name AS professional_name,
        S.service_name,
        L.address,
        L.location_type
    FROM APPOINTMENT A
    JOIN PROFESSIONAL P ON A.professional_id = P.professional_id
    JOIN SERVICE S ON A.service_id = S.service_id
    JOIN LOCATION L ON A.location_id = L.location_id
    WHERE A.client_id = p_client_id;
END$$

DELIMITER ;


-- calculates the average rating of a given professional based on reviews
DELIMITER $$

CREATE PROCEDURE GetProfessionalAvgRating(IN p_professional_id INT)
BEGIN
    SELECT 
        P.name AS professional_name,
        P.specialization,
        AVG(R.rating) AS average_rating,
        COUNT(R.review_id) AS total_reviews
    FROM PROFESSIONAL P
    JOIN APPOINTMENT A ON P.professional_id = A.professional_id
    JOIN REVIEW R ON A.appointment_id = R.appointment_id
    WHERE P.professional_id = p_professional_id
    GROUP BY P.name, P.specialization;
END$$

DELIMITER ;


-- Lists all appointments that are within a given date range
DELIMITER $$

CREATE PROCEDURE GetAppointmentsByDateRange(IN p_start_date DATE, IN p_end_date DATE)
BEGIN
    SELECT 
        A.appointment_id,
        A.date,
        C.name AS client_name,
        P.name AS professional_name,
        S.service_name
    FROM APPOINTMENT A
    JOIN CLIENT C ON A.client_id = C.client_id
    JOIN PROFESSIONAL P ON A.professional_id = P.professional_id
    JOIN SERVICE S ON A.service_id = S.service_id
    WHERE A.date BETWEEN p_start_date AND p_end_date
    ORDER BY A.date ASC;
END$$

DELIMITER ;