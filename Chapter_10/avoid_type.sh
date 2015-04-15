#!/bin/bash

PORT=9200
echo "full text search without exact type"
curl -XGET http://localhost:${PORT}/_search/?pretty -d '{
	"query":{
		"match":{
			"title":"the quick brown fox"
		}
	}
}'

echo "full text search with invi type"
curl -XGET http://localhost:${PORT}/_search/?pretty -d '{
	"query":{
		"multi_match":{
			"query":"the quick brown fox",
			"fields":["blog_en.title","blog_es.title"]
		}
	}
}'