from flask import Flask, request, session, redirect, render_template
from myconnection import MySQLConnector
app = Flask(__name__)
app.secret_key = "asdkfhalwkehruaishdnbljk"
mysql = MySQLConnector(app, "airbnbdb6")

@app.route("/")
def index():
	x = mysql.query_db("SELECT * FROM users")
	print x
	for user in x:
		print user["id"]
		print user["email"]
		print user["password"]
	return render_template("users.html", users=x)

#1 create route to view form
#2 have form have all necessary user data
#3 have route to handle data asubmission, insert user into db
app.run(debug=True)