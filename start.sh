#!/bin/bash
# Запускаем сайт на порту от Railway (переменная $PORT)
python3 -m http.server ${PORT:-8080} &

# Ждем пару секунд
sleep 2

# Запускаем прокси на порту 9000
cd /mtproxy && python3 mtprotoproxy.py
