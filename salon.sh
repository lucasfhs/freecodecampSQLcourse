#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=salon -t --no-align -c"

display_services() {
  echo -e "\n~~~~~ MY SALON ~~~~~"
  echo -e "\nWelcome to My Salon, how can I help you?\n"
  SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")
  echo "$SERVICES" | while IFS="|" read SERVICE_ID SERVICE_NAME; do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done
}


schedule_appointment() {
  display_services
  echo -e "\nPlease select a service by entering the service ID:"
  read SERVICE_ID_SELECTED


  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
  if [[ -z $SERVICE_NAME ]]; then
    echo -e "\nI could not find that service. What would you like today?"
    schedule_appointment
    return
  fi


  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE


  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  if [[ -z $CUSTOMER_ID ]]; then

    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME


    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
    if [[ $INSERT_CUSTOMER_RESULT == "INSERT 0 1" ]]; then
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    fi
  else
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE customer_id = $CUSTOMER_ID")
  fi


  echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
  read SERVICE_TIME


  INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
  if [[ $INSERT_APPOINTMENT_RESULT == "INSERT 0 1" ]]; then
    echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
  else
    echo -e "\nAn error occurred while scheduling your appointment. Please try again."
  fi
}

schedule_appointment
