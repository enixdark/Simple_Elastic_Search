#!/bin/bash

PORT=9200
ID=1
#get all data from elastic

echo "==========check if document exists=========="
curl -i -XHEAD http://localhost:${PORT}/vietname/peoples/${ID}

echo echo "==========check if document not exists=========="
curl -i -XHEAD http://localhost:${PORT}/vietname/peoples/9999
