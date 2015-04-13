#!/bin/bash

PORT=9200
ID=1
echo "==========get multi documents=========="
curl -XGET http://localhost:${PORT}/_mget/?pretty -d '{
	"docs" : [
	{
		"_index" : "vietname",
		"_type" : "peoples",
		"_id" : 111
	},
	{
		"_index" : "website",
		"_type" : "blog",
		"_id" : 1,
		"_source": "views"
	}
	]
}'

echo "get multi document at the same type"
curl -XGET http://localhost:${PORT}/vietname/_mget/?pretty -d '{
	"docs" : [{
		"_id":1
	},
	{
		"_id":2,
		"type":"pet"
	}
	]
}'

echo "get multi document by list ids"
curl -XGET http://localhost:${PORT}/vietname/peoples/_mget/?pretty -d '{
	ids:[111,2,3]
}'
