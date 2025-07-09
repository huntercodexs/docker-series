#!/bin/bash

SERVICE="test-service"
KIND="client"
TEAM="huntercodexs"
ENV="manual"
TOTAL=$1

echo "Sending $TOTAL traces, logs, and metrics..."

for COUNTER in $(seq 1 $TOTAL)
do

  echo "[$COUNTER] Sending trace..."
  curl -X POST http://localhost:4318/v1/traces \
    -H "Content-Type: application/json" \
    -d '{
      "resourceSpans": [
        {
          "resource": {
            "attributes": [
              {"key": "service.name", "value": {"id": '"${COUNTER}"', "stringValue": "example-service"}}
            ]
          },
          "instrumentationLibrarySpans": [
            {
              "spans": [
                {
                  "traceId": "4bf92f3577b34da6a3ce929d0e0e4736",
                  "spanId": "00f067aa0ba902b7",
                  "name": "example-span",
                  "kind": "SPAN_KIND_INTERNAL",
                  "startTimeUnixNano": "'"$(date +%s%N)"'",
                  "endTimeUnixNano": "'"$(date +%s%N)"'",
                  "attributes": [
                    {"key": "http.method", "value": {"id": '"${COUNTER}"', "stringValue": "GET"}},
                    {"key": "http.url", "value": {"id": '"${COUNTER}"', "stringValue": "/api/test"}}
                  ],
                  "status": {"code": "STATUS_CODE_OK"}
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
