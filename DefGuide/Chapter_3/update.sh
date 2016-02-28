#!/bin/bash

PORT=9200
ID=1

#update document from elastic
# echo "==========update document==========" 
# curl -XPUT http://localhost:${PORT}/vietname/peoples/${ID} -d '{
# 	"name":"cqshinn",
# 	"age":"23",
# 	"skill":["Python"]
# }
# '
# echo 
# echo "==========get document after update==========" 
# curl -XGET http://localhost:${PORT}/vietname/peoples/${ID}

echo
curl -XPOST http://localhost:${PORT}/vietname/peoples/${ID}/_update -d '
{
	"code" : {
		"tags" : [ "testing" ],
		"views": 0
	}
}'
echo
curl -XPOST http://localhost:${PORT}/vietname/peoples/${ID}/_update?retry_on_conflict=5 -d '
{
	"code" : {
		"tags" : [ "testing" ],
		"views": 1
	}
}
'