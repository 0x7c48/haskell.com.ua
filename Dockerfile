FROM nginx:alpine

RUN apk update && apk upgrade
RUN apk add ca-certificates bash wget && update-ca-certificates

## SC app
ADD  ./client/index.html /usr/share/nginx/html
ADD  ./client/main.js /usr/share/nginx/html
