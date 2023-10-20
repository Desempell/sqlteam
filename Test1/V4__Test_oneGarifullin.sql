CREATE TABLE city
(
    cid SERIAL PRIMARY KEY,
    name VARCHAR(30) NOT NULL
);

CREATE TABLE specialization
(
    sid SERIAL PRIMARY KEY,
    name VARCHAR(30) NOT NULL
);

CREATE TABLE hospital
(
  hid SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  address VARCHAR(100) NOT NULL,
  city_id INT UNIQUE REFERENCES city(cid)
);

CREATE TABLE patient
(
    pid SERIAL PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    age SMALLINT DEFAULT 18 CHECK (age > 18),
    email VARCHAR(40),
    phone_number int UNIQUE,
    city_id INT REFERENCES city(cid),
    diagnosis VARCHAR(50),
    have_insurance BOOLEAN DEFAULT FALSE
);

CREATE TABLE Doctor
(
    did SERIAL PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    age SMALLINT DEFAULT 24 CHECK (age > 24),
    specialization INT REFERENCES specialization(sid),
    phone_number INT UNIQUE,
    work_experience SMALLINT DEFAULT 0 CHECK (work_experience > 0),
    cabinet SMALLINT CHECK (cabinet > 0),
    hospital_id INT REFERENCES hospital(hid),
    city_id INT REFERENCES city(cid)
);

CREATE TABLE visit
(
    vid SERIAL PRIMARY KEY,
    patient_id INT REFERENCES patient(pid),
    doctor_id INT REFERENCES Doctor(did),
    hospital_id INT REFERENCES hospital(hid),
    vdate date NOT NULL,
    result_report VARCHAR(200)
);

INSERT INTO city (name) VALUES
('New York'),
('Los Angeles'),
('Chicago'),
('Houston'),
('San Francisco');


INSERT INTO specialization (name) VALUES
('Cardiologist'),
('Dermatologist'),
('Pediatrician'),
('Orthopedic Surgeon'),
('Neurologist');


INSERT INTO hospital (name, address, city_id) VALUES
('City Hospital 1', '123 Main St, New York, NY', 1),
('General Hospital', '456 Elm St, Los Angeles, CA', 2),
('Metro Hospital', '789 Oak St, Chicago, IL', 3),
('Community Hospital', '101 Maple St, Houston, TX', 4),
('Bay Area Medical Center', '555 Pine St, San Francisco, CA', 5);


INSERT INTO Doctor (first_name, last_name, age, specialization, phone_number, work_experience, cabinet, hospital_id, city_id) VALUES
('Dr. Smith', 'Cardiologist', 35, 1, 35543, 10, 101, 1, 1),
('Dr. Lee', 'Dermatologist', 40, 2, 7777, 8, 102, 2, 2),
('Dr. White', 'Pediatrician', 30, 3, 43434, 5, 103, 3, 3),
('Dr. Johnson', 'Orthopedic Surgeon', 45, 4, 3434, 15, 104, 4, 4),
('Dr. Turner', 'Neurologist', 50, 5, 34364, 12, 105, 5, 5);

INSERT INTO patient (first_name, last_name, age, email, phone_number, city_id, diagnosis, have_insurance) VALUES
('John', 'Doe', 25, 'johndoe@email.com', 9999, 1, 'Hypertension', true),
('Alice', 'Smith', 30, 'alice@email.com', 8888, 2, 'Asthma', false),
('Bob', 'Johnson', 40, NULL, 66666, 3, 'Diabetes', true),
('Carol', 'Williams', 35, 'carol@email.com', 565665, 4, 'Migraine', false),
('David', 'Brown', 28, NULL, 65656, 5, 'Allergies', true);

INSERT INTO visit (patient_id, doctor_id, hospital_id, vdate, result_report) VALUES
(1, 1, 1, '2023-10-20', 'Blood pressure is high. Medication prescribed.'),
(2, 2, 2, '2023-10-21', 'Skin examination performed. No issues detected.'),
(2, 3, 3, '2023-10-21', 'Skin examination performed. No issues detected.')

