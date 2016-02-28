#!/bin/bash
PORT=9200
echo "use scan for search"
curl -XGET http://localhost:${PORT}/old_index/_search?search_type=scan&scroll=1m -d '{
	"query":{"match_all":{}},
	"size":1000
}'



