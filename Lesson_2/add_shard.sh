#!/bin/bash
PORT=9200

echo "add shard for type"
curl -XPUT http://localhost:${PORT}/vietname -d '{
	"settings" : {
		"number_of_shards" : 3,
		"number_of_replicas" : 1
	}
}'