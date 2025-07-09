#!/bin/bash

SERVICE="test-service"
KIND="client"
TEAM="huntercodexs"
ENV="manual"
TOTAL=$1

echo "Sending $TOTAL traces, logs, and metrics..."

for COUNTER in $(seq 1 $TOTAL)
do

  echo "[$COUNTER] Sending metric..."
  curl -X POST http://localhost:4318/v1/metrics \
    -H "Content-Type: application/json" \
    -d '{
      "resourceMetrics": [
        {
          "resource": {
            "attributes": [
              {"key": "service.name", "value": {"id": '"${COUNTER}"', "stringValue": "metrics-service"}}
            ]
          },
          "instrumentationLibraryMetrics": [
            {
              "metrics": [
                {
                  "name": "cpu_usage",
                  "description": "CPU Usage",
                  "unit": "%",
                  "sum": {
                    "dataPoints": [
                      {
                        "asDouble": 75.5,
                        "timeUnixNano": "'"$(date +%s%N)"'"
                      }
                    ],
                    "aggregationTemporality": "AGGREGATION_TEMPORALITY_CUMULATIVE",
                    "isMonotonic": false
                  }
                }
              ]
            }
          ]
        }
      ]
    }'

  echo ""
  sleep 1
done

echo "All $TOTAL traces, logs, and metrics sent successfully!"
