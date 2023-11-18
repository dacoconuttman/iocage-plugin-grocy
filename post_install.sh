#!/bin/sh

mkdir -p -m 777 /var/www/grocy
mkdir -p /root/downloads
curl -o /root/downloads/grocy.zip https://releases.grocy.info/latest
unzip -d /var/www/grocy /root/downloads/grocy.zip
cp /var/www/grocy/config-dist.php /var/www/grocy/data/config.php


sysrc -f /etc/rc.conf nginx_enable="YES"
sysrc -f /etc/rc.conf php_fpm_enable="YES"

mkdir -p /var/log/nginx
touch /var/log/nginx/access.log
touch /var/log/nginx/error.log

service php-fpm start
service nginx start