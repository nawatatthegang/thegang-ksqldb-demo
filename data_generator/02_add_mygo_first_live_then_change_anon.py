import time

from sqlalchemy import create_engine, text
from consts import SOURCE_POSTGRES_URI

if __name__ == '__main__':
    engine = create_engine(SOURCE_POSTGRES_URI)
    with engine.connect() as conn:
        conn.execute(text("""
            INSERT INTO concerts (name, venue, event_date, band_id, attended, score_out_of_ten)
            VALUES ('MyGO!!!!! 1st LIVE: We''re Screaming Here', 'Shibuya duo MUSIC EXCHANGE', '2022-07-03'::DATE, 1, FALSE, 10.0::NUMERIC(2))
        """))
        conn.commit()
        print("MyGO!!!!! 1st LIVE added")

        time.sleep(5.0)

        conn.execute(text("""
            UPDATE characters 
            SET instrument = 'Guitar'
            WHERE name ~* 'Anon'
        """))
        conn.commit()
        print("Anon now plays Guitar")
