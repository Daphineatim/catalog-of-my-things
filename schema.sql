
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