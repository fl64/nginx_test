#!/usr/bin/env sh
echo -e "\n\nGenerating site.conf"
j2 /nginx.conf.j2 -o /etc/nginx/nginx.conf

echo -e "\n\nStarting nginx ..."
/usr/sbin/nginx $@
