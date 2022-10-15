-- RTU class "Data Models in Database Systems"(DMDS), practical work 1 
-- The following MODEL construction can create model analyzed from the dimenstions of season and city partitioned by athelete.
-- From the obtained result, you may see what kind of temperature or place is suitable for the given athlete.

SELECT *
FROM olympic_medal_causal_relationship
MODEL UNIQUE SINGLE REFERENCE
  PARTITION BY (athlete_name)
  DIMENSION BY (season, city)
  MEASURES (MEDAL)
  RULES()
