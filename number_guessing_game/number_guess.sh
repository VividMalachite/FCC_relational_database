#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=number_guess -t --no-align -c"

LOGIN (){
  echo -e "\nEnter your username:"
  read USER
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USER';")
  if [[ -z $USER_ID ]]
    then
    INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USER');")
    USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USER';")
    echo -e "\nWelcome, $USER! It looks like this is your first time here."
    GAME
  else 
    USERNAME=$($PSQL "SELECT username FROM users WHERE user_id = $USER_ID;")
    GAMES_PLAYED=$($PSQL "SELECT COUNT(game_id) FROM games WHERE user_id = $USER_ID;")
    BEST_GAME=$($PSQL "SELECT MIN(tries) FROM games WHERE user_id = $USER_ID;")
    echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
    GAME
  fi
}

GAME () {
  COUNTER=0
  SECRET_NUMBER=$(($RANDOM % 1000 + 1))
  echo -e "\nGuess the secret number between 1 and 1000:"
  #echo $SECRET_NUMBER
  until [[ $GUESS -eq $SECRET_NUMBER ]]
  do
    read GUESS
    ((COUNTER++)) 
    if [[ $GUESS =~ [^0-9] ]]
    then
      echo -e "\nThat is not an integer, guess again:"
    else
      if [[ $GUESS -gt $SECRET_NUMBER ]]
      then
        echo -e "\nIt's lower than that, guess again:"
      elif [[ $GUESS -lt $SECRET_NUMBER ]]
      then
        echo -e "\nIt's higher than that, guess again:"
      else
        INSERT_GAMES_RESULT=$($PSQL "INSERT INTO games(tries, user_Id) VALUES($COUNTER, $USER_ID);")
        echo "You guessed it in $COUNTER tries. The secret number was $SECRET_NUMBER. Nice job!"
      fi
    fi
  done
}
LOGIN