#!/bin/bash
echo "iniciando o setup de processamento"
echo ""
archive=99
# shellcheck disable=SC1057
# shellcheck disable=SC1060
# shellcheck disable=SC1073
# shellcheck disable=SC2170
while [ $archive -gt 1 ]; do
  echo Olá, insira o número do arquivo você pretende gerar hoje ?
  echo "1 - Sair do programa"
  echo "2 - Relação de players x time"
  read archive
  if [ $archive -eq 2 ]; then
    echo "Iniciando processamento do arquivo de players vs time"
    ~/spark/spark-3.1.1-bin-hadoop2.7/bin/spark-submit --class org.apache.spark.examples.Spark_Pi --master local[8] quantityPlayersOfTeams.py
  fi
done
# shellcheck disable=SC1073

echo "Obrigado pela visita, volte assim que precisar de arquivos atualizados"
