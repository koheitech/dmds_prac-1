-- RTU class "Data Models in Database Systems"(DMDS), practical work 1 
-- The following CUBE construction can create three types of aggregation; 
-- - counting number of medals won by a athlete 
-- - counting number of medals obtained by each medel 
-- - counting grad total within the scope

SELECT
    athlete_name,
    medal,
    COUNT(*) AS number_of_medals,
    -- GROUPING clause can tell you which part column is aaggregated, i.e. COUNTed
    -- if flag is 1, there are part of aggregation
    GROUPING(athlete_name) AS athlete_name_flag,
    GROUPING(medal) AS medal_flag
FROM 
    olympic_medal_causal_relationship
-- taking only two athletes with several medals so that result of query is easy to grasp
-- you may remove this WHERE clause to see the whole result
WHERE athletes_id = 6819 OR athletes_id = 14186
GROUP BY CUBE(athlete_name, medal);
