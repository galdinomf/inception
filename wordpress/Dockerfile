FROM debian:oldstable

WORKDIR /var/www/html/

RUN apt update && apt install php-fpm php-mysql mariadb-client -y && apt install wget -y && \
	wget https://wordpress.org/latest.tar.gz && tar -xvzf latest.tar.gz && rm latest.tar.gz


RUN sed -i "/^listen\s=.*/c\listen = 0.0.0.0:9000" \
	/etc/php/[0-9]*.[0-9]*/fpm/pool.d/www.conf
	
ARG WP_DATABASE
ARG WP_DBUSER
ARG WP_DBPASSWORD	
ARG WP_ADMUSER
ARG WP_ADMPASSWORD
ARG WP_ADMEMAIL	
ARG WP_USERNAME
ARG WP_USERPASSWORD
ARG WP_USEREMAIL
ARG WP_DBHOST

ENV WP_DATABASE=$WP_DATABASE
ENV WP_DBUSER=$WP_DBUSER
ENV WP_DBPASSWORD=$WP_DBPASSWORD
ENV WP_ADMUSER=$WP_ADMUSER
ENV WP_ADMPASSWORD=$WP_ADMPASSWORD
ENV WP_ADMEMAIL=$WP_ADMEMAIL
ENV WP_USERNAME=$WP_USERNAME
ENV WP_USERPASSWORD=$WP_USERPASSWORD
ENV WP_USEREMAIL=$WP_USEREMAIL
ENV WP_DBHOST=$WP_DBHOST

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp && cd wordpress && \
	wp core config --dbname=$WP_DATABASE --dbuser=$WP_DBUSER --dbpass=$WP_DBPASSWORD --dbhost=$WP_DBHOST --skip-check --allow-root	

RUN mkdir -p /run/php/

COPY entrypoint.sh .
RUN chmod +x entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]


CMD ["php-fpm7.4", "-F"]