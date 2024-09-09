DROP DATABASE IF EXISTS outer_space;
CREATE DATABASE outer_space;
\c outer_space

CREATE TABLE galaxies (
  id SERIAL PRIMARY KEY,
  galaxy TEXT NOT NULL
);

CREATE TABLE stars (
  id SERIAL PRIMARY KEY,
  star TEXT NOT NULL
);

CREATE TABLE planets (
  id SERIAL PRIMARY KEY,
  planet TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around INTEGER REFERENCES stars(id),
  galaxy_id INTEGER REFERENCES galaxies(id)
);

CREATE TABLE moons (
  id SERIAL PRIMARY KEY,
  moon TEXT NOT NULL,
  planet_id INTEGER REFERENCES planets(id)
);

INSERT INTO galaxies (galaxy)
VALUES
('Milky Way'),
('Three Muskateers'),
('Snickers');

INSERT INTO stars (star)
VALUES
('The Sun'),
('Proxima Centauri'),
('Gliese 876');

INSERT INTO planets (planet, orbital_period_in_years, orbits_around, galaxy_id)
VALUES
('Earth', 1.00, 1, 1),
('Neptune', 164.8, 2, 3),
('Venus', 0.62, 3, 2);

INSERT INTO moons (moon, planet_id)
VALUES
('The Moon', 1),
('Phobos', 2),
('Deimos', 3);