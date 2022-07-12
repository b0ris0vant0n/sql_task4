CREATE TABLE IF NOT EXISTS genre(
id SERIAL PRIMARY KEY,
name VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS singer(
id SERIAL PRIMARY KEY,
name VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS singer_genre(
singer_id int REFERENCES singer(id),
genre_id int REFERENCES genre(id)
);

CREATE TABLE IF NOT EXISTS album(
id SERIAL PRIMARY KEY,
name VARCHAR(60) NOT NULL,
release_year int NOT NULL CHECK (release_year > 1900)
);

CREATE TABLE IF NOT EXISTS album_singer(
singer_id int REFERENCES singer(id),
album_id int REFERENCES album(id),
CONSTRAINT pk PRIMARY KEY (singer_id, album_id)
);

CREATE TABLE IF NOT EXISTS track(
id SERIAL PRIMARY KEY,
name varchar(80) NOT NULL,
duration int NOT NULL,
album_id int REFERENCES album(id)
);

CREATE TABLE IF NOT EXISTS collections(
id SERIAL PRIMARY KEY,
release_year int NOT NULL CHECK (release_year > 1900),
name varchar(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS track_collections(
collections_id int REFERENCES collections(id),
track_id int REFERENCES track(id),
CONSTRAINT pk_track PRIMARY KEY (collections_id, track_id)
);


