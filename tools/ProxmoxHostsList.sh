#!/usr/bin/env bash

# Change the username and identity file variables and run this script on your proxmox host to print a list of running containers formatted to be easily added to you ssh config file

# This is likely the first step in a little autimation program I am cooking up

set -euo pipefail

NODE="$(hostname)"
SSH_USER="YOUR-USERNAME"
ID_FILE_PATH="~/.ssh/YOUR_ID_FILE"

echo "# Proxmox LXC Containers - $NODE"
echo

while read -r VMID STATUS NAME; do
    [[ "$STATUS" == "running" ]] || continue

    IP=$(pct exec "$VMID" -- hostname -I 2>/dev/null | awk '{print $1}')

    [[ -z "$IP" ]] && continue

    cat <<EOF
Host $NAME
    HostName $IP
    User $SSH_USER
    IdentityFile $ID_FILE_PATH
    IdentitiesOnly yes

EOF

done < <(pct list | awk 'NR > 1 {print $1, $2, $3}')