-- RTU class "Data Models in Database Systems"(DMDS), practical work 1 
-- This script creates the datawarehouse for the practical work of RTU class DMDS, 
-- which is for analysis of the causal relationships regarding the Olympics medals.

CREATE MATERIALIZED VIEW olympic_medal_causal_relationship AS
SELECT
    -- OLYM_ATHLETES
    athletes.id as athletes_id,
    athletes.athlete_name,
    athletes.athlete_gender,

    -- OLYM_GAMES
    athlete_games.id as athlete_games_id,
    nations.nation,
    games.year,
    games.season,
    games.city,

    -- OLYM_SPORTS
    events.id as events_id,
    sports.sport,
    disciplines.discipline,
    base_events.event,
    events.event_gender,
    
    medals.medal
    
FROM
    OLYM.OLYM_ATHLETES athletes,
    OLYM.OLYM_ATHLETE_GAMES athlete_games,
    OLYM.OLYM_GAMES games,
    OLYM.OLYM_NATIONS nations,
    OLYM.OLYM_BASE_EVENTS base_events,
    OLYM.OLYM_MEDALS medals,
    OLYM.OLYM_SPORTS sports,
    OLYM.OLYM_DISCIPLINES disciplines,
    OLYM.OLYM_EVENTS events
WHERE
    athletes.id = athlete_games.athlete_id AND 
    athlete_games.game_id = games.id AND 
    athlete_games.nation_id = nations.id AND 
    athlete_games.id = medals.athlete_game_id AND 
    medals.event_id = events.id AND 
    events.base_event_id = base_events.id AND 
    base_events.discipline_id = disciplines.id AND 
    disciplines.sport_id = sports.id;

-- output the result of datawarehouse
SELECT * FROM olympic_medal_causal_relationship;