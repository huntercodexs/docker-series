from flask import Flask, request
from flask_cors.decorator import cross_origin
from source import *


app = Flask("PySimple")


@app.route("/api/welcome", methods=["GET"])
@cross_origin()
def welcome():
    return response_generator(200, "Everything fine !", "response", "Welcome to pysimple", "request")


@app.route("/api/article", methods=["POST"])
@cross_origin()
def article():
    params = request.get_json()
    return response_generator(200, "Everything fine !", "response", "Create new article", "request", params)


@app.route("/")
@cross_origin()
def access_denied():
    return response_generator(403, "Access Denied !", "", "", "", "")

