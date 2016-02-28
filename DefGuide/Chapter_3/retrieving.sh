#!/bin/bash

PORT=9200


echo "get data by extract column"
curl -XGET http://localhost:${PORT}/vietname/peoples/1?_source=name&pretty

echo 
echo "get data by _source"
curl -XGET http://localhost:${PORT}/vietname/peoples/1/_source?pretty