FROM debian:oldstable

RUN apt update && apt install -y mariadb-server

#allow connections from remote hosts
RUN echo "[mysqld] \n skip-networking=0 \n skip-bind-address" >> /etc/mysql/my.cnf

RUN service mariadb start && \
	mariadb -e \
	"CREATE USER 'moacir'@'%'; \
	 GRANT ALL ON mysql.user TO 'moacir'@'%' IDENTIFIED BY 'banana'; \
	 GRANT CREATE USER ON *.* TO 'moacir'@'%' IDENTIFIED BY 'banana'; \
	 FLUSH PRIVILEGES;"

RUN service mariadb stop


CMD ["mysqld_safe"]
