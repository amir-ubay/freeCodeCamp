#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"


MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1\n"
  fi
  LIST_SERVICES=$($PSQL "SELECT * FROM services")
  echo "$LIST_SERVICES" | while read ID BAR NAME
  do
    echo "$ID) $NAME"
  done

  read SERVICE_ID_SELECTED
  case $SERVICE_ID_SELECTED in
    [1-5]) ORDER;;
        *) MAIN_MENU "Please select provided services from list."
  esac

}

ORDER() {
  # Check selected service
  echo "Selected service is $SERVICE_ID_SELECTED"

  # Ask phone number
  echo -e "\nInput you phone number"
  read CUSTOMER_PHONE

  CHECK_PHONE=$($PSQL "SELECT * FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  if [[ -z $CHECK_PHONE ]]
  then
    # Create New User
    # Ask name
    echo -e "\nWhat is your name?"
    read CUSTOMER_NAME

    CREATE_NEW_USER=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
    
    if [[ $CREATE_NEW_USER == 'INSERT 0 1' ]]
    then
      echo "Success create new user: $CUSTOMER_NAME $CUSTOMER_PHONE"
    fi
  else
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  fi

  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

  # Ask time booking
  echo -e "\nWhen will you come?"
  read SERVICE_TIME
  
  echo -e "\nConfirmed order details: "
  echo "$CUSTOMER_PHONE $CUSTOMER_NAME $SERVICE_TIME"
  BOOKING
}

BOOKING() {
  BOOKING_STATUS=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
  if [[ $BOOKING_STATUS=='INSERT 0 1' ]]
  then
    # I have put you down for a <service> at <time>, <name>.
    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
    THE_CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE customer_id = $CUSTOMER_ID")
    echo "I have put you down for a$SERVICE_NAME at $SERVICE_TIME,$THE_CUSTOMER_NAME."
  fi
}

MAIN_MENU
