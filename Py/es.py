from elasticsearch import Elasticsearch
from config import index_setting, doc_mapping




class ES(object):
	class __impl:
		def __init__(self,host,port):
			self.es = Elasticsearch("%s:%d"%(host,port))
		def getES(self):
			return self.es
	__instance = None
	__host = "localhost"
	__port = 9200
	def __init__(self, host = __host, port = __port):
		if ES.__instance is None:
			ES.__host = host
			ES.__port = port
			ES.__instance = ES.__impl(host,port)
		self.__dict__['_Singleton__instance'] = ES.__instance

	def __getattr__(self, attr):
		return getattr(self.__instance, attr)

	def __setattr__(self, attr, value):
		return setattr(self.__instance, attr, value)
