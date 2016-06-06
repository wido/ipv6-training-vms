#!/bin/bash
set -e

apt-get update
apt-get install -y rdnssd ndisc6
