-- RTU class "Data Models in Database Systems"(DMDS), practical work 1 
-- The following ROLLUP construction can create three two of aggregation; 
-- - counting number of medals won by a athlete 
-- - counting total number of medals within the scope

SELECT
    athlete_name,
    medal,
    COUNT(*) AS number_of_medals
FROM 
    olympic_medal_causal_relationship
WHERE athletes_id = 6819 OR athletes_id = 14186
-- taking only two athletes with several medals so that result of query is easy to grasp 
-- you may remove this WHERE clause to see the whole result 
GROUP BY ROLLUP(athlete_name, medal);
