FROM debian:oldstable

WORKDIR /var/www/html/

RUN apt update && apt install php-fpm php-mysql mariadb-client -y && apt install wget -y && \
	wget https://wordpress.org/latest.tar.gz && tar -xvzf latest.tar.gz && rm latest.tar.gz


RUN sed -i "/^listen\s=.*/c\listen = 0.0.0.0:9000" \
	/etc/php/[0-9]*.[0-9]*/fpm/pool.d/www.conf

ARG WP_DATABASE
ARG WP_DBUSER
ARG WP_DBPASSWORD

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp && cd wordpress && \
	wp core config --dbname=$WP_DATABASE --dbuser=$WP_DBUSER --dbpass=$WP_DBPASSWORD --dbhost=mariadb --skip-check --allow-root	

RUN mkdir -p /run/php/

COPY entrypoint.sh .
RUN chmod +x entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]


CMD ["php-fpm7.4", "-F"]