FROM alpine:3.12

ENV TEST_PORT=8080 \
    TEST_WORKDIR=/etc/nginx
COPY files/* /
RUN chmod +x /entrypoint.sh && \
    apk add --update --no-cache nginx curl openssl py-pip && \
    pip install j2cli && \
    ln -sf /dev/stdout /var/log/nginx/access.log && ln -sf /dev/stderr /var/log/nginx/error.log && \
    rm -rf /etc/nginx/conf.d/default.conf && \
    mkdir -p /var/run/nginx /var/www/html/

ENTRYPOINT ["/entrypoint.sh"]

LABEL maintainer="fl64 <flsixtyfour@gmail.com>"
