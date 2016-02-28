#!/bin/bash

PORT=9200
ID=111

echo "==========delete document=========="
curl -XDELETE http://localhost:${PORT}/vietname/peoples/${ID}
echo 
echo "==========get people data by id = ${ID}=========="
curl -XGET http://localhost:${PORT}/vietname/peoples/${ID}?pretty
