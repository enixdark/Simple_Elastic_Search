PORT=9200


echo "visible information indices,types and documents by mapping"
curl -XGET http://localhost:${PORT}/gb/_mapping/tweet/?pretty

echo "change attr of index"
curl -XPUT http://localhost:${PORT}/gc -d '
{
	"mappings": {
		"tweet" : {
			"properties" : {
				"tweet" : {
					"type" :"string",
					"analyzer": "english"
				},
				"date" : {
					"type" : "date"
				},
				"name" : {
					"type" : "string"
				},
				"user_id" : {
					"type" : "long"
				}
			}
		}
	}
}
'

echo "visible"
curl -XGET http://localhost:${PORT}/gc/_mapping/tweet/?pretty

echo "analyzer gc"
curl -XGET http://localhost:${PORT}/gc/_analyze?field=tweet -d "Black-cats"
echo
curl -XGET http://localhost:${PORT}/gc/_analyze?field=tag -d "Black-cats"