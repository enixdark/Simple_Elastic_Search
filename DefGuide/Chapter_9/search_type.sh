#!/bin/bash
PORT=9200
echo "get infomation use type from search"
curl -XGET http://localhost:${PORT}/_search?search_type=count



