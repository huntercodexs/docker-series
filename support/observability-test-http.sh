#!/bin/bash

TRACES_ENDPOINT="http://localhost:4318/v1/traces"
LOGS_ENDPOINT="http://localhost:4318/v1/logs"
METRICS_ENDPOINT="http://localhost:4318/v1/metrics"

SERVICE="test-service"
KIND="client"
TEAM="huntercodexs"
ENV="manual"
TOTAL=5

echo "Sending $TOTAL traces, logs, and metrics..."

for COUNTER in $(seq 1 $TOTAL)
do

  # Traces
  echo "[$COUNTER] Sending trace..."
  curl -X POST http://localhost:4318/v1/traces \
    -H "Content-Type: application/json" \
    -d '{
      "resourceSpans": [
        {
          "resource": {
            "attributes": [
              {"key": "service.name", "value": {"stringValue": "example-service"}}
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
                  "startTimeUnixNano": "1672531200000000000",
                  "endTimeUnixNano": "1672531201000000000",
                  "attributes": [
                    {"key": "http.method", "value": {"stringValue": "GET"}},
                    {"key": "http.url", "value": {"stringValue": "/api/test"}}
                  ],
                  "status": {"code": "STATUS_CODE_OK"}
                }
              ]
            }
          ]
        }
      ]
    }'

  sleep 1

  # Logs - GPT AI
  echo "[$COUNTER] Sending log..."
  curl -X POST http://localhost:4318/v1/logs \
    -H "Content-Type: application/json" \
    -d '{
      "resourceLogs": [
        {
          "resource": {
            "attributes": [
              {"key": "service.name", "value": {"stringValue": "log-service"}}
            ]
          },
          "scopeLogs": [
            {
              "logRecords": [
                {
                  "timeUnixNano": "1672531200000000000",
                  "severityNumber": 9,
                  "severityText": "INFO",
                  "name": "example-log",
                  "body": {"stringValue": "User logged in successfully - GPT AI"},
                  "attributes": [
                    {"key": "user.id", "value": {"stringValue": "1234"}},
                    {"key": "session.id", "value": {"stringValue": "abcd-1234"}}
                  ]
                }
              ]
            }
          ]
        }
      ]
    }'

    #Logs - Gemini AI
    curl -X POST \
      http://localhost:4318/v1/logs \
      -H 'Content-Type: application/json' \
      -d '{
        "resource_logs": [
          {
            "resource": {
              "attributes": [
                { "key": "service.name", "value": { "string_value": "manual-test-service" } },
                { "key": "environment", "value": { "string_value": "testing" } }
              ]
            },
            "scope_logs": [
              {
                "scope": {},
                "log_records": [
                  {
                    "time_unix_nano": "'$(($(date +%s%N)))'",
                    "severity_text": "INFO",
                    "body": { "string_value": "This is a log message from curl test - GEMINI AI." },
                    "attributes": [
                      { "key": "component", "value": { "string_value": "curl-test" } },
                      { "key": "http.method", "value": { "string_value": "POST" } }
                    ]
                  }
                ]
              }
            ]
          }
        ]
      }'

  sleep 1

  # Metrics
  echo "[$COUNTER] Sending metric..."
  curl -X POST http://localhost:4318/v1/metrics \
    -H "Content-Type: application/json" \
    -d '{
      "resourceMetrics": [
        {
          "resource": {
            "attributes": [
              {"key": "service.name", "value": {"stringValue": "metrics-service"}}
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
                        "timeUnixNano": "1672531200000000000"
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
