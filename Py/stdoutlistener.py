from config import *
from es import ES
from tweepy import OAuthHandler, Stream
from tweepy.streaming import StreamListener
import json

# es = ES().getES()

class StdOutListener(StreamListener):
	counter = 0
	total_docs_to_be_indexed = 1000

	def __init__(self,*args,**kwargs):
		super(StdOutListener, self).__init__(*args, **kwargs)
		self.es = ES().getES()

	def on_data(self,data):
		print data
		while self.total_docs_to_be_indexed > self.counter:
			tweet = json.loads(data)
			self.index_tweet(tweet)
			self.counter += 1
			return True
		return False

	def index_tweet(self,tweet):
		self.es.index(index = 'twitter', doc_type = 'tweets', id = tweet['id_str'], body = tweet)

	def on_error(self,status):
		print "the status is: " + str(status)
		pass

if	__name__ ==	'__main__':
	listener = StdOutListener()
	auth = OAuthHandler(consumer_key, consumer_secret)

	stream = Stream(auth, listener)
	stream.filter(track=['crime','blast','earthquake','riot','politics'])