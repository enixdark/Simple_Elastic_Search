#!/bin/bash

PORT=9200
ID=111

echo "first method to create a new document"
curl -XPOST http://localhost:${PORT}/vietname/peoples/${ID}?op_type=create -d '{
	"name":"superman",
	"age":"?"
}
'
echo

echo "second method to create a new document"
curl -XPOST http://localhost:${PORT}/vietname/peoples/${ID}/_create -d '{
	"name":"batman",
	"age":"60"
}
'

echo "conflict document when to try create a new document that exists"
curl -XPOST http://localhost:${PORT}/vietname/peoples/${ID}/_create/?pretty -d '{
	"name":"batman",
	"age":"60"
}
'