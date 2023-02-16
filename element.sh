#!/bin/bash
 
PSQL="psql -X --username=freecodecamp --dbname=periodic_table -t --no-align -c"

MAIN() {
# if no argument was given
if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
elif [[ $1 =~ ^[0-9]+$ ]]
then
  ATOMIC_NUM=$1
  SEARCH
  OUTPUT
else 
  FORMATTED_PAR=$( echo $1 | sed 's/\(^[a-z]\)/\U\1/g')
  ATOMIC_NUM=$($PSQL "SELECT atomic_number FROM elements WHERE symbol = '$FORMATTED_PAR' OR name = '$FORMATTED_PAR';")
  if [[ -z $ATOMIC_NUM ]]
  then
    echo "I could not find that element in the database."
  else
  SEARCH
  OUTPUT
  fi 
fi
}

SEARCH() {
  NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number = $ATOMIC_NUM")
  SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number = $ATOMIC_NUM")
  TYPE=$($PSQL "SELECT type FROM types WHERE type_id = (SELECT type_id FROM properties WHERE atomic_number = $ATOMIC_NUM)")
  ATOMIC_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number = $ATOMIC_NUM")
  M_POINT=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number = $ATOMIC_NUM")
  B_POINT=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number = $ATOMIC_NUM")
}
OUTPUT() {
  echo "The element with atomic number $ATOMIC_NUM is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $M_POINT celsius and a boiling point of $B_POINT celsius."
}
MAIN "$1"
