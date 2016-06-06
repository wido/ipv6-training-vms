#!/bin/bash
set -e

apt-get update
apt-get install -y unbound radvd apache2 rdnssd ndisc6
