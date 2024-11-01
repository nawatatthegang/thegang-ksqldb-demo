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
  score_out_of_ten NUMERIC(2),
  created_at       TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE live_reactions
(
  id                SERIAL PRIMARY KEY,
  impression        TEXT,
  reaction_datetime TIMESTAMP,
  concert_id        INTEGER,
  social_platform   VARCHAR(50)
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

INSERT INTO
  concerts (name, venue, event_date, band_id, attended, score_out_of_ten)
VALUES
  ('MyGO!!!!! 1st LIVE: We''re Screaming Here',
   'Shibuya duo MUSIC EXCHANGE',
   '2022-07-03'::DATE,
   1,
   FALSE,
   10.0::NUMERIC(2));

CREATE DATABASE sink_db;