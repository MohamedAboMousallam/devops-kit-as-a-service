from flask import Flask, jsonify
from prometheus_flask_exporter import PrometheusMetrics
import os
app = Flask(__name__)
metrics = PrometheusMetrics(app)
pod_name = os.environ.get('HOSTNAME', 'unknown-pod')

@app.route("/")
def index():
    return jsonify({"message": "DevOps Kit API is running! this is a hello message from Pod:", "pod_name": pod_name})

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
