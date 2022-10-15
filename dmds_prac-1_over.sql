-- RTU class "Data Models in Database Systems"(DMDS), practical work 1 
-- The following RANK OVER construction can create ranking 
-- based on the number of games held by each gender,
-- which may imply the gender inequality for the Olymics games

SELECT 
    event_gender,
    COUNT(event_gender) AS number_of_games_by_each_gender,
    RANK() OVER (ORDER BY COUNT(event_gender) DESC) AS gender_priority_ranking
FROM
    olympic_medal_causal_relationship
GROUP BY (event_gender)