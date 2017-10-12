from flask import Flask, request

app = Flask(__name__)

@app.route("/")
def welcome():
    return "Welcome to the BrewsClues api"


@app.route("/brewery", methods=["POST"])
def brewery():
    return "brewery added"
