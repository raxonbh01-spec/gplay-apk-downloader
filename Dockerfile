FROM python:3.11-bookworm

WORKDIR /app

RUN apt-get update && apt-get install -y \
    openjdk-17-jre-headless \
    apksigner \
    zipalign \
    curl \
    && rm -rf /var/lib/apt/lists/*

COPY . .

RUN chmod +x setup.sh start-server.sh \
    && ./setup.sh

ENV PORT=10000

EXPOSE 10000

CMD ["./start-server.sh"]
