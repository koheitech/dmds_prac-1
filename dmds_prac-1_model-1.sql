-- RTU class "Data Models in Database Systems"(DMDS), practical work 1 
-- The following MODEL construction can create model analyzed from the dimenstions of year and event partitioned by athelete.
-- Since you may see the result of the games year by year, we may predict the result of upcoming game in 2012.

SELECT *
FROM olympic_medal_causal_relationship
WHERE athletes_id = 6819
MODEL UNIQUE SINGLE REFERENCE
  PARTITION BY (athlete_name)
  DIMENSION BY (year, event)
  MEASURES (medal)
  RULES UPSERT(medal[2012, '3m springboard'] = 'Gold');
