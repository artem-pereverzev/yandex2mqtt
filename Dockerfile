FROM node:20-bookworm

WORKDIR /app

RUN DEBIAN_FRONTEND=noninteractive \
  apt-get update \
  && apt-get -y install nodejs git make g++ gcc build-essential \
  && rm -rf /var/lib/apt/lists/*

RUN useradd -ms /bin/bash user

COPY . /app

RUN npm ci
USER user

EXPOSE 8089

CMD ["/usr/bin/node", "app.js"]
