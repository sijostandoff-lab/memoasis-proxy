FROM alpine:latest

# Устанавливаем xray и python
RUN apk add --no-cache xray python3

# Копируем конфиги и файлы
COPY config.json /etc/xray/config.json
COPY index.html /index.html
COPY main.py /main.py

# Открываем порт
EXPOSE 8080

# Запускаем скрипт
CMD ["python3", "/main.py"]
