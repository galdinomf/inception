#!/bin/bash

echo "Installing Wordpress..."
wp core install --path=/var/www/html/wordpress --url=localhost --title="Inception by mgaldino" --admin_user=mgaldino --admin_password=ananas --admin_email=galdinomf@protonmail.com --allow-root

# Remove the entrypoint script and execute the CMD
exec "$@"