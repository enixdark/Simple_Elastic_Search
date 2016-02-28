from config import *
from es import ES
import pprint 

prt = pprint.PrettyPrinter(indent=1)

es = ES().getES()
query = {
	"query":{
		"match_all":{}
	}
}

response = es.search(index = index_name, doc_type = doc_type, 
	body = query, size = 10, request_timeout = 10)

prt.pprint(response)

