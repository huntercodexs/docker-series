#!/bin/bash

ENDPOINT="http://localhost:4318/v1/traces"
SERVICE="test-service"
KIND="client"
TEAM="huntercodexs"
ENV="manual"
TEST_TYPE="trace"

COUNT=100

echo "Sending $COUNT spans to $ENDPOINT..."

for i in $(seq 1 $COUNT)
do
  otel-cli span \
    --name "test-span-$i" \
    --service "$SERVICE" \
    --kind "$KIND" \
    --attrs "env=$ENV,team=$TEAM,testType=$TEST_TYPE,spanNum=$i" \
    --endpoint "$ENDPOINT"

  echo "Sent span $i"
done

echo "All $COUNT spans was sent successfully!"

