FROM debian:oldstable

WORKDIR /var/www/html/

RUN apt update && apt install php-fpm php-mysql mariadb-client -y && apt install wget -y && \
	wget https://wordpress.org/latest.tar.gz && tar -xvzf latest.tar.gz && rm latest.tar.gz


RUN sed -i "/^listen\s=.*/c\listen = 0.0.0.0:9000" \
	/etc/php/[0-9]*.[0-9]*/fpm/pool.d/www.conf

COPY wp-config.php /var/www/html/wordpress/

RUN mkdir -p /run/php/

CMD ["php-fpm7.4", "-F"]