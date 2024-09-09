DROP DATABASE soccer_db;
CREATE DATABASE soccer_db;
\c soccer_db;

CREATE TABLE season(
  id SERIAL PRIMARY KEY,
  name VARCHAR(20),
  start_date DATE,
  end_date DATE
);

CREATE TABLE teams(
  id SERIAL PRIMARY KEY,
  name VARCHAR(20)
);

CREATE TABLE players(
  id SERIAL PRIMARY KEY,
  name VARCHAR(20),
  team_id INTEGER REFERENCES teams(id)
);

CREATE TABLE referees(
  id SERIAL PRIMARY KEY,
  name VARCHAR(20)
);

CREATE TABLE matches(
  id SERIAL PRIMARY KEY,
  team1_id INTEGER REFERENCES teams(id),
  team2_id INTEGER REFERENCES teams(id),
  referee_id INTEGER REFERENCES referees(id),
  season_id INTEGER REFERENCES season(id)
);

CREATE TABLE goals(
  id SERIAL PRIMARY KEY,
  player_id INTEGER REFERENCES players(id),
  match_id INTEGER REFERENCES matches(id)
);

INSERT INTO season (name,start_date,end_date)
VALUES
('Spring 2024','2024-01-01','2024-03-31'),
('Summer 2024','2024-04-01','2024-06-30'),
('Fall 2024','2024-07-01','2024-09-30');

INSERT INTO teams (name)
VALUES
('Liverpool'),
('Barcelona'),
('Manchester United');

INSERT INTO players (name, team_id)
VALUES
('David Beckham',1),
('Messi', 2),
('Cristiano Ronaldo', 3);

INSERT INTO referees (name)
VALUES
('Referee Tom'),
('Referee Samantha'),
('Referee Jimmy');

INSERT INTO matches (team1_id,team2_id,referee_id,season_id)
VALUES
(1,2,1,1),
(1,3,2,2),
(2,3,3,3);

INSERT INTO goals (player_id, match_id)
VALUES
(2,1),
(1,2),
(2,3);