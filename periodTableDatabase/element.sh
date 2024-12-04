#!/bin/bash

# Variável para se conectar ao banco de dados PostgreSQL
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# Verificar se um argumento foi passado
if [[ -z $1 ]]; then
  echo "Please provide an element as an argument."
  exit 0
fi

# Verificar se o argumento é numérico (para buscar por número atômico)
if [[ $1 =~ ^[0-9]+$ ]]; then
  # Buscar informações pelo número atômico
  RESULT=$($PSQL "SELECT e.atomic_number, e.name, e.symbol, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius
                 FROM elements e
                 JOIN properties p ON e.atomic_number = p.atomic_number
                 WHERE e.atomic_number = $1")
else
  # Buscar informações pelo símbolo ou nome
  RESULT=$($PSQL "SELECT e.atomic_number, e.name, e.symbol, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius
                 FROM elements e
                 JOIN properties p ON e.atomic_number = p.atomic_number
                 WHERE e.symbol = '$1' OR e.name = '$1'")
fi

# Se não encontrar nenhum resultado
if [[ -z $RESULT ]]; then
  echo "I could not find that element in the database."
  exit 0
fi

# Formatar a saída
ATOM_NUMBER=$(echo $RESULT | cut -d '|' -f 1)
NAME=$(echo $RESULT | cut -d '|' -f 2)
SYMBOL=$(echo $RESULT | cut -d '|' -f 3)
MASS=$(echo $RESULT | cut -d '|' -f 4)
MELTING_POINT=$(echo $RESULT | cut -d '|' -f 5)
BOILING_POINT=$(echo $RESULT | cut -d '|' -f 6)

# Exibir o resultado formatado conforme solicitado
echo "The element with atomic number $ATOM_NUMBER is $NAME ($SYMBOL). It's a nonmetal, with a mass of $MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
