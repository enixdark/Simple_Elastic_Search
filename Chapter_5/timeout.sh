#!/bin/bash

PORT=9200


echo "get data with timeout"
curl -XGET http://localhost:${PORT}/_search?timeout=10ms
