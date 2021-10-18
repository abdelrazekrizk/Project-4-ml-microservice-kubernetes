from flask import Flask
from flask import request, jsonify
from flask.logging import create_logger
import logging

import pandas as pd
from sklearn.externals import joblib
from sklearn.preprocessing import StandardScaler

import socket
import sys

# Create a TCP/IP socket
#sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# Bind the socket to the port
#server_address = ('localhost', 80)
# print >>sys.stderr, 'starting up on %s port %s' % server_address
#sock.bind(server_address)

app = Flask(__name__)
LOG = create_logger(app)
LOG.setLevel(logging.INFO)

#os.path.append('/home/ubuntu/miniconda3/envs/.devops/lib/python3.6/site-packages')
path = ('/home/ubuntu/miniconda3/envs/.devops/lib/python3.6/site-packages/')
def scale(payload):
    """Scales Payload"""

    LOG.info(f"Scaling Payload: \n{payload}")
    scaler = StandardScaler().fit(payload.astype(float))
    scaled_adhoc_predict = scaler.transform(payload.astype(float))
    return scaled_adhoc_predict


@app.route("/")
def home():
    html = f"<h3>Sklearn Prediction Home</h3>"
    return html.format(format)


@app.route("/predict", methods=['POST'])
def predict():
    """Performs an sklearn prediction
        
        input looks like:
        {
        "CHAS":{
        "0":0
        },
        "RM":{
        "0":6.575
        },
        "TAX":{
        "0":296.0
        },
        "PTRATIO":{
        "0":15.3
        },
        "B":{
        "0":396.9
        },
        "LSTAT":{
        "0":4.98
        }
        
        result looks like:
        { "prediction": [ <val> ] }
        
        """
    # Logging the input payload
    json_payload = request.json
    LOG.info(f"JSON payload: \n{json_payload}")
    inference_payload = pd.DataFrame(json_payload)
    LOG.info(f"Inference payload DataFrame: \n{inference_payload}")
    # scale the input
    scaled_payload = scale(inference_payload)
    # get an output prediction from the pretrained model, clf
    prediction = list(clf.predict(scaled_payload))
    # TO DO:  Log the output prediction value
    LOG.info(f"Prediction: {prediction}")
    return jsonify({'prediction': prediction})

if __name__ == "__main__":
    # load pretrained model as clf
    clf = joblib.load("./model_data/boston_housing_prediction.joblib")
    

# if set, let env vars override previous values
if 'FLASK_ENV' in os.environ:
    self.env = get_env()
    self.debug = get_debug_flag()
elif 'FLASK_DEBUG' in os.environ:
    self.debug = get_debug_flag()

# debug passed to method overrides all other sources
if debug is not None:
   self.debug = bool(debug)

_host = '127.0.0.1'
_port = 80
server_name = self.config.get('SERVER_NAME')
sn_host, sn_port = None, None

if server_name:
   sn_host, _, sn_port = server_name.partition(':')

host = host or sn_host or _host
port = int(port or sn_port or _port)

options.setdefault('use_reloader', self.debug)
options.setdefault('use_debugger', self.debug)
options.setdefault('threaded', True)

cli.show_server_banner(self.env, self.debug, self.name, False)

from werkzeug.serving import run_simple

try:
    run_simple(host, port, self, **options)
finally:
# reset the first request information if the development server
# reset normally.  This makes it possible to restart the server
# without reloader and that stuff from an interactive shell.
        self._got_first_request = False


