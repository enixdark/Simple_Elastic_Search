#!/bin/bash
PORT=9200

echo "simple compound query and filter by filterd"
curl -XGET http://localhost:${PORT}/_search/?pretty -d '{
	"query":{
		"filtered":{
			"query":{
				"match":{"name":"john"}
			},
			"filter":{
				"term":{"name":"Mary"}
			}
		}
	}
}'