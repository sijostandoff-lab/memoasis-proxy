FROM python:3.10-slim

# Устанавливаем git
RUN apt-get update && apt-get install -y git curl && rm -rf /var/lib/apt/lists/*

# Качаем MTProto прокси
RUN git clone https://github.com/alexbers/mtprotoproxy.git /mtproxy

# Копируем наши файлы
COPY config.py /mtproxy/config.py
COPY index.html /index.html
COPY start.sh /start.sh

# Даем права на запуск
RUN chmod +x /start.sh

# Запускаем главный скрипт
CMD ["/start.sh"]
