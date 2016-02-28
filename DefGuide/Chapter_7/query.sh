#!/bin/bash
PORT=9200

echo "simple math_all query"
curl -XGET http://localhost:${PORT}/gb,us/_search -d '{
	"query":{
		"match_all":{}
	}
}'

echo "simple match query"
curl -XGET http://localhost:${PORT}/_search -d '{
	"query": {
		"match":{
			"tweet": "been to"
		}
	}
}'

echo "simple multi match query"
curl -XGET http://localhost:${PORT}/_search?pretty -d '{
	"query": {
		"multi_match": {
			"query":"full text search",
			"fields":[ "name", "body" ]
		}
	}
}'

echo "user bool match query"

curl -XGET http://localhost:${PORT}/_search?pretty -d '{
	"query":{
		"bool": {
			"must": { "match": { "title":"hello"}},
			"must_not": { "match": { "tag":"how to make millions" }},
			"should": [
			{ "match": { "tag": {"starred":"spam" }}},
			{ "range": { "date": { "gte":"2014-01-01" }}}
			]
		}
	}
}'