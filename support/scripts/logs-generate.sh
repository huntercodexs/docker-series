#!/bin/bash

SERVICE="test-service"
KIND="client"
TEAM="huntercodexs"
ENV="manual"
TOTAL=$1

echo "Sending $TOTAL traces, logs, and metrics..."

for COUNTER in $(seq 1 $TOTAL)
do

  # Logs - GPT AI
  echo "[$COUNTER] Sending log..."
  curl -X POST http://localhost:4318/v1/logs \
    -H "Content-Type: application/json" \
    -d '{
      "resourceLogs": [
        {
          "resource": {
            "attributes": [
              {"key": "service.name", "value": {"id": '"${COUNTER}"', "stringValue": "log-service"}}
            ]
          },
          "scopeLogs": [
            {
              "logRecords": [
                {
                  "timeUnixNano": "'"$(date +%s%N)"'",
                  "severityNumber": '${COUNTER}',
                  "severityText": "INFO",
                  "name": "example-log",
                  "body": {"stringValue": "User logged in successfully - GPT AI"},
                  "attributes": [
                    {"key": "user.id", "value": {"id": '"${COUNTER}"', "stringValue": "1234"}},
                    {"key": "session.id", "value": {"id": '"${COUNTER}"', "stringValue": "abcd-1234"}},
                    {"key": "message", "value": {"stringValue": "Message for tests"}}
                  ]
                },
                {
                  "timeUnixNano": "'$(date +%s%N)'",
                  "severityText": "WARN",
                  "body": { "stringValue": "{\"event\":\"user_action\",\"user_id\":1,\"action\":\"view_page\",\"page\":\"home\"}" },
                  "attributes": [
                    {"key": "log.source", "value": { "stringValue": "manual_curl_json"}},
                    {"key": "message", "value": {"stringValue": "Message for tests"}}
                  ]
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
