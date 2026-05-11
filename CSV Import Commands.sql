-- 1. players
LOAD DATA LOCAL INFILE 'C:/temps/top100_players.csv' INTO TABLE players FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS (player_id, name, nationality, position, market_value_in_eur);

-- 2. clubs
LOAD DATA LOCAL INFILE 'C:/temps/top_clubs.csv' INTO TABLE clubs FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS (club_id, club_name, country);

-- 3. competitions
LOAD DATA LOCAL INFILE 'C:/temps/top_competitions.csv' INTO TABLE competitions FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS (competition_id, competition_name, country);

-- 4. games
SET FOREIGN_KEY_CHECKS = 0;
LOAD DATA LOCAL INFILE 'C:/temps/top_games.csv' INTO TABLE games FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS (game_id, competition_id, season, date, home_club_id, away_club_id, home_club_name, away_club_name, home_club_goals, away_club_goals, stadium, attendance);
SET FOREIGN_KEY_CHECKS = 1;

-- 5. transfers
SET FOREIGN_KEY_CHECKS = 0;
LOAD DATA LOCAL INFILE 'C:/temps/top_transfers.csv' INTO TABLE transfers FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS (player_id, player_name, from_club_id, from_club_name, to_club_id, to_club_name, transfer_fee, transfer_date);
SET FOREIGN_KEY_CHECKS = 1;

-- 6. appearances
SET FOREIGN_KEY_CHECKS = 0;
LOAD DATA LOCAL INFILE 'C:/temps/top_appearances.csv' INTO TABLE appearances FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 ROWS (appearance_id, game_id, player_id, player_name, club_id, club_name, current_club_id, competition_id, goals, assists, yellow_cards, red_cards, minutes_played);
SET FOREIGN_KEY_CHECKS = 1;