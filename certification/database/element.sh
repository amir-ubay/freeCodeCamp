PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

SEARCH_BY_ID() {
  SEARCH_RESULT=$($PSQL "SELECT * FROM elements as A JOIN properties USING (atomic_number) JOIN types USING (type_id) WHERE A.atomic_number= $1")  
}

SEARCH_BY_NAME() {
  SEARCH_RESULT=$($PSQL "SELECT * FROM elements as A JOIN properties USING (atomic_number) JOIN types USING (type_id) WHERE A.name= '$1' or A.symbol= '$1'")  
}

MAIN() {
case $1 in
  [1-9]|10) SEARCH_BY_ID $1;;
  *) SEARCH_BY_NAME $1;;
esac

if [[ -z $SEARCH_RESULT ]]
then
  echo "I could not find that element in the database."
else
  echo "$SEARCH_RESULT" | while IFS='|' read -r TYPE_ID ATOMIC_ID SYMBOL NAME MASS MELTING BOILING TYPE
do
  echo "The element with atomic number $ATOMIC_ID is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
done
fi
}

if [[ -z $1 ]]
then
  echo Please provide an element as an argument.
else
  MAIN "$1"
fi
