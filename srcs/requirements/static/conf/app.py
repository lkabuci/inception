import os
import socket
import platform

import psutil
from flask import Flask, render_template

template_dir = os.path.abspath(os.path.dirname(__file__))

app = Flask(__name__, template_folder=template_dir)

@app.route("/")
def index():
    try:
        host_name = socket.gethostname()
        host_ip = socket.gethostbyname(host_name)
        os_info = platform.platform()
        cpu_info = psutil.cpu_percent()
        mem_info = psutil.virtual_memory().percent
        disk_info = psutil.disk_usage('/').percent

        return render_template('index.html', hostname=host_name, ip=host_ip,
                               os=os_info, cpu=cpu_info, memory=mem_info, disk_space=disk_info)
    except Exception as e:
        return render_template('error.html')


if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)
