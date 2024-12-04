#!/bin/bash


PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"


echo "Enter your username:"
read USERNAME


USER_QUERY_RESULT=$($PSQL "SELECT user_id, games_played, best_game FROM users WHERE username='$USERNAME'")
if [[ -z $USER_QUERY_RESULT ]]; then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  INSERT_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
  GAMES_PLAYED=0
  BEST_GAME=null
else
  USER_ID=$(echo $USER_QUERY_RESULT | cut -d'|' -f1)
  GAMES_PLAYED=$(echo $USER_QUERY_RESULT | cut -d'|' -f2)
  BEST_GAME=$(echo $USER_QUERY_RESULT | cut -d'|' -f3)
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi


SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))
echo "Guess the secret number between 1 and 1000:"
NUMBER_OF_GUESSES=0

while true; do
  read GUESS
  ((NUMBER_OF_GUESSES++))
  
  if ! [[ $GUESS =~ ^[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
  elif [[ $GUESS -lt $SECRET_NUMBER ]]; then
    echo "It's higher than that, guess again:"
  elif [[ $GUESS -gt $SECRET_NUMBER ]]; then
    echo "It's lower than that, guess again:"
  else
    echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
    break
  fi
done


NEW_GAMES_PLAYED=$(( GAMES_PLAYED + 1 ))
if [[ $BEST_GAME == "null" || $NUMBER_OF_GUESSES -lt $BEST_GAME ]]; then
  NEW_BEST_GAME=$NUMBER_OF_GUESSES
else
  NEW_BEST_GAME=$BEST_GAME
fi

UPDATE_USER=$($PSQL "UPDATE users SET games_played=$NEW_GAMES_PLAYED, best_game=$NEW_BEST_GAME WHERE user_id=$USER_ID")
#1
#2
#3
#4