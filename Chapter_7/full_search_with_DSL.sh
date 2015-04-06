#!/bin/bash
PORT=9200

echo "simple search"
GET http://localhost:${PORT}/_search -d '{}'

echo "simple search with indices and types"
curl -XGET http://localhost:${PORT}/gb,us/_search -d '{
	"from":2,
	"size":3
}'

echo "simple search with DSL"
curl -XGET http://localhost:${PORT}/_search -d '{
	"query": {
		"match_all": {}
	}
}'

echo "simple search tweet have elasticsearch string with DSL "
curl -XGET http://localhost:${PORT}/_search?pretty -d '{
	"query": {
		"match":{
			"tweet": "elasticsearch"
		}
	}
}'

echo "compound search"
curl -XGET http://localhost:${PORT}/_search/?pretty -d '{
	"query":{
		"bool": {
			"must":{ "match": { "tweet": "elasticsearch" }},
			"must_not": { "match": { "name": "mary" }},
			"should":{ "match": { "tweet": "full text" }}
		}
	}
}
'

echo "compound search with compound"
curl -XGET http://localhost:${PORT}/_search/?pretty -d '{
	"query":{
		"bool":{
			"must":{
				"match":{
					"email":"bussiness"
				}
			},
			"should":[
			{
				{
					"match":{
						"started":true
					}
				},
				{ 
				"bool": {
					"must":
					"must_not":
				}
			}
			],
			"minimum_should_match":1
		}
	}
}'
