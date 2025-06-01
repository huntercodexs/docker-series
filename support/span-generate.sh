#!/bin/bash

TRACES_ENDPOINT="http://localhost:4318/v1/traces"
SERVICE="test-service"
KIND="client"
TEAM="huntercodexs"
ENV="manual"
TEST_TYPE="trace"

TOTAL=20

echo "Sending $TOTAL spans to $TRACES_ENDPOINT..."

for COUNTER in $(seq 1 $TOTAL)
do
  otel-cli span \
    --name "test-span-$COUNTER" \
    --service "$SERVICE" \
    --kind "$KIND" \
    --attrs "env=$ENV,team=$TEAM,testType=$TEST_TYPE,spanNum=$COUNTER" \
    --endpoint "$TRACES_ENDPOINT"

  echo -n "[$COUNTER] "
  sleep 1
done

echo "All $TOTAL spans was sent successfully!"

