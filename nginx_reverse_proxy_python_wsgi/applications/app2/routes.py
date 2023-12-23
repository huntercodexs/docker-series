from flask import Flask, request
from flask_cors.decorator import cross_origin
from source import *


app = Flask(__name__)


@app.route("/app2/api/welcome", methods=["GET"])
@cross_origin()
def welcome():
    return response_generator(200, "Everything fine !", "response", "Welcome to APP2", "request")


@app.route("/ap2/api/article", methods=["POST"])
@cross_origin()
def article():
    params = request.get_json()
    return response_generator(200, "Everything fine !", "response", "Create new article APP2", "request", params)


@app.route("/app2")
@cross_origin()
def access_denied():
    return response_generator(403, "Access Denied !", "", "", "", "")

