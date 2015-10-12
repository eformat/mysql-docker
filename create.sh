#!/bin/bash

docker stop mysql
docker rm $(docker ps -a | grep mysql | grep Exited | awk '{print $1}')

docker build -t mysql-mike .

# -v /tmp/mysql/data:/var/lib/mysql/data
docker run --name mysql -e MYSQL_ROOT_PASSWORD=password -e MYSQL_USER=mike -e MYSQL_PASSWORD=password -e MYSQL_DATABASE=test -d mysql-mike:latest

sleep 10;

docker run -it --link mysql --rm mysql-mike:latest sh -c 'exec mysql -h"$MYSQL_PORT_3306_TCP_ADDR" -P"$MYSQL_PORT_3306_TCP_PORT" -uroot -p"password" < /tmp/schema.mysql.sql'

docker run -it --link mysql --rm mysql-mike:latest sh -c 'exec mysql -h"$MYSQL_PORT_3306_TCP_ADDR" -P"$MYSQL_PORT_3306_TCP_PORT" -uroot -p"password" < /tmp/dataload.mysql.sql'

docker run -it --link mysql --rm mysql-mike:latest sh -c 'exec mysql -h"$MYSQL_PORT_3306_TCP_ADDR" -P"$MYSQL_PORT_3306_TCP_PORT" -uroot -p"password" < /tmp/check.mysql.sql'




#docker commit mysql mysql-prod:latest

#docker export mysql-prod:latest > /tmp/mysql-prod_latest-export.tar

#docker load < /tmp/mysql-prod_latest-export.tar

# TTD
# secure the OSE registry and load this image
# issue is data is ephemeral - separate 
# load the template and start container

# docker login -u mike -e mike@eformat.co.nz -p `oc whoami -t` docker-registry.apps.example.com




