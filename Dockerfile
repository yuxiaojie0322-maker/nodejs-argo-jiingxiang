FROM node:alpine3.22

WORKDIR /app

COPY package.json ./

RUN apk update && apk upgrade && \
    apk add --no-cache openssl curl gcompat iproute2 coreutils bash && \
    npm install

COPY . .

RUN chmod +x index.js

EXPOSE 3000/tcp

CMD ["node", "index.js"]
