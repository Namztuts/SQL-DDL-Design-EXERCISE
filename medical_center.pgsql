DROP DATABASE medical_db;
CREATE DATABASE medical_db;
\c medical_db;

CREATE TABLE doctors (
  id SERIAL PRIMARY KEY,
  name VARCHAR(20),
  specialty VARCHAR(20)
);

CREATE TABLE patients (
  id SERIAL PRIMARY KEY,
  name VARCHAR(20),
  insurance TEXT,
  bday DATE
);

CREATE TABLE diseases (
  id SERIAL PRIMARY KEY,
  name VARCHAR(20)
);

CREATE TABLE visits (
  id SERIAL PRIMARY KEY,
  doctor_id INTEGER REFERENCES doctors(id),
  patient_id INTEGER REFERENCES patients(id),
  visit_date DATE
);

CREATE TABLE diagnoses (
  id SERIAL PRIMARY KEY,
  visit_id INTEGER REFERENCES visits(id) ON DELETE CASCADE,
  disease_id INTEGER REFERENCES diseases(id),
  notes TEXT
);

INSERT INTO doctors (name, specialty)
VALUES 
('Suess','Pediatrics'),
('Little','Animals');

INSERT INTO patients (name, insurance, bday)
VALUES 
('One Fish','Oceanic', '1999-09-08'),
('Nemo','Water Co', '1980-08-17');

INSERT INTO diseases (name)
VALUES 
('COVID-19'),
('Cancer');

INSERT INTO visits (doctor_id, patient_id, visit_date)
VALUES
(1, 2, '2006-02-01'),
(2, 1, '2008-01-07');

INSERT INTO diagnoses (visit_id, disease_id, notes)
VALUES
(1,2, 'Does not have long'),
(2,2, 'I give him a week');