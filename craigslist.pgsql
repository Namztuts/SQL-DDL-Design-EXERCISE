DROP DATABASE craigslist_db;
CREATE DATABASE craigslist_db;
\c craigslist_db;

CREATE TABLE regions(
  id SERIAL PRIMARY KEY,
  name VARCHAR(20)
);

CREATE TABLE categories(
  id SERIAL PRIMARY KEY,
  name VARCHAR(20)
);

CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  username VARCHAR(20),
  password VARCHAR(20),
  preferred_region_id INTEGER REFERENCES regions(id)
);

CREATE TABLE posts(
  id SERIAL PRIMARY KEY,
  title VARCHAR(30),
  body TEXT,
  location TEXT,
  user_id INTEGER REFERENCES users(id),
  region_id INTEGER REFERENCES regions(id),
  category_id INTEGER REFERENCES categories(id)
);

INSERT INTO regions (name)
VALUES
('San Francisco'),
('Atlanta'),
('Seattle');

INSERT INTO categories (name)
VALUES
('Dogs'),
('Cats'),
('Soccer');

INSERT INTO users (username,password,preferred_region_id)
VALUES
('dogLover','doglover123',2),
('catLover','catlover123',3),
('soccerLover','soccerlover123',1);

INSERT INTO posts (title,body,location,user_id,region_id,category_id)
VALUES
('Blue Sofa', 'This is a cool sofa','downtown',1,1,3),
('Green Lamp', 'I love lamp','chinatown',2,2,1),
('Standing Desk', 'You can stand or sit!','central',3,3,2);