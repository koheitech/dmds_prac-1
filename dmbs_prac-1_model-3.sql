-- RTU class "Data Models in Database Systems"(DMDS), practical work 1 
-- The following MODEL construction can create model analyzed from the dimenstions of sport and discipline partitioned by nation.
-- From the obtained result, you may see the focused sports by each country.

SELECT *
FROM olympic_medal_causal_relationship
MODEL UNIQUE SINGLE REFERENCE
  PARTITION BY (nation)
  DIMENSION BY (sport, discipline)
  MEASURES (medal)
  RULES();
