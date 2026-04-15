#!/bin/bash

# Запускаем сайт на порту 8080 (который мы прописали в переменных)
python3 -m http.server 8080 &

# Ждем 3 секунды для надежности
sleep 3

# Запускаем прокси на порту 7777
cd /mtproxy && python3 mtprotoproxy.py
