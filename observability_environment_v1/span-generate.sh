#!/bin/bash

# Configurações
ENDPOINT="http://localhost:4318/v1/traces"
SERVICE="test-service"
KIND="client"
TEAM="huntercodexs"
ENV="manual"
TEST_TYPE="trace"

# Número de spans a serem enviados
COUNT=100

echo "Enviando $COUNT spans para $ENDPOINT..."

for i in $(seq 1 $COUNT)
do
  otel-cli span \
    --name "test-span-$i" \
    --service "$SERVICE" \
    --kind "$KIND" \
    --attrs "env=$ENV,team=$TEAM,testType=$TEST_TYPE,spanNum=$i" \
    --endpoint "$ENDPOINT"

  echo "Enviado span $i"
done

echo "Todos os $COUNT spans enviados com sucesso!"

