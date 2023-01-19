DROP TABLE IF EXISTS musicalbums
DROP TABLE IF EXISTS genre
DROP TABLE IF EXISTS Games
DROP TABLE IF EXISTS author;

CREATE TABLE Games (
  id int NOT NULL GENERATED ALWAYS AS IDENTITY,
  multiplayer boolean,
  last_played_at date,
  author_id int,
  publish_date date,
  archived boolean
  );

CREATE TABLE Author (
 	id int NOT NULL GENERATED ALWAYS AS IDENTITY,
  first_name varchar(100),
  last_name varchar(100),
  PRIMARY KEY(id)
)

CREATE TABLE genre (
  id INT NOT NULL GENERATED ALWAYS AS IDENTITY
  genre_name varchar(255) NOT NULL
  PRIMARY KEY(id)
)

CREATE TABLE musicalbums (
  id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
  publish_date DATE,
  archived BOOLEAN DEFAULT false,
  on_spotify BOOLEAN NOT NULL,
  author_id INT NULL REFERENCES author(id) ON DELETE CASCADE,
  genre_id INT NULL REFERENCES genre(id) ON DELETE CASCADE,
  label_id INT NULL REFERENCES label(id) ON DELETE CASCADE
  PRIMARY KEY(id)
);
