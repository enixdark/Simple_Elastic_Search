from es import ES
from config import *
from time import time

es = ES().getES()

if not es.indices.exists(index = index_name):
	print '	index does not exists, creat new index'
	es.indices.create(index = index_name, body = body)
	time.sleep(2)
	print 'index created successfully'
else:
	print 'An index with this name already exists'

doc1 = {
	'name': 'Erlang',
	'category': ['Distribute','OTP','Erlang','Elixir','Elm','Actor'],
	'Publication': 'Ericsson',
	'Publishing Date': '1970-01-01'
}
es.index(index = index_name, doc_type = doc_type, body = doc1, id = '123')

response = es.get(index= index_name, doc_type = doc_type, id = '123', ignore= 404)
print response