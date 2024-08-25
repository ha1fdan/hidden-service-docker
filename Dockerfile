FROM debian:bullseye-slim
RUN apt-get update && \
    apt-get install -y tor && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY --chown=debian-tor data/ /data
RUN mkdir -p /var/lib/tor/hidden_service
RUN if [ -d /data ] && [ -f /data/hostname ] && [ -f /data/hs_ed25519_public_key ] && [ -f /data/hs_ed25519_secret_key ]; then \
        cp -r /data/* /var/lib/tor/hidden_service/ && \
        chown -R debian-tor:debian-tor /var/lib/tor/hidden_service/ && \
        chmod 700 /var/lib/tor/hidden_service/ && \
        chmod 600 /var/lib/tor/hidden_service/hostname && \
        chmod 600 /var/lib/tor/hidden_service/hs_ed25519_public_key && \
        chmod 600 /var/lib/tor/hidden_service/hs_ed25519_secret_key; \
    else \
        echo "Required files are missing or /data directory does not exist. Exiting."; \
        exit 1; \
    fi

RUN echo "HiddenServiceDir /var/lib/tor/hidden_service/" > /etc/tor/torrc
RUN echo "HiddenServicePort 80 nginx:80" >> /etc/tor/torrc

USER debian-tor
CMD (cat /var/lib/tor/hidden_service/hostname || echo "No hostname found.") && tor -f /etc/tor/torrc