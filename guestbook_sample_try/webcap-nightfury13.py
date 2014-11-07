from google.appengine.api import users
from google.appengine.ext import ndb

import os
import urllib
import webapp2
import jinja2

JINJA_ENVIRONMENT = jinja2.Environment(
		loader=jinja2.FileSystemLoader(os.path.dirname(__file__)),
		extensions=['jinja2.ext.autoescape'],
		autoescape=True)

DefaultGuestbookName = 'default_guestbook'

class Greeting(ndb.Model):
	author = ndb.UserProperty()
	content = ndb.StringProperty(indexed=False)
	date = ndb.DateTimeProperty(auto_now_add=True)

class MainPage(webapp2.RequestHandler):

	def get(self):
		guestbook_name = self.request.get('guestbook_name',DefaultGuestbookName)
		greetings_query = Greeting.query(ancestor = guestbook_key(guestbook_name)).order(-Greeting.date)
		greetings = greetings_query.fetch(10)

		if users.get_current_user():
			url = users.create_logout_url(self.request.uri)
			url_linktext = 'Logout'

		else:
			url = users.create_login_url(self.request.uri)
			url_linktext = 'Login'

		template_values = {
			'greetings': greetings,
			'guestbook_name': urllib.quote_plus(guestbook_name),
			'url': url,
			'url_linktext': url_linktext,
		}

		template = JINJA_ENVIRONMENT.get_template('index.html')
		self.response.write(template.render(template_values))

def guestbook_key(guestbook_name=DefaultGuestbookName):
	return ndb.Key('Guestbook', guestbook_name)

class Guestbook(webapp2.RequestHandler):
	def post(self):
		guestbook_name = self.request.get('guestbook_name', DefaultGuestbookName)
		greeting = Greeting(parent=guestbook_key(guestbook_name))

		if users.get_current_user():
			greeting.author = users.get_current_user()

		greeting.content = self.request.get('content')
		greeting.put()

		query_params = {'guestbook_name': guestbook_name}
		self.redirect('/?' + urllib.urlencode(query_params))
		
application = webapp2.WSGIApplication([
		('/', MainPage),
		('/sign', Guestbook),
], debug=True)
