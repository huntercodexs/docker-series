# OPENSEARCH

- How to run opentelemety from this project use

<pre>
user@host:/home/user$ git clone https://github.com/huntercodexs/docker-series.git .
user@host:/home/user$ cd docker-series/self-containers/opentelemetry/opensearch/latest
user@host:/home/user/docker-series/self-containers/opentelemetry$ docker-compose up --build
user@host:/home/user/docker-series/self-containers/opentelemetry$ docker-compose start
</pre>

- Access the application

http://localhost:5601

Username: admin (this is the initial username)
Password: (the same defined in the .env file: OPENSEARCH_INITIAL_ADMIN_PASSWORD)

- Setup (Administration)

You can navigate to http://localhost:5601/app/management/opensearch-dashboards/settings to make many kind of 
configurations according you like.

### Troubleshoot

In case any error about memory, try to fix it using the command below

```shell
sudo sysctl -w vm.max_map_count=262144
```

this command might fix the following error

```text
opensearch-node          | ERROR: [1] bootstrap checks failed
opensearch-node          | [1]: max virtual memory areas vm.max_map_count [65530] is too low, increase to at least [262144]
opensearch-node          | ERROR: OpenSearch did not exit normally - check the logs at /usr/share/opensearch/logs/opensearch-cluster.log
```

### Usage

- Create Items

> POST /any-index-name/_doc

```json
{
    "id": "d1f91b2b-c974-4737-b696-582815190745",
    "createdAt": "2025-05-21T20:15:43.705088Z",
    "anyObjectInformation": {
        "name": "ENROLLMENT_EXAMPLE",
        "code": "10000",
        "type": "anyType",
        "subtype": "anySubTYpe"
    },
    "transactionalId": null,
    "sessionId": null,
    "traceId": "1a8419e6efcb4dd5a10204f931a99999",
    "serviceOrigin": "opensearch-api",
    "spanId": null,
    "anyExtraDetails": {
        "resource": "AWS-RESOURCE",
        "details": "any description or details"
    },
    "version": "v1.0.0"
}
```
- Update Items

> POST /any-index-name/_update/1

```json
{
    "id": "d1f91b2b-c974-4737-b696-582815190745",
    "createdAt": "2025-05-21T20:15:43.705088Z",
    "anyObjectInformation": {
        "name": "ENROLLMENT_EXAMPLE",
        "code": "10000",
        "type": "anyType",
        "subtype": "anySubTYpe"
    },
    "transactionalId": null,
    "sessionId": null,
    "traceId": "1a8419e6efcb4dd5a10204f931a99999",
    "serviceOrigin": "opensearch-api",
    "spanId": null,
    "anyExtraDetails": {
        "resource": "AWS-RESOURCE",
        "details": "any description or details"
    },
    "version": "v2.0.0"
}
```

- Delete Items

> DELETE /any-index-name/_doc/IJ3a-JYB34O2siCLcFk-

- Get Item

> GET /any-index-name/_doc/75cA-JYBjUXa3MJZ0q7H

- Get Items

> GET _search

```json
{
  "query": {
    "match_all": {}
  }
}
```

- Vega Example - Create complex graphics

```json

{
  "$schema": "https://vega.github.io/schema/vega-lite/v5.json",
  "description": "Description Here",
  "data": {
    "url": {
      "index": "any-index-name-*",
      "body": {
        "size": 0,
        "query": {
          "bool": {
            "filter": [
              {
                "terms": {
                  "{{{PUT-HERE-THE-KEY-NAME}}}.code.keyword": ["1000", "1001", "1002"]
                }
              }
            ]
          }
        },
        "aggs": {
          "por_trace": {
            "terms": {
              "field": "traceId.keyword",
              "size": 10000
            },
            "aggs": {
              "codigos_presentes": {
                "terms": {
                  "field": "{{{PUT-HERE-THE-KEY-NAME}}}.code.keyword"
                }
              },
              "quantos_1002": {
                "filter": {
                  "term": {
                    "{{{PUT-HERE-THE-KEY-NAME}}}.code.keyword": "1002"
                  }
                }
              },
              "filtrar_trace_com_ambos": {
                "bucket_selector": {
                  "buckets_path": {
                    "qtde_1002": "quantos_1002._count",
                    "qtde_codigos": "codigos_presentes._bucket_count"
                  },
                  "script": "params.qtde_1002 > 0 && params.qtde_codigos == 2"
                }
              }
            }
          }
        }
      }
    },
    "format": {
      "property": "aggregations.por_trace.buckets"
    }
  },
  "transform": [
    {
      "calculate": "datum.quantos_1002.doc_count + 'a'",
      "as": "qtd_1002"
    },
    {
      "aggregate": [{"op": "count", "as": "traceCount"}],
      "groupby": ["qtd_1002"]
    },
    {
      "window": [{"op": "sum", "field": "traceCount", "as": "totalTraces"}],
      "frame": [null, null]
    },
    {
      "calculate": "round(datum.traceCount / datum.totalTraces * 100)",
      "as": "percent"
    },
    {
      "calculate": "round(datum.percent) + '%'",
      "as": "percentLabel"
    }
  ],
  "layer": [
    {
      "mark": {
        "type": "bar",
        "tooltip": true,
        "color": "#d16186"
      },
      "encoding": {
        "x": {
          "field": "qtd_1002",
          "type": "ordinal",
          "title": "",
          "axis": {
            "labelAngle": 0,
            "labelAlign": "center",
            "labelBaseline": "middle",
            "labelFontSize": 16,
            "labelFontWeight": "normal",
            "titleFontSize": 20,
            "titleFontWeight": "bold",
            "labelPadding": 16,
            "domain":false,
            "ticks":false
          }
        },
        "y": {
          "field": "traceCount",
          "type": "quantitative",
          "title": "",
          "axis":{
            "domain":false,
            "ticks":false,
            "labels":false
          }
        },
        "tooltip": [
          {"field": "qtd_1002", "type": "ordinal", "title": "Title 1"},
          {"field": "traceCount", "type": "quantitative", "title": "Title 2"},
          {"field": "percent", "type": "quantitative", "title": "Title 3", "format": ".%"}
        ]
      }
    },
    {
      "mark": {
        "type": "text",
        "dy": -18,
        "fontWeight": "normal",
        "fontSize": 14,
        "color": "#ffffff",
        "stroke": null,
        "strokeWidth": 0
      },
      "encoding": {
        "x": {
          "field": "qtd_1002",
          "type": "ordinal"
        },
        "y": {
          "field": "traceCount",
          "type": "quantitative"
        },
        "text": {
          "field": "percentLabel",
          "type": "nominal",
          "title": "Porcentagem"
        }
      }
    }
  ],
  "config": {
    "axis": {
      "labelFont": "Arial",
      "titleFont": "Arial",
      "labelColor": "#fff",
      "titleColor": "#fff"
    },
    "legend": {
      "labelFontSize": 16,
      "titleFontSize": 18,
      "labelFontWeight": "bold",
      "titleFontWeight": "bold"
    },
    "title": {
      "fontSize": 24,
      "fontWeight": "bold",
      "anchor": "start",
      "color": "#fff"
    }
  }
}
```

