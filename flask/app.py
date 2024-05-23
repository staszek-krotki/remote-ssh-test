# app.py
import time
import json
import os

from flask import Flask, Response, request, send_from_directory, stream_with_context
from flask_accept import accept
import base64

app = Flask(__name__)

def read_image():
    with open("img.png", "rb") as image_file:
        encoded_string = base64.b64encode(image_file.read())
    return encoded_string


@app.post("/img")
def get_image():
    return send_from_directory('.', 'img.png')


@app.get("/stream")
def stream_image():
    def img_stream():
        
        start = 0
        # for end in range(0, len(response), 1*1024):
        while True:
            yield read_image()
            

    return Response(stream_with_context(img_stream()), mimetype="application/octet-stream")

@app.get("/r")
def get_r():
    return "my nice response", 200


@app.route('/favicon.ico')
def favicon():
    return send_from_directory(os.path.join(app.root_path, 'static'),
                               'favicon.ico', mimetype='image/vnd.microsoft.icon')
