#!/bin/bash

PORT=9200
ID=1
#get all data from elastic

echo "==========All data=========="
curl -XGET http://localhost:${PORT}/vietname/peoples/_search?pretty
echo 
#get a people data based on their id 
echo "==========get people data by id = ${ID}=========="
curl -XGET http://localhost:${PORT}/vietname/peoples/${ID}?pretty
