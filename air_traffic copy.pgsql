DROP DATABASE IF EXISTS air_traffic;
CREATE DATABASE air_traffic;
\c air_traffic

CREATE TABLE passengers (
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE airlines (
  id SERIAL PRIMARY KEY,
  airline TEXT NOT NULL
);

CREATE TABLE countries (
  id SERIAL PRIMARY KEY,
  country TEXT NOT NULL
);

CREATE TABLE cities (
  id SERIAL PRIMARY KEY,
  city TEXT NOT NULL,
  country_id INTEGER REFERENCES countries(id)
);

CREATE TABLE flights (
  id SERIAL PRIMARY KEY,
  seat VARCHAR(3) NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline_id INTEGER REFERENCES airlines(id),
  dep_city_id INTEGER REFERENCES cities(id),
  arr_city_id INTEGER REFERENCES cities(id)
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  passenger_id INTEGER REFERENCES passengers(id),
  flight_id INTEGER REFERENCES flights(id)
);

INSERT INTO passengers (first_name, last_name)
VALUES
('Jennifer', 'Finch'),
('Thadeus', 'Gathercoal'),
('Sonja', 'Pauley');

INSERT INTO airlines (airline)
VALUES
('United'),
('Delta'),
('British Airways');

INSERT INTO countries (country)
VALUES
('United States'),
('United Kingdom'),
('Mexico');

INSERT INTO cities (city, country_id)
VALUES
('Seattle', 1),
('Mexico City', 3),
('London', 2);

INSERT INTO flights (seat, departure, arrival, airline_id, dep_city_id, arr_city_id)
VALUES
('33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00',1,1,2),
('8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00',2,3,1),
('12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00',3,2,3);

INSERT INTO tickets (passenger_id, flight_id)
VALUES
(1,2),
(2,3),
(3,1);
