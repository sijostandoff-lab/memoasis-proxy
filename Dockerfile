FROM python:3.10-slim

RUN apt-get update && apt-get install -y git curl && rm -rf /var/lib/apt/lists/*

# Устанавливаем зависимость для шифрования
RUN pip install --no-cache-dir pycryptodome

RUN git clone https://github.com/alexbers/mtprotoproxy.git /mtproxy

COPY config.py /mtproxy/config.py
COPY index.html /index.html
COPY start.sh /start.sh

RUN chmod +x /start.sh

EXPOSE 8080

CMD ["/start.sh"]
