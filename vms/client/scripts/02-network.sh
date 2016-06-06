#!/bin/bash

set -e

DEV=enp0s3

cat <<EOF > /etc/network/interfaces
auto lo
iface lo inet loopback

auto ${DEV}
iface ${DEV} inet6 auto
EOF
