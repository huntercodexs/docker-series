#!/bin/bash

TRACES_ENDPOINT="http://localhost:4317/v1/traces"
LOGS_ENDPOINT="http://localhost:4317/v1/logs"
METRICS_ENDPOINT="http://localhost:4317/v1/metrics"

SERVICE="test-service"
KIND="client"
TEAM="huntercodexs"
ENV="manual"
TOTAL=5

echo "Sending $TOTAL traces, logs, and metrics..."

for COUNTER in $(seq 1 $TOTAL)
do

  # Traces
  echo "[$COUNTER] Sending traces..."
  curl -X POST http://localhost:4317/v1/traces \
   -H 'Content-Type: application/json' \
   -d '{
     "resourceSpans": [
       {
         "resource": {
           "attributes": [
             {"key": "service.name", "value": {"stringValue": "test-service"}},
             {"key": "team", "value": {"stringValue": "huntercodexs"}},
             {"key": "env", "value": {"stringValue": "manual"}}
           ]
         },
         "scopeSpans": [
           {
             "scope": {
               "name": "manual-generator",
               "version": "1.0.0"
             },
             "spans": [
               {
                 "traceId": "4d3c8a7e1ab5d6fa9c4b123456789abc",
                 "spanId": "1ab2c3d4e5f67890",
                 "name": "test-span",
                 "kind": 1,
                 "startTimeUnixNano": "1717158425000000000",
                 "endTimeUnixNano": "1717158426000000000",
                 "attributes": [
                   {"key": "custom.attribute", "value": {"stringValue": "value"}},
                   {"key": "spanNum", "value": {"intValue": 1}}
                 ],
                 "status": {
                   "code": 1,
                   "message": "Internal Error"
                 }
               }
             ]
           }
         ]
       }
     ]
   }'

  sleep 1

  # Logs
  echo "[$COUNTER] Sending log..."
  curl -s -X POST "$LOGS_ENDPOINT" \
    -H 'Content-Type: application/json' \
    -d '{
      "resourceLogs": [{
        "resource": {
          "attributes": [
            { "key": "service.name", "value": { "stringValue": "'"$SERVICE"'" } }
          ]
        },
        "scopeLogs": [{
          "logRecords": [{
            "timeUnixNano": "'"$(date +%s%N)"'",
            "severityText": "INFO",
            "body": { "stringValue": "Test log '"$COUNTER"'" },
            "attributes": [
              { "key": "env", "value": { "stringValue": "'"$ENV"'" } },
              { "key": "team", "value": { "stringValue": "'"$TEAM"'" } },
              { "key": "logNum", "value": { "intValue": '"$COUNTER"' } }
            ]
          }]
        }]
      }]
    }'

  sleep 1

  # Metrics
  echo "[$COUNTER] Sending metric..."
  curl -s -X POST "$METRICS_ENDPOINT" \
    -H 'Content-Type: application/json' \
    -d '{
      "resourceMetrics": [{
        "resource": {
          "attributes": [
            { "key": "service.name", "value": { "stringValue": "'"$SERVICE"'" } }
          ]
        },
        "scopeMetrics": [{
          "metrics": [{
            "name": "test_metric_'$COUNTER'",
            "sum": {
              "aggregationTemporality": 2,
              "isMonotonic": true,
              "dataPoints": [{
                "asDouble": '"$COUNTER"',
                "timeUnixNano": "'"$(date +%s%N)"'"
              }]
            }
          }]
        }]
      }]
    }'

  echo ""
  sleep 1
done

echo "All $TOTAL traces, logs, and metrics sent successfully!"
