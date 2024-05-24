--CREATING DB
CREATE DATABASE worldcup;

--CREATING TABLE TEAMS
CREATE TABLE teams(
);

--CREATING TABLE GAMES
CREATE TABLE games (
  winner_id INTEGER, 
  FOREIGN KEY (winner_id) REFERENCES teams (team_id),
  opponent_id INTEGER,
  FOREIGN KEY (opponent_id) REFERENCES teams (team_id)
);

--ALTERING TABLE TEAMS
ALTER TABLE teams ADD column team_id SERIAL PRIMARY KEY;
ALTER TABLE teams add column name varchar (50) UNIQUE;
ALTER TABLE teams 
ALTER column team_id SET NOT NULL;
ALTER TABLE teams 
ALTER column name SET NOT NULL;

--ALTERING TABLE GAMES
ALTER TABLE games ADD Column game_id SERIAL PRIMARY KEY;
ALTER TABLE games ADD column year INT;
ALTER TABLE games ADD column round VARCHAR (30);
ALTER TABLE games ADD COLUMN winner_goals INT;
ALTER TABLE games ADD COLUMN opponent_goals INT;
ALTER TABLE games 
ALTER column game_id SET NOT NULL;
ALTER TABLE games 
ALTER column year SET NOT NULL;
ALTER TABLE games 
ALTER column round SET NOT NULL;
ALTER TABLE games 
ALTER column winner_goals SET NOT NULL;
ALTER TABLE games 
ALTER column opponent_goals SET NOT NULL;
ALTER TABLE games 
ALTER column winner_id SET NOT NULL;
ALTER TABLE games 
ALTER column opponent_id SET NOT NULL;