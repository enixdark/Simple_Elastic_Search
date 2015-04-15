
#!/bin/bash

PORT=9200
# curl -XPUT http://localhost:${PORT}/spanish_docs/?pretty -d '{
# 	"settings":{
# 		"analysis":{
# 			"analyzer":{
# 				"es_std":{
# 					"type":"standard",
# 					"stopwords":"_spanish_"
# 				}
# 			}
# 		}
# 	}
# }'


curl -XGET http://localhost:${PORT}/spanish_docs/_analyze?analyzer=es_std -d "El veloz zorro marron"
