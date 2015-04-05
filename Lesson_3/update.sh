#!/bin/bash

PORT=9200

#update document from elastic
echo "==========update document==========" 
curl -XPUT http://localhost:${PORT}/vietname/peoples/1 -d '{
	"name":"cqshinn",
	"age":"23",
	"skill":["Python"]
}
'
echo 
echo "==========get document after update==========" 
curl -XGET http://localhost:${PORT}/vietname/peoples/1 