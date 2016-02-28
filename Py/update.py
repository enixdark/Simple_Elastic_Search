from es import ES
from config import *


es = ES().getES()

if es.indices.exists(index = index_name):
	script = {
		'script': 'ctx._source.category=\"Programming\"'
	}
	es.update(index = index_name, doc_type = doc_type, body = script, id = '123', ignore = 404)
	# script	= {"script"	:"ctx._source.category+=tag",
	# 	"params":{
	# 	"tag": "Python"
	# }
	# es.update(index = index_name, doc_type = doc_type, body = script, id = '1', ignore=404)