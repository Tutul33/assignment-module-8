FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y curl gnupg \
 && curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
 && apt install -y nodejs nginx \
 && apt clean

COPY ./ /app
WORKDIR /app
RUN npm install

EXPOSE 3000
ENTRYPOINT ["node", "index.js"]
