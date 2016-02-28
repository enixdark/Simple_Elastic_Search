#!/bin/bash

PORT=9200

echo "setup filter for indices"
# curl -XPUT http://localhost:${PORT}/my_index?pretty -d '{
# 	"settings":{
# 		"analysis":{
# 			"char_filter":{
# 				"&_to_and":{
# 					"type":"mapping",
# 					"mappings":["&=> and "]
# 				}
# 			},
# 			"filter":{
# 				"my_stopwords":{
# 					"type":"stop",
# 					"stopwords":["the","a"]
# 				}
# 			},
# 			"analyer":{
# 				"my_analyzer":{
# 					"type":"custom",
# 					"char_filter":["html_strip","&_to_and"],
# 					"tokenizer":"standard",
# 					"filter":["lowercase","my_stopwords"]
# 				}
# 			}
# 		}
# 	}
# }'

curl -XPUT http://localhost:$PORT/my_index/_mapping/my_type -d '{
	"properties":{
		"title":{
			"type":"string",
			"analyzer":"my_analyzer"
		}
	}
}'

echp "search with analyzer"
curl -XGET http://localhost:${PORT}/my_index/_analyze?analyzer=my_analyzer -d 'The quick & brown fox'