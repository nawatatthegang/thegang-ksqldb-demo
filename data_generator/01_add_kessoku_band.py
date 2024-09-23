from sqlalchemy import create_engine, text
from consts import SOURCE_POSTGRES_URI

if __name__ == '__main__':
    engine = create_engine(SOURCE_POSTGRES_URI)
    with engine.connect() as conn:
        conn.execute(text("""
            INSERT INTO bands (name, color, studio)
            VALUES ('Kessoku Band', 'FBF304', 'STARRY');
        """))
        conn.commit()
        print("Kessoku Band added")

        conn.execute(text("""
            INSERT INTO characters (name, band_id, band_color, instrument) 
            VALUES 
                ('Kita', 2, 'FBF304', 'Vocal&Guitar'),
                ('Hitori', 2, 'FBF304', 'Guitar'),
                ('Ryo', 2, 'FBF304', 'Bass'),
                ('Nijika', 2, 'FBF304', 'Drum');
        """))
        conn.commit()
        print("Kessoku Band members added")
