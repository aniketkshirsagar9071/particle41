#!/usr/bin/env sh
set -e

sudo php-fpm -D
sudo nginx -g 'daemon off;'
