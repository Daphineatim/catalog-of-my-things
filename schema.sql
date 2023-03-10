DROP TABLE IF EXISTS label

CREATE TABLE label
(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title TEXT,
    color TEXT
);

DROP TABLE IF EXISTS genre

CREATE TABLE genre
(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(100)
);

DROP TABLE IF EXISTS author

CREATE TABLE author(
    id INT CONSTRAINT ID_Author_PK PRIMARY KEY,
    first_name VARCHAR(40),
    last_name VARCHAR(40)
);

DROP TABLE IF EXISTS game

CREATE TABLE game(
    id INT CONSTRAINT ID_Games_PK PRIMARY KEY,
    multiplayer VARCHAR(40),
    last_played_at DATE,
    publish_date DATE,
    archived BOOLEAN,
    author_id INT REFERENCES Author(id),
    label_id INT REFERENCES labels(id),
    genre_id INT REFERENCES genre(id)
);

DROP TABLE IF EXISTS book

CREATE TABLE book(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    publish_date DATE,
    archived BOOLEAN DEFAULT false,
    publisher TEXT,
    cover_state TEXT,
    author_id INT REFERENCES Author(id),
    label_id INT REFERENCES labels(id),
    genre_id INT REFERENCES genre(id)
);

DROP TABLE IF EXISTS music_album

CREATE TABLE music_album
(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    publish_date DATE,
    archived BOOLEAN DEFAULT false,
    on_sportify BOOLEAN,
    author_id INT REFERENCES Author(id),
    label_id INT REFERENCES labels(id),
    genre_id INT REFERENCES genre(id)
);