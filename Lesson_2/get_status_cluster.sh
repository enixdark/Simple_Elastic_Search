#!/bin/bash

PORT=9200


echo "get status of cluster"
curl -XGET http://localhost:${PORT}/_cluster/health/?pretty