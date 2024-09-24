CREATE TABLE characters
(
  id         SERIAL PRIMARY KEY,
  name       VARCHAR(50),
  band_id    INTEGER,
  band_color CHAR(6),
  instrument VARCHAR(20)
);

CREATE TABLE bands
(
  id     SERIAL PRIMARY KEY,
  name   VARCHAR(50),
  color  CHAR(6),
  studio VARCHAR(50)
);

CREATE TABLE concerts
(
  id               SERIAL PRIMARY KEY,
  name             VARCHAR(255),
  venue            VARCHAR(255),
  event_date       DATE,
  band_id          INTEGER,
  attended         BOOLEAN,
  score_out_of_ten NUMERIC(2)
);

INSERT INTO bands (name, color, studio)
VALUES ('MyGO!!!!!', '3388BB', 'RiNG');

INSERT INTO
  characters (name, band_id, band_color, instrument)
VALUES
  ('Anon', 1, '3388BB', 'Vocal&Guitar'),
  ('Soyo', 1, '3388BB', 'Bass'),
  ('Taki', 1, '3388BB', 'Drum'),
  ('Tomori', 1, '3388BB', 'Vocal'),
  ('Raana', 1, '3388BB', 'Guitar');


CREATE DATABASE sink_db;