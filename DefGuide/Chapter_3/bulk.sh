
PORT=9200

curl -XPOST http://localhost:${PORT}/_bulk/?pretty -d '
{ "delete": { "_index": "vietname", "_type": "peoples", "_id": "123" }}
{ "create": { "_index": "vietname", "_type": "peoples", "_id": "123" }}
{ "name": "Gamer","age":9999 }
{ "index": { "_index": "vietname", "_type": "peoples" }}
{ "name": "Blog" }
{ "update": { "_index": "vietname", "_type": "peoples", "_id": "123", "_retry_on_conflict" : 3} }
{ "doc" : {"name" : "Blog"} }
'