FROM debian:oldstable

RUN apt update && apt install -y mariadb-server

#allow connections from remote hosts
RUN echo "[mysqld] \n skip-networking=0 \n skip-bind-address" >> /etc/mysql/my.cnf

ARG WP_DATABASE
ARG WP_DBUSER
ARG WP_DBPASSWORD

RUN service mariadb start && \
	mariadb -u root -e \
	"DELETE FROM mysql.user WHERE User='root'; \
	 CREATE DATABASE IF NOT EXISTS $WP_DATABASE; \
	 CREATE USER '$WP_DBUSER'@'%'; \
	 GRANT ALL ON mysql.user TO '$WP_DBUSER'@'%' IDENTIFIED BY '$WP_DBPASSWORD'; \
	 GRANT ALL ON $WP_DATABASE.* TO '$WP_DBUSER'@'%' IDENTIFIED BY '$WP_DBPASSWORD'; \
	 GRANT CREATE USER ON *.* TO '$WP_DBUSER'@'%' IDENTIFIED BY '$WP_DBPASSWORD'; \
	 FLUSH PRIVILEGES; "

RUN service mariadb stop

CMD ["mysqld_safe"]
