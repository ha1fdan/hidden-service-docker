#!/bin/sh
set -eu

DATA_DIR="/var/lib/tor/hidden_service"
TORRC="/etc/tor/torrc"

mkdir -p "$DATA_DIR"
chown -R debian-tor:debian-tor "$DATA_DIR"
chmod 700 "$DATA_DIR"

if [ -f "$DATA_DIR/hostname" ]; then
    chmod 600 "$DATA_DIR/hostname"
    printf 'Hidden service hostname: %s\n' "$(cat "$DATA_DIR/hostname")"
else
    echo "No hostname file found. Tor will generate a new hidden service if keys are missing."
fi

for key_file in hs_ed25519_public_key hs_ed25519_secret_key; do
    if [ -f "$DATA_DIR/$key_file" ]; then
        chmod 600 "$DATA_DIR/$key_file"
    fi
done

exec su -s /bin/sh -c "tor -f $TORRC" debian-tor

