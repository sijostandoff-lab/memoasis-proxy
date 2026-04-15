# Этап 1: Берем официальный образ Xray, чтобы вытащить оттуда бинарник
FROM teddysun/xray:latest AS xray-core

# Этап 2: Собираем наш рабочий образ
FROM alpine:latest

# Устанавливаем ТОЛЬКО python3 (xray больше не ищем в apk)
RUN apk add --no-cache python3

# Копируем готовый бинарник xray из первого этапа
COPY --from=xray-core /usr/bin/xray /usr/bin/xray

# Создаем папку для конфига на всякий случай
RUN mkdir -p /etc/xray

# Копируем конфиги и файлы из репозитория
COPY config.json /etc/xray/config.json
COPY index.html /index.html
COPY main.py /main.py

# Открываем порт
EXPOSE 8080

# Запускаем наш скрипт
CMD ["python3", "/main.py"]
