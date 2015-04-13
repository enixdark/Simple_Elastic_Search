#!/bin/bash

PORT=9200
ID=1

echo "==========get version document=========="
curl -XGET http://localhost:${PORT}/vietname/peoples/${ID}?pretty

echo "==========update version document=========="
curl -XPUT http://localhost:${PORT}/vietname/peoples/${ID}?version=1 -d '{
	"title": "super child"
}'

echo "==========get version document after update=========="
curl -XGET http://localhost:${PORT}/vietname/peoples/${ID}?pretty