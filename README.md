# ksqlDB Demo for KS Session

You are a proud concert-going blogger and want to show which (anime-based) concerts you have attended on your personal
blog along with a few other details. So, you are tracking the following data:

- Characters
    - Name that the character is most known by `name`
    - Band they're in `band_id`
    - Band color `band_color`
    - Instrument they play `instrument`
- Bands
    - Band name `name`
    - Band color `color`
    - Studio that they use to practice `studio`
- Concerts
    - Concert name `name`
    - Venue `venue`
    - Date of the concert `event_date`
    - Band performing `band_id`
    - Flag for if you've attended or not `attended`
    - Score out of 10 `score_out_of_ten`
- Songs played
    - Concert `concert_id`
    - Song name `name`
- Live reaction to songs
    - Impression `impression`
    - Tweet timestamp `reaction_datetime`
    - Concert `concert_id`
    - Song `song_id`

## Table-Table Join

We want to show details about our favorite bands and their members.

```json
{
  "band_name": "string",
  "members": [
    {
      "member_name": "string",
      "member_role": "string"
    }
  ]
}
```

## Stream-Table Join

We want to show details about the concerts that we've been to along with the songs that have been played.

```json
{
  "concert_name": "string",
  "venue": "string",
  "event_date": "string",
  "band_name": "string",
  "score": 10.0,
  "performers": [
    {
      "character_name": "string",
      "instrument": "string"
    }
  ],
  "songs": [
    "song_name"
  ]
}
```

## Stream-Stream Join

We want to show our live reactions to each song.

```json
{
  "song_name": "string",
  "impression": [
    "string"
  ]
}
```