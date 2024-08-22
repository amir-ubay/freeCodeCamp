#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS

  # Loop for every data
  do
    # Check the header data
    if [[ $YEAR != year ]]
    then
      # SETUP database teams
      # get current team_id
      WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")

      OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

      if [[ -z $WINNER_ID ]]
      then
        # insert team using WINNER variable
        INSERT_WINNING_TEAM=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER') ON CONFLICT(name) DO NOTHING")
        # LOG SUCCESS
        if [[ $INSERT_WINNING_TEAM == "INSERT 0 1" ]]
          then
              # log success insert
              echo "Inserted into winning teams, $WINNER"
        fi
      fi  
      if [[ -z $OPPONENT_ID ]]
      then
         # insert team using OPPONENT variable
        INSERT_OPPONENT_TEAM=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT') ON CONFLICT(name) DO NOTHING")
        # LOG SUCCESS
        if [[ $INSERT_OPPONENT_TEAM == "INSERT 0 1" ]]
          then
              # log success insert
              echo "Inserted into opponent teams, $OPPONENT"
        fi
      fi
      # DEBUG BEFOR GAME INSERT
      WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
      OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
      echo "WINNER ID DEBUG VALUE IS $WINNER_ID"
      echo "OPPONENT ID DEBUG VALUE IS $OPPONENT_ID"
      # SETUP database games
      # GET game id
      GAME_ID=$($PSQL "SELECT game_id FROM games WHERE winner_id='$WINNER_ID' AND opponent_id='$OPPONENT_ID'")

      if [[ -z $GAME_ID ]]
      then
        # Insert game 
        # YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
        INSERT_GAME=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
        # Log if success
        if [[ $INSERT_GAME == "INSERT 0 1" ]]
        then
          echo "Inserted game $WINNER_ID vs $OPPONENT_ID "
        fi
      fi
    fi
  done
