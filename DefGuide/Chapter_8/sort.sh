#!/bin/bash
PORT=9200
echo "get infomation and sort"
curl -XGET http://localhost:${PORT}/_search/?pretty -d '{
	"query":{
		"filtered":{
			"filter":{
				"term":{
					"user_id":1
				}
			}
		}
	},
	"sort":{
		"date":{
			"order":"desc"
		}
	}
}'

echo "simple multi level sort"
curl -XGET http://localhost:${PORT}/_search/?pretty -d '{
	"query":{
		"filtered":{
			"query":{"match":{"tweet":"manage text search"}},
			"filter":{"term":{"user_id":1}}
		}
	},
	"sort":[
	{"date":{"order":"asc","mode":"min"}},
	{"_score":{"order":"desc"}}
	]
}'

echo "explain with yaml"

curl -XGET http://localhost:${PORT}/us/tweet/12/_explain?format=yaml -d '
{
	"query" : {
		"filtered" : {
			"filter" : { "term" : { "user_id" : 2
		}},
		"query" : { "match" : { "tweet" :
		"honeymoon" }}
	}
}
}'