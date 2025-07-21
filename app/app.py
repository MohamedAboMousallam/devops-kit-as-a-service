from flask import Flask, jsonify
from prometheus_flask_exporter import PrometheusMetrics
app = Flask(__name__)
metrics = PrometheusMetrics(app)

@app.route("/")
def index():
    return jsonify({"message": "DevOps Kit API is running!"})

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
