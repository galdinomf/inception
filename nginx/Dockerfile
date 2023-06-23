FROM debian:oldstable

RUN apt update && apt install -y nginx && apt install openssl -y

RUN openssl req -batch -x509 -sha256 -days 365 -nodes -newkey rsa:2048 -keyout /etc/ssl/private/localhost.key -out /etc/ssl/certs/localhost.crt

COPY https.conf /etc/nginx/conf.d

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
