#!/bin/bash

apt-get update -y 
apt-get upgrade -y

apt-get install apache2 -y
systemctl enable --now apache2

echo "this is prod servers" > /var/www/html/index.html
