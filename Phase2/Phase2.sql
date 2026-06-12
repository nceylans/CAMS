
-- Consultancy Appointment and Management System (CAMS)
-- Group 17 - Phase 2: SQL Schema
-- Betül Merey 33963 | Nehir Ceylan 35242

CREATE TABLE CLIENT (
    client_id       INT             PRIMARY KEY,
    name            VARCHAR(100)    NOT NULL,
    email           VARCHAR(150)    NOT NULL UNIQUE,
    phone           VARCHAR(20),
    date_of_birth   DATE
);

CREATE TABLE PROFESSIONAL (
    professional_id     INT             PRIMARY KEY,
    name                VARCHAR(100)    NOT NULL,
    specialization      VARCHAR(100)    NOT NULL,
    license_number      VARCHAR(50)     NOT NULL UNIQUE,
    years_of_experience INT
);

CREATE TABLE SERVICE (
    service_id      INT             PRIMARY KEY,
    service_name    VARCHAR(100)    NOT NULL,
    description     TEXT
);

CREATE TABLE LOCATION (
    location_id     INT             PRIMARY KEY,
    address         VARCHAR(255)    NOT NULL,
    location_type   VARCHAR(50)     NOT NULL  
);


CREATE TABLE APPOINTMENT (
    appointment_id      INT     PRIMARY KEY,
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
    appointment_id  INT             NOT NULL UNIQUE,
    amount          DECIMAL(10, 2)  NOT NULL,
    payment_date    DATE            NOT NULL,
    payment_method  VARCHAR(50),
    payment_status  VARCHAR(50)     NOT NULL,
    PRIMARY KEY (payment_id, appointment_id),
    FOREIGN KEY (appointment_id) REFERENCES APPOINTMENT(appointment_id)
);

CREATE TABLE REVIEW (
    review_id       INT     NOT NULL,
    appointment_id  INT     NOT NULL UNIQUE,
    rating          INT     CHECK (rating BETWEEN 1 AND 5),
    comment         TEXT,
    PRIMARY KEY (review_id, appointment_id),
    FOREIGN KEY (appointment_id) REFERENCES APPOINTMENT(appointment_id)
);
SHOW DATABASES;