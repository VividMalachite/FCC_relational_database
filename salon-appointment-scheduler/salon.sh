#! /bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"


echo -e "Welcome to My Salon, how can I help you?\n"

SERVICES() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi
SERVICES=$($PSQL "SELECT * FROM services;")
SERVICES_MAX=$($PSQL "SELECT MAX(service_id) FROM services;")
echo "$SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
do
  echo -e "$SERVICE_ID) $SERVICE_NAME"
done
SERVICES_MAX_FORMATTED=$(echo $SERVICES_MAX | sed 's/ //g')
read SERVICE_ID_SELECTED

case $SERVICE_ID_SELECTED in
[1-$SERVICES_MAX_FORMATTED]) CORRECT;;
q) EXIT;;
*) NOT_FOUND;;
esac
}
CORRECT() {
  # get phone
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE 
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE';")
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = '$SERVICE_ID_SELECTED';")

  # if not found
  if [[ -z $CUSTOMER_NAME ]]
    then 
      # get new customer name
      echo -e "\nI don'd have a record for that phone number, what's your name?"
      read CUSTOMER_NAME

      # insert new customer info
      INSERT_NEW_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE');")
  fi
  # get appointment (time)
  echo -e "\nWhat time would you like your $(echo$SERVICE_NAME | sed -r 's/^ *| *$//g'), $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."
  read SERVICE_TIME

  # get customer_id
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE';")

  # insert appointment
  INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(service_id, customer_id, time)
  VALUES($SERVICE_ID_SELECTED, $CUSTOMER_ID, '$SERVICE_TIME');")
  echo -e "\nI have put you down for a $(echo$SERVICE_NAME | sed -r 's/^ *| *$//g') at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."

}
NOT_FOUND() {
  echo -e "\nI could not find that service. What would you like today?"
  SERVICES
}
EXIT() {
  echo exit
}
SERVICES

