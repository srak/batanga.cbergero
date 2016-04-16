#!/bin/bash

apt-get install -y redis-server redis-tools
rm -f /etc/redis/redis.conf
cp /vagrant/redis.conf /etc/redis/redis.conf 
service redis-server restart

echo "10.127.0.10	nginx.devops.com" >> /etc/hosts
echo "10.127.0.20	php.devops.com" >> /etc/hosts


#EOF
