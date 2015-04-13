#!/bin/bash

PORT=9200

#insert data into elastic
echo "==========insert data==========" 
curl -XPUT http://localhost:${PORT}/vietname/peoples/1 -d '{
	"name":"cqshinn",
	"age":"23"
}
'
echo 
echo "==========insert data==========" 
curl -XPUT http://localhost:${PORT}/vietname/peoples/2 -d '{
	"name":"sss",
	"age":"10"
}
'
echo "insert data without ID"
curl -XPOST http://localhost:${PORT}/vietname/peoples/ -d '{
	"name":"admin",
	"age":"100"
}
'