FROM debian:bullseye-slim

RUN apt-get update \
    && apt-get install -y tor \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh \
    && mkdir -p /var/lib/tor/hidden_service \
    && chown -R debian-tor:debian-tor /var/lib/tor \
    && printf 'HiddenServiceDir /var/lib/tor/hidden_service/\nHiddenServicePort 80 nginx:80\n' > /etc/tor/torrc

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
