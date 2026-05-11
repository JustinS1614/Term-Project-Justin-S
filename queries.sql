-- TOP 100 ROWS FROM EACH TABLE

SELECT * FROM players LIMIT 100;

SELECT * FROM clubs LIMIT 100;

SELECT * FROM competitions LIMIT 100;

SELECT * FROM games LIMIT 100;

SELECT * FROM transfers LIMIT 100;

SELECT * FROM appearances LIMIT 100;

-- JOIN QUERIES

-- Players and their appearance stats
SELECT p.name, p.nationality, p.position, p.market_value_in_eur,
       a.club_name, a.competition_id, a.goals, a.assists,
       a.yellow_cards, a.red_cards, a.minutes_played
FROM players p
JOIN appearances a ON p.player_id = a.player_id
LIMIT 100;

-- Transfers with player and club details
SELECT t.player_name, t.from_club_name, t.to_club_name,
       t.transfer_fee, t.transfer_date,
       p.nationality, p.position, p.market_value_in_eur
FROM transfers t
JOIN players p ON t.player_id = p.player_id
LIMIT 100;

-- Games with competition details
SELECT g.home_club_name, g.away_club_name, g.home_club_goals,
       g.away_club_goals, g.stadium, g.attendance, g.date,
       c.competition_name, c.country
FROM games g
JOIN competitions c ON g.competition_id = c.competition_id
LIMIT 100;

--Aggregate Queries:

-- Total goals and assists per player
SELECT p.name, p.position, p.nationality,
       SUM(a.goals) AS total_goals,
       SUM(a.assists) AS total_assists,
       SUM(a.minutes_played) AS total_minutes
FROM players p
JOIN appearances a ON p.player_id = a.player_id
GROUP BY p.player_id, p.name, p.position, p.nationality
ORDER BY total_goals DESC;

-- Average transfer fee by position
SELECT p.position,
       COUNT(t.transfer_id) AS total_transfers,
       AVG(t.transfer_fee) AS avg_transfer_fee,
       MAX(t.transfer_fee) AS highest_fee,
       SUM(t.transfer_fee) AS total_spent
FROM transfers t
JOIN players p ON t.player_id = p.player_id
GROUP BY p.position
ORDER BY avg_transfer_fee DESC;

-- Total attendance and games per competition
SELECT c.competition_name, c.country,
       COUNT(g.game_id) AS total_games,
       SUM(g.attendance) AS total_attendance,
       AVG(g.attendance) AS avg_attendance
FROM competitions c
JOIN games g ON c.competition_id = g.competition_id
GROUP BY c.competition_id, c.competition_name, c.country
ORDER BY total_attendance DESC;