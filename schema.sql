
CREATE TABLE Games (
  id int NOT NULL GENERATED ALWAYS AS IDENTITY,
  author_id int,
  PRIMARY KEY(id)
);

CREATE TABLE Author (
 	id int NOT NULL GENERATED ALWAYS AS IDENTITY,
  first_name varchar(100),
  last_name varchar(100),
  PRIMARY KEY(id)
)

CREATE TABLE labels
(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title TEXT,
    color TEXT,
);

CREATE TABLE books
(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    publish_date DATE,
    archived BOOLEAN DEFAULT false,
    publisher TEXT,
    cover_state TEXT,
    author_id INT,
    label_id INT REFERENCES labels(id),
    genre_id INT,
    source_id INT
);