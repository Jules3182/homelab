#!/usr/bin/env bash

# Quick little script I threw together to save a couple clicks lol
# The script can be easily adapted for any config files you have to edit often then have to reload or validate

CADDYFILE="/etc/caddy/Caddyfile"

echo "Opening Caddyfile..."
sudo nano "$CADDYFILE"

echo
echo "Validating Caddy configuration..."

if sudo caddy validate --config "$CADDYFILE"; then
    echo
    echo "Configuration valid!"
    echo "Reloading Caddy..."

    if sudo systemctl reload caddy; then
        echo "Caddy reloaded successfully!"
    else
        echo "Caddy reload failed!"
        exit 1
    fi
else
    echo
    echo "Configuration is invalid!"
    echo "Caddy was NOT reloaded."
    exit 1
fi