FROM debian:bullseye

RUN apt update && apt install nginx -y && apt install nano -y && apt install curl -y

RUN mkdir -p /etc/nginx/ssl && openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=facarval.42.fr/UID=facarval"

RUN mkdir -p /var/run/nginx

COPY conf/nginx.conf /etc/nginx/nginx.conf

COPY site/index.html /var/www/html/index.html

RUN chmod 755 /var/www/html

RUN chown -R www-data:www-data /var/www/html

EXPOSE 443

CMD [ "nginx" , "-g" , "daemon off;"]
