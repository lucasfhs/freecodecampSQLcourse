#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Caminho do arquivo CSV
CSV_FILE="games.csv"

# Inserir cada time único na tabela 'teams'
# O comando `tail -n +2` ignora a primeira linha (cabeçalho) do CSV.
# O comando `cut -d, -f3` pega a coluna 'winner' (time vencedor) e 'opponent' (time adversário), sem duplicação.
tail -n +2 "$CSV_FILE" | cut -d, -f3,4 | tr ',' '\n' | sort | uniq | while read team; do
  # Inserir o time na tabela 'teams', se não existir
  $PSQL "INSERT INTO teams (name) SELECT '$team' WHERE NOT EXISTS (SELECT 1 FROM teams WHERE name = '$team');"
done

# Leitura do arquivo CSV e inserção na tabela games
# Pular a primeira linha (cabeçalho)
tail -n +2 "$CSV_FILE" | while IFS=, read -r year round winner opponent winner_goals opponent_goals; do
  # Obter os IDs dos times vencedores e adversários
  winner_id=$($PSQL "SELECT team_id FROM teams WHERE name = '$winner';")
  opponent_id=$($PSQL "SELECT team_id FROM teams WHERE name = '$opponent';")

  # Inserir os dados na tabela 'games'
  $PSQL "INSERT INTO games (year, round, winner_id, opponent_id, winner_goals, opponent_goals)
  VALUES ($year, '$round', $winner_id, $opponent_id, $winner_goals, $opponent_goals);"
done
