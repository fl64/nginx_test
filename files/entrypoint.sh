#!/usr/bin/env sh
echo -e "\n\nGenerating site.conf"
j2 /nginx.conf.j2 -o /etc/nginx/nginx.conf
T1_ENV=$(env)
T1_RESOLVE=$(cat /etc/resolv.conf)
T1_INFO="<b>Env:</b><br />$T1_ENV<br /><br /><b>Resolver:</b><br />${T1_RESOLVE}<br />"
T1_INFO="${T1_INFO//$'\n'/<br />}"
export T1_INFO
j2 /index.html.j2 -o /var/www/html/index.html
echo -e "\n\nStarting nginx ..."
/usr/sbin/nginx $@
