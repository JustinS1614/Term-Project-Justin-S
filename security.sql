CREATE ROLE soccer_readonly;

-- Give the role SELECT only on all tables and the view
GRANT SELECT ON soccer_db.players TO soccer_readonly;
GRANT SELECT ON soccer_db.clubs TO soccer_readonly;
GRANT SELECT ON soccer_db.competitions TO soccer_readonly;
GRANT SELECT ON soccer_db.games TO soccer_readonly;
GRANT SELECT ON soccer_db.transfers TO soccer_readonly;
GRANT SELECT ON soccer_db.appearances TO soccer_readonly;
GRANT SELECT ON soccer_db.player_summary TO soccer_readonly;

-- Creating the users:
CREATE USER 'scout_user'@'localhost' IDENTIFIED BY 'password123';
CREATE USER 'analyst_user'@'localhost' IDENTIFIED BY 'password123';
CREATE USER 'reporter_user'@'localhost' IDENTIFIED BY 'password123';
CREATE USER 'intern_user'@'localhost' IDENTIFIED BY 'password123';

-- Assign the role to each user:
GRANT soccer_readonly TO 'scout_user'@'localhost';
GRANT soccer_readonly TO 'analyst_user'@'localhost';
GRANT soccer_readonly TO 'reporter_user'@'localhost';
GRANT soccer_readonly TO 'intern_user'@'localhost';

FLUSH PRIVILEGES;

-- Verify the role assignments: 
SELECT * FROM mysql.roles_mapping;

-- Should only have SELECT privileges: 
SHOW GRANTS FOR soccer_readonly;