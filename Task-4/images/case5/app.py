from flask import Flask, request, jsonify, render_template
import logging
from datetime import datetime, timezone, timedelta

app = Flask(__name__)

# Setup logging
LOG_FILE = "app.log"
logging.basicConfig(
    filename=LOG_FILE,
    level=logging.INFO,
    format="%(asctime)s - %(message)s",
    datefmt="%Y-%m-%d %H:%M:%S",
)

# Set timezone GMT+7 (WIB)
WIB = timezone(timedelta(hours=7))


def get_current_time():
    """Return current time in GMT+7."""
    return datetime.now(WIB).strftime("%Y-%m-%d %H:%M:%S")


@app.route("/")
def home():
    ip = request.remote_addr
    current_time = get_current_time()
    logging.info(f"Home page accessed from IP: {ip} at {current_time}")
    return render_template("index.html")


@app.route("/logs", methods=["GET"])
def get_logs():
    try:
        with open(LOG_FILE, "r") as log_file:
            logs = log_file.readlines()
        return jsonify({"logs": logs})
    except FileNotFoundError:
        return jsonify({"error": "Log file not found!"}), 404


@app.route("/write-log", methods=["POST"])
def write_log():
    data = request.json
    if "message" in data:
        current_time = get_current_time()
        logging.info(f"Custom Log at {current_time}: {data['message']}")
        return jsonify({"status": "success", "message": "Log written!"})
    return jsonify({"status": "error", "message": "No message provided!"}), 400


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
