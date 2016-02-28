#!/bin/bash
PORT=9200

echo "simple full text search us analyzer"
GET http://localhost:${PORT}/_analyze?analyzer=standard -d 'Text to analyze'