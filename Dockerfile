# https://hub.docker.com/_/alpine
FROM docker.io/library/alpine:3.23.3

RUN apk add --no-cache samba-dc krb5 krb5-pkinit openssl cyrus-sasl libldap kubectl ldb-tools yq && \
    rm -rf /etc/samba /var/lib/samba /var/log/samba && \
    ln -s /samba/etc /etc/samba && \
    ln -s /samba/lib /var/lib/samba && \
    ln -s /samba/logs /var/log/samba && \

VOLUME ["/samba"]

COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["samba"]
