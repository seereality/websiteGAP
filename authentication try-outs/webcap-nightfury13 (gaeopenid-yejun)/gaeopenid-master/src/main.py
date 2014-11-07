# -*- coding: utf-8 -*-
'''
Created on Oct 17, 2010

@author: yejun
'''

from google.appengine.api import users
from google.appengine.ext.webapp.util import run_bare_wsgi_app
from flask import Flask, render_template


app = Flask(__name__.split('.')[0])
app.debug = True
app.secret_key = '|p\xd2\x1a\x9d_\x01\xe9\xdd!\xd9A\xea\xf9\xc0hA^\xd0v{Y\xd57'

@app.route('/')
def list():
    return render_template("index.html", users = users)

wsgi_app = app.wsgi_app
    
def main():
    run_bare_wsgi_app(wsgi_app)


if __name__ == "__main__":
    main()
