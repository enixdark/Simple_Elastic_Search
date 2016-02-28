#!/bin/bash
PORT=9200

echo "simple validate query"
curl -XGET http://localhost:${PORT}/gb/tweet/_validate/query/?explain -d '{
"query": {
		"tweet" : {
			"match" : "really powerful"
		}
	}
}'