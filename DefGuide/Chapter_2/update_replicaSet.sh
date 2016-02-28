#!/bin/bash
PORT=9200

echo "visible replicas information"
curl -XGET http://localhost:${PORT}/vietname/_settings/?pretty 

echo

echo "update inc or desc replicas"
curl -XPUT http://localhost:${PORT}/vietname/_settings -d '{
	"number_of_replicas" : 2
}'

echo 
echo "visible replicas information after update"
curl -XGET http://localhost:${PORT}/vietname/_settings/?pretty 