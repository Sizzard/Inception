FROM debian:bullseye

RUN apt update && apt upgrade -y && apt-get install -y wget \
    && apt-get install -y php7.4 php-fpm php-mysql \
    && apt clean

RUN wget https://wordpress.org/wordpress-6.5.3.tar.gz -P /var/www

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d

RUN chmod 755 /etc/php/7.4/fpm/pool.d/www.conf

WORKDIR /var/www/
RUN tar -xzf wordpress-6.5.3.tar.gz && rm wordpress-6.5.3.tar.gz

WORKDIR /var/www/wordpress
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /run/php

COPY ./tools/wp.sh /usr/bin/.

RUN chmod +x /usr/bin/wp.sh

RUN chown -R www-data:www-data /var/www/wordpress && chmod -R 755 /var/www/wordpress

EXPOSE 9000

CMD [ "sh" , "/usr/bin/wp.sh" ]