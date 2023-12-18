from flask import Flask, request
from flask_cors.decorator import cross_origin
from source import *


app = Flask("APP1")


@app.route("/app1/api/welcome", methods=["GET"])
@cross_origin()
def welcome():
    return response_generator(200, "Everything fine !", "response", "Welcome to APP1 and MYSQL 5.7", "request")


@app.route("/app1/api/article", methods=["POST"])
@cross_origin()
def article():
    params = request.get_json()
    return response_generator(200, "Everything fine !", "response", "Create new article APP1", "request", params)


@app.route("/app1")
@cross_origin()
def access_denied():
    return response_generator(403, "Access Denied !", "", "", "", "")

