INSERT INTO
  concerts (name, venue, event_date, band_id, attended, score_out_of_ten)
VALUES
  ('MyGO!!!!! 1st LIVE: We''re Screaming Here',
   'Shibuya duo MUSIC EXCHANGE',
   '2022-07-03'::DATE,
   1,
   FALSE,
   10.0::NUMERIC(2));

UPDATE characters
SET
  instrument = 'Guitar'
WHERE
  name ~* 'Anon';
