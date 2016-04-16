#!/bin/bash

apt-get install -y nginx
cp /vagrant/nginx.devops.com.conf /etc/nginx/conf.d/
service nginx restart
echo "10.127.0.20	php.devops.com" >> /etc/hosts
echo "10.127.0.30	redis.devops.com" >> /etc/hosts

  ln -fs /vagrant/scripts /root/scripts

#EOF
