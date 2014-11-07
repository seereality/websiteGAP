from google.appengine.api import users
from google.appengine.ext import ndb
from google.appengine.ext import webapp
from google.appengine.ext.webapp.util import run_wsgi_app
#from google.appengine.ext import blobstore
#from google.appengine.ext.webapp import blobstore_handlers

import os
import urllib
import webapp2
import jinja2

providers = {
    'Google'   : 'https://www.google.com/accounts/o8/id',
    'Yahoo'    : 'yahoo.com',
    'MySpace'  : 'myspace.com',
    'AOL'      : 'aol.com',
    'MyOpenID' : 'myopenid.com'
    # add more here
}

JINJA_ENVIRONMENT = jinja2.Environment(
		loader=jinja2.FileSystemLoader(os.path.dirname(__file__)),
		extensions=['jinja2.ext.autoescape'],
		autoescape=True)

class MainPage(webapp2.RequestHandler):

	def get(self):

		greeting = ''
		url = ''
		url_linktext = ''
		record_url = ''
		record_url_linktext = ''
		provs = []

		if users.get_current_user():
			greeting = 'Hello '+users.get_current_user().nickname()+'!'
			url = users.create_logout_url(self.request.uri)
			url_linktext = 'Logout'
			record_url = self.request.host_url+'/record'
			record_url_linktext = 'New Recording'

		else:
			#self.redirect(users.create_login_url(self.request.uri))
			greeting = 'Sign-in at :'
			for name, uri in providers.items():
				provs.append([users.create_login_url(federated_identity=uri), name])		

		template_values = {
			'url': url,
			'url_linktext': url_linktext,
			'greeting': greeting,
			'record_url': record_url,
			'record_url_linktext': record_url_linktext,
			'providers': provs,
		}

		template = JINJA_ENVIRONMENT.get_template('views/index.html')
		self.response.write(template.render(template_values))

class RecordPage(webapp2.RequestHandler):

	def get(self):

		user = users.get_current_user()
		mainpage_url = self.request.host_url+'/'
		mainpage_url_linktext = 'Back to Home'
		url = ''
		url_linktext = ''
#		upload_url = blobstore.create_upload_url('/upload')

		if user:
			url = users.create_logout_url(self.request.uri)
			url_linktext = 'Logout'
		else:
			self.redirect('/')

		template_values = {
			'mainpage_url': mainpage_url,
			'mainpage_url_linktext': mainpage_url_linktext,
			'url': url,
			'url_linktext': url_linktext,
#			'upload_url': upload_url,
		}
		
		template = JINJA_ENVIRONMENT.get_template('views/record.html')
		self.response.write(template.render(template_values))

#class UploadHandler(blobstore_handlers.BlobstoreUploadHandler):
#	def post(self):
#		upload_files = self.get_uploads('file')
#		blob_info = upload_files[0]
#		self.redirect('/serve/%s' % blob_info.key())

#class ServeHandler(blobstore_handlers.BlobstoreDownloadHandler):
#	def get(self, resource):
#		resource = str(urllib.unquote(resource))
#		blob_info = blobstore.BlobInfo.get(resource)
#		self.send_blob(blob_info)

application = webapp2.WSGIApplication([
		('/', MainPage),
		('/record',RecordPage),
#		('/upload',UploadHandler),
#		('/serve',ServeHandler),
], debug=True)
