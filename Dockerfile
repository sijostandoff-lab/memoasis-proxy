FROM python:3.10-slim

# Устанавливаем системные зависимости
RUN apt-get update && apt-get install -y git curl && rm -rf /var/lib/apt/lists/*

# Клонируем репозиторий прокси
RUN git clone https://github.com/alexbers/mtprotoproxy.git /mtproxy

# Копируем конфиг, страницу и скрипт запуска
# Убедись, что эти файлы лежат в корне твоего репозитория на GitHub!
COPY config.py /mtproxy/config.py
COPY index.html /index.html
COPY start.sh /start.sh

RUN chmod +x /start.sh

# Railway использует порт из переменной PORT
EXPOSE 8080

CMD ["/start.sh"]