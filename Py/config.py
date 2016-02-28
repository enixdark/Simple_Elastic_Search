#twitter

consumer_key = "S0OfgfzrMvXgTellIcpeI6Jsf"
consumer_secret = "6uxSl1Cw4gpxFKbsFcJUO9XSNZ5K3ostqbOfDPHPED5ihLNL0m"
access_token = "1679287802-uyd6plg2p0as1bld70CFq4Dards4JS7U1Xx73vB"
access_token_secret = "Rv1xHzwcs0ZUtuZxVTxaEEIGKnHvazWZWklMM7Z1UoQWl"

#settings of elasticsearch
index_setting = {
	"number_of_shards": 1,
	"number_of_replicas": 1,
	"index": {
		"analysis": {
			"analyzer": {
				"keyword_analyzer": {
					"type":"custom",
					"filter": [ "lowercase", "asciifolding"],
					"tokenizer": "keyword"
				}
			}
		}
	}
}


doc_mapping = {
	"_all": {
		"enabled": False
	},
	"properties": {
		"skill": {
			"type": "string",
			"index": "analyzed",
			"analyzer": "standart"
		}
	}
}

index_name = "books"
doc_type = "search"
body = {}
mapping = {}
mapping[doc_type] = doc_mapping
body['settings'] = index_setting
body['mappings'] = 	mapping