CREATE VIEW player_summary AS
SELECT 
    p.player_id,
    p.name AS player_name,
    p.nationality,
    p.position,
    p.market_value_in_eur,
    c.club_name AS current_club,
    c.country AS club_country,
    co.competition_name AS competition_played,
    a.goals,
    a.assists,
    a.yellow_cards,
    a.red_cards,
    a.minutes_played,
    g.stadium,
    g.date AS game_date
FROM players p
JOIN appearances a ON p.player_id = a.player_id
JOIN clubs c ON a.club_id = c.club_id
JOIN competitions co ON a.competition_id = co.competition_id
JOIN games g ON a.game_id = g.game_id;

-- Test the view
SELECT * FROM player_summary LIMIT 100;