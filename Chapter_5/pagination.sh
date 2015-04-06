#!/bin/bash

PORT=9200


echo "get data with size"
curl -XGET http://localhost:${PORT}/_search?size=5

echo "get data from .. to ( from start position to position+size"
curl -XGET http://localhost:${PORT}/_search?size=2&from=4
