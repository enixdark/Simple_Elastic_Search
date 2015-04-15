
#!/bin/bash

PORT=9200
curl -XPUT http://localhost:${PORT}/my_temp_index -d '{
	"settings":{
		"number_of_shards":1,
		"number_of_replicas":0
	}
}'

curl -XPUT http://localhost:${PORT}/my_temp_index/_settings -d '{
	"number_of_replicas":1
}'