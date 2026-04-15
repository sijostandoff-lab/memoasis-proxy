#!/bin/bash

# Запускаем MTProto прокси на порту 4443 в фоновом режиме
cd /mtproxy && python3 mtprotoproxy.py &

# Запускаем веб-сервер для страницы memoasis на порту от Railway
cd / && python3 -m http.server ${PORT:-8080}
