DROP TABLE IF EXISTS Games
DROP TABLE IF EXISTS author;

CREATE TABLE Games (
  id int NOT NULL GENERATED ALWAYS AS IDENTITY,
  multiplayer boolean,
  last_played_at date,
  author_id int,
  publish_date date,
  archived boolean,
  PRIMARY KEY(id)
);

CREATE TABLE Author (
 	id int NOT NULL GENERATED ALWAYS AS IDENTITY,
  first_name varchar(100),
  last_name varchar(100),
  PRIMARY KEY(id)
)