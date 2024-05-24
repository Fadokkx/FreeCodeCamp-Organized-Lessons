#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi
# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "TRUNCATE games, teams")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != "year" ]]
  then
 #------------------------------------------------------------------------------#
 #WINNER COMMANDS
    #GET WINNER ID 
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")

    #IF NOT FOUND CONDITION
    if [[ -z $WINNER_ID ]]
    then
      #INSERT WINNER
      INSERT_WINNER_TEAM=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")

      #RENAME OUTPUT
      if [[ $INSERT_WINNER_NAME == "INSERT 0 1" ]]
      then 
        echo Inserted into teams, $WINNER
      fi
       #GET WINNER INSERTED
      WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
      #IF NOT FOUND GO BACK TO THE FIRST IF CONDITION
    fi
    #------------------------------------------------------------------------------#
     #GET OPONNENT_ID
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

    #IF NOT FOUND CONDITION
    if [[ -z $OPPONENT_ID ]]
    then
      #INSERT OPONNENT
      INSERT_OPPONENT_TEAM=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
       
      #RENAME OUTPUT
      if [[ $INSERT_OPPONENT_NAME == "INSERT 0 1" ]]
      then 
        echo Inserted into teams, $OPPONENT
      fi

      #GET OPPONENT INSERTED 
      OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    fi
    #------------------------------------------------------------------------------#
    #INSERT DATA
    INSERT_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
    #RENAME OUTPUT
      if [[ $INSERT_RESULT == "INSERT 0 1" ]]
      then 
        echo Inserted into games, $YEAR, $ROUND, $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS
      fi

  fi
  done