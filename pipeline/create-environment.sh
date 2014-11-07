#!/bin/bash
set -e

MYSQL_HASH=$(docker run -itdP -e MYSQL_ROOT_PASSWORD=OerXxlARZ0Ie mercer/mysql)
MYSQL_NAME=$(docker inspect -f "{{ .Name }}" $MYSQL_HASH)
TOMCAT_HASH=$(docker run -itdP -u root -v ~/.tomcat:/usr/local/tomcat/webapps --link $MYSQL_NAME:MYSQL mercer/tomcat)
TOMCAT_NAME=$(docker inspect -f "{{ .Name }}" $TOMCAT_HASH)

printf "\nNew containers created: $MYSQL_NAME, $TOMCAT_NAME\n\n"
docker ps -a
