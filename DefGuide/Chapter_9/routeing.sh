#!/bin/bash
PORT=9200
echo "get infomation use routing"
curl -XGET http://localhost:${PORT}/_search?routing=user_1,user_2
