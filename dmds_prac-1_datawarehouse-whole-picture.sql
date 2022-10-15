-- RTU class "Data Models in Database Systems"(DMDS), practical work 1 
-- The following materialized view is the whole picture of the given schema OLYM.

CREATE MATERIALIZED VIEW olym_whole_datawarehouse AS
SELECT
    athletes.id as athletes_id,
    athletes.athlete_name,
    athletes.athlete_gender,
    nations.id as nations_id,
    nations.nation,
    games.id as games_id,
    games.year,
    games.season,
    games.city,
    medals.id as medals_id,
    medals.medal,
    events.id as events_id,
    events.event_gender,
    base_events.id as base_events_id,
    base_events.event,
    disciplines.id as disciplines_id,
    disciplines.discipline,
    sports.id as sports_id,
    sports.sport
    
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

SELECT * FROM olym_whole_datawarehouse;