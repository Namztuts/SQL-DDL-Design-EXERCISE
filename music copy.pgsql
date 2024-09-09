DROP DATABASE IF EXISTS music;
CREATE DATABASE music;
\c music

CREATE TABLE artists (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE albums (
  id SERIAL PRIMARY KEY,
  album TEXT NOT NULL
);

CREATE TABLE producers (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE songs (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  release_date DATE NOT NULL,
  duration_secs INTEGER NOT NULL,
  album_id INTEGER REFERENCES albums(id)
);

INSERT INTO artists (name)
VALUES
('Rolling Stones'),
('Elvis'),
('KISS');

INSERT INTO albums (album)
VALUES
('Neverender'),
('Wake'),
('Culture Scars');

INSERT INTO producers (name)
VALUES
('Donavan Malero'),
('Sergio Ramos'),
('Dust Brothers');

INSERT INTO songs (title, duration_secs, release_date, album_id)
VALUES
('Bohemian Rhapsody', 355, '10-31-1975',1),
('Dark Horse', 215, '12-17-2013',2),
('Say My Name', 240, '11-07-1999',3);