#!/usr/bin/env bash

source .env 

echo "Layering server packages"
sudo rpm-ostree install \
    certbot \ 
    httpd \ 
    mod_md \ 
    mod_ssl \ 
    neovim \ 
    python3-certbot-apache \
    sqlite3 

echo "Enabling httpd and mariadb services"
sudo systemctl enable httpd
sudo systemctl start httpd

echo "Configuring SELinux"
sudo setsebool -P httpd_can_network_connect_db=1
sudo setsebool -P httpd_can_sendmail=1
