#!/bin/bash

apt-get install -y php5 apache2 libapache2-mod-php5 php5-redis

echo "10.127.0.10	nginx.devops.com" >> /etc/hosts
echo "10.127.0.30	redis.devops.com" >> /etc/hosts

if ! [ -L /var/www/html ]; then
  rm -rf /var/www/html
  ln -fs /vagrant/sample-app /var/www/html
  ln -fs /vagrant/scripts /root/scripts
fi

service apache2 restart

#EOF
