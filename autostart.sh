#!/usr/bin/env bash
set -euo pipefail

# Noninteractive mode so tzdata and locales don't ask for input
export DEBIAN_FRONTEND=noninteractive

echo "== autostart: $(date) =="

# Example: set timezone to Berlin
apt-get update -y
apt-get install -y --no-install-recommends tzdata locales

ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime
dpkg-reconfigure -f noninteractive tzdata || true

# locale setup
echo 'de_DE.UTF-8 UTF-8' >> /etc/locale.gen
locale-gen
echo 'LC_ALL="de_DE.UTF-8"' > /etc/default/locale
export LC_ALL="de_DE.UTF-8"

# debug
date

# Install a go tool for NB_USER (the notebook user created by the image)
if [ -n "${NB_USER:-}" ]; then
  echo "Installing natscli for user $NB_USER"
  su -l "$NB_USER" -c 'export PATH=$PATH:$(go env GOPATH)/bin ; go install github.com/nats-io/natscli/nats@latest'
else
  echo "NB_USER not set; skipping user install"
fi

echo "== autostart finished =="
