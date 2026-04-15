import os
import subprocess
from http.server import SimpleHTTPRequestHandler, HTTPServer

# Запускаем Xray в фоновом режиме
subprocess.Popen(["/usr/bin/xray", "-c", "/etc/xray/config.json"])

# Запускаем веб-сервер для Railway
port = int(os.environ.get("PORT", 8080))
server_address = ('', port)
httpd = HTTPServer(server_address, SimpleHTTPRequestHandler)
print(f"Server running on port {port}")
httpd.serve_forever()
