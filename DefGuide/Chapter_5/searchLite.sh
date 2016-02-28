#!/bin/bash

PORT=9200
echo "seach all tweet have elasticsearch string"
curl -XGET http://localhost:${PORT}/_all/tweet/_search?q=tweet:elasticsearch

echo "seach all tweet have elasticsearch string and name have john string"
curl -XGET http://localhost:${PORT}/_all/tweet/_search?q=tweet:elasticsearch+name:john

echo "seach all tweet have elasticsearch string and name have john string with encode"
curl -XGET http://localhost:${PORT}/_all/tweet/_search?q=t%2Bweet%3Belasticsearch%2Bname%3Bjohn

echo "seach all user name by Mary"
curl -XGET http://localhost:${PORT}/_search?q=Mary

echo "complicated query"

echo "search user whose name start by mary,john and date greater than 2014-9-10"

# curl -XGET http://localhost:${PORT}/_all/tweet/_search?q=+name:(mary john)+date:>2014-09-10+(aggregations geo)
curl -XGET http://localhost:${PORT}/_all/tweet/_search?q=?q=%2Bname%3A(mary+john)+%2Bdate%3A%3E2014-09-10+%2B(aggregations+geo)