#!/bin/bash

PORT=9200


echo "get data with gb indeces extract"
curl -XGET http://localhost:${PORT}/gb/_search/?pretty

echo "get data with us indeces extract"
curl -XGET http://localhost:${PORT}/us/_search/?pretty


echo "get data with us and gb indeces extract"
curl -XGET http://localhost:${PORT}/us,gb/_search/?pretty

echo "get data with indeces start by g or u"
curl -XGET http://localhost:${PORT}/[ug]*/_search/?pretty