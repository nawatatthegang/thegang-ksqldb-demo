INSERT INTO
  concerts (name, venue, event_date, band_id, attended, score_out_of_ten)
VALUES
  ('MyGO!!!!! 3rd LIVE: Live With A Voice',
   'HIKOSEN Theater',
   '2022-11-26'::DATE,
   1,
   TRUE,
   10.0::NUMERIC(2));

INSERT INTO
  live_reactions
  (impression, reaction_datetime, concert_id, social_platform)
VALUES
  ('Yay', NOW() - '30 second'::INTERVAL, 3, 'Twitter'),
  ('Great concert', NOW() - '5 second'::INTERVAL, 3, 'Twitter'),
  ('That was amazing!', NOW(), 3, 'Twitter'),
  ('The lyrics made me cry', NOW() + '3 second'::INTERVAL, 3, 'Bluesky'),
  ('The bass was really thumping', NOW() + '5 second'::INTERVAL, 3, 'Bluesky'),
  ('I want to forget this live and come again', NOW() + '8 second'::INTERVAL, 3, 'X');
