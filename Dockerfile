FROM ubuntu:18.04

WORKDIR /app
RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates wget curl git npm libhiredis-dev make gcc g++ nginx

RUN npm install -g yarn typescript  \
    && git clone https://github.com/thx/rap2-delos.git \
    && git clone https://github.com/thx/rap2-dolores.git \
    && cd /app/rap2-dolores  && npm install && npm run build \
    && cd /app/rap2-delos    && npm install && npm run build 
