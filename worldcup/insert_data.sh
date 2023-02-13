#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "TRUNCATE games, teams;")
# Insert teams table info
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
if [[ $WINNER != "winner" ]]
then
  # get team id
  TEAM_ID_WIN=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER';")
  TEAM_ID_OPP=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT';")
  # not found
  if [[ -z $TEAM_ID_WIN ]]
   then 
    # insert team id 
    INSERT_TEAM_ID_WIN_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER');")
    if [[ $INSERT_TEAM_ID_WIN_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted winnner into teams, $WINNER
    fi
  elif [[ -z $TEAM_ID_OPP ]]
   then 
    INSERT_TEAM_ID_OPP_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT');")
    if [[ $INSERT_TEAM_ID_OPP_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted opponent into teams, $OPPONENT
    fi
     # get new id
    TEAM_ID_WIN=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER';")
    TEAM_ID_OPP=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT';")
  fi
fi
done
# Insert game table info
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
TEAM_ID_WIN=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER';")
TEAM_ID_OPP=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT';")
if [[ $YEAR != "year" ]]
then
  INSERT_GAMES_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id,
  winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $TEAM_ID_WIN, $TEAM_ID_OPP,
  $WINNER_GOALS, $OPPONENT_GOALS);")
  if [[ $INSERT_GAMES_RESULT == "INSERT 0 1" ]]
  then
    echo inserted game: $WINNER VS $OPPONENT
  fi
fi
done 
