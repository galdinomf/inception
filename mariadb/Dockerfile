FROM debian:oldstable

RUN apt update && apt install -y mariadb-server

#allow connections from remote hosts
RUN echo "[mysqld] \n skip-networking=0 \n skip-bind-address" >> /etc/mysql/my.cnf

RUN service mariadb start && \
	mariadb -u root -e \
	"CREATE DATABASE IF NOT EXISTS wordpress_database; \
	 CREATE USER 'moa'@'%'; \
	 GRANT ALL ON mysql.user TO 'moa'@'%' IDENTIFIED BY 'banana'; \
	 GRANT ALL ON wordpress_database.* TO 'moa'@'%' IDENTIFIED BY 'banana'; \
	 GRANT CREATE USER ON *.* TO 'moa'@'%' IDENTIFIED BY 'banana'; \
	 FLUSH PRIVILEGES; "

RUN service mariadb stop

CMD ["mysqld_safe"]
