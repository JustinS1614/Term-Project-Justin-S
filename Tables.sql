CREATE DATABASE soccer_db;
USE soccer_db;

CREATE TABLE players (
    player_id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    nationality VARCHAR(50),
    position VARCHAR(50),
    market_value_in_eur DECIMAL(15,2)
);

CREATE TABLE clubs (
    club_id INT PRIMARY KEY,
    club_name VARCHAR(100),
    country VARCHAR(50)
);

CREATE TABLE competitions (
    competition_id VARCHAR(10) PRIMARY KEY,
    competition_name VARCHAR(100),
    country VARCHAR(50)
);

CREATE TABLE games (
    game_id INT PRIMARY KEY,
    competition_id VARCHAR(10),
    season INT,
    date DATE,
    home_club_id INT,
    away_club_id INT,
    home_club_name VARCHAR(100),
    away_club_name VARCHAR(100),
    home_club_goals INT,
    away_club_goals INT,
    stadium VARCHAR(100),
    attendance INT,
    FOREIGN KEY (competition_id) REFERENCES competitions(competition_id)
);

CREATE TABLE transfers (
    transfer_id INT PRIMARY KEY AUTO_INCREMENT,
    player_id INT,
    player_name VARCHAR(100),
    from_club_id INT,
    from_club_name VARCHAR(100),
    to_club_id INT,
    to_club_name VARCHAR(100),
    transfer_fee DECIMAL(15,2),
    transfer_date DATE,
    FOREIGN KEY (player_id) REFERENCES players(player_id),
    FOREIGN KEY (from_club_id) REFERENCES clubs(club_id),
    FOREIGN KEY (to_club_id) REFERENCES clubs(club_id)
);

CREATE TABLE appearances (
    appearance_id VARCHAR(50) PRIMARY KEY,
    game_id INT,
    player_id INT,
    player_name VARCHAR(100),
    club_id INT,
    club_name VARCHAR(100),
    current_club_id INT,
    competition_id VARCHAR(10),
    goals INT,
    assists INT,
    yellow_cards INT,
    red_cards INT,
    minutes_played INT,
    FOREIGN KEY (game_id) REFERENCES games(game_id),
    FOREIGN KEY (player_id) REFERENCES players(player_id),
    FOREIGN KEY (competition_id) REFERENCES competitions(competition_id)
);

SET GLOBAL local_infile = 1;