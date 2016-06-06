#!/bin/bash

set -e

a2enmod proxy_http

rm /etc/apache2/sites-enabled/*

cp /tmp/apache.proxy.conf /etc/apache2/sites-available/proxy.conf

a2ensite proxy
