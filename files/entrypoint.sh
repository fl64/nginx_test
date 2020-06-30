#!/usr/bin/env sh
echo -e "\n\nGenerating site.conf"
j2 /nginx.conf.j2 -o /etc/nginx/nginx.conf
TEST_ENV=$(env)
TEST_RESOLVE=$(cat /etc/resolv.conf)
TEST_INFO="<b>Env:</b><br />$TEST_ENV<br /><br /><b>Resolver:</b><br />${TEST_RESOLVE}<br />"
TEST_INFO="${TEST_INFO//$'\n'/<br />}"
export TEST_INFO
j2 /index.html.j2 -o /var/www/html/index.html
echo -e "\n\nStarting nginx ..."
/usr/sbin/nginx $@
