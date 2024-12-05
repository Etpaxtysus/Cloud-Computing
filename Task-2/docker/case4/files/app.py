from flask import Flask, render_template
import os

app = Flask(__name__)

# Fungsi untuk membaca file log
def read_log_file():
    log_file = '/logs/activity.log'  # Path log di dalam container
    if os.path.exists(log_file):
        with open(log_file, 'r') as file:
            return file.read()
    return "No logs found."

@app.route('/')
def index():
    log_content = read_log_file()  # Membaca isi log
    return render_template('index.html', log_content=log_content)  # Kirim ke template HTML

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)
