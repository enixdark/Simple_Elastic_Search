#The term filter is used to filter by exact values, be they numbers, dates, Booleans, or
#not_analyzed exact-value string fields:
PORT=9200
curl -XGET http://localhost:${PORT}/gb,us/_search/?pretty -d '{
	"filter":{ 
	"term": { 
	"name": "john"
}
}
}'

#The terms filter is the same as the term filter, but allows you to specify multiple values
#to match. If the field contains any of the specified values, the document matches:
curl -XGET http://localhost:${PORT}/gb,us/_search/?pretty -d '{
	"filter":{
		"terms": 
		{ "tag": [ "search", "full_text", "nosql" ] }}
	}
}'

#The range filter allows you to find numbers or dates that fall into a specified range:
#
curl -XGET http://localhost:${PORT}/_search?pretty -d '{
	"filter":{
		"range":{
			"age":{
				"gte":20,
				"lt":20
			}
		}
	}
}'

#exists field
curl -XGET http://localhost:${PORT}/_search?pretty -d '{
	"filter":{
		"exists":{
			"field":"name"
		}
	}
}'

echo "user bool with filter"
curl -XGET http://localhost:${PORT}/_search/?pretty -d '{
	"filter":{
		"bool": {
			"must":{"term":{"folder":"inbex"}},
			"must_not":{"term":{"tag":"spam"}},
			"should":[
				{"term":{"start":true}},
				{"term":{"unread":true}}
			]
		}
	}
}
'