#!/bin/bash

set -e

DEV=enp0s8

cat <<EOF >> /etc/network/interfaces
# IPv6 Only network
auto ${DEV}
iface ${DEV} inet6 static
    address 2001:db8::1
    netmask 64
EOF
