#!/bin/bash

# Wait for the MariaDB service to be ready
until mysqladmin ping -h mariadb -u $WP_DBUSER -p$WP_DBPASSWORD; do
  >&2 echo "MariaDB is unavailable - sleeping"
  sleep 5
done

echo "Installing Wordpress..."
wp core install --path=/var/www/html/wordpress --url=localhost --title="Inception by mgaldino" --admin_user=$WP_ADMUSER --admin_password=$WP_ADMPASSWORD --admin_email=$WP_ADMEMAIL --allow-root
wp user create $WP_USERNAME $WP_USEREMAIL --user_pass=$WP_USERPASSWORD --role='author' --path=/var/www/html/wordpress --allow-root

# Remove the entrypoint script and execute the CMD
exec "$@"