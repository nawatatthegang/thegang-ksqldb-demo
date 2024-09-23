CREATE TABLE characters
(
  id         SERIAL PRIMARY KEY,
  first_name VARCHAR(50),
  last_name  VARCHAR(50),
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
  id          SERIAL PRIMARY KEY,
  name        VARCHAR(255),
  venue       VARCHAR(255),
  start_time  timestamptz,
  description VARCHAR(255),
  band_id     INTEGER
);

INSERT INTO bands (name, color, studio)
VALUES ('MyGO!!!!!', '3388BB', 'RiNG');

INSERT INTO
  characters (first_name, last_name, band_id, band_color, instrument)
VALUES
  ('Anon', 'Chihaya', 1, '3388BB', 'Guitar'),
  ('Soyo', 'Nagasaki', 1, '3388BB', 'Bass'),
  ('Taki', 'Shiina', 1, '3388BB', 'Drums'),
  ('Tomori', 'Takamatsu', 1, '3388BB', 'Vocals'),
  ('Raana', 'Kaname', 1, '3388BB', 'Guitar');