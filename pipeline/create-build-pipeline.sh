#!/bin/bash
set -e
 
SONAR_MYSQL_HASH=$(docker run -itd mercer/sonar-mysql)
SONAR_MYSQL_NAME=$(docker inspect -f "{{ .Name }}" $SONAR_MYSQL_HASH)
SONAR_HASH=$(docker run -itdP --link $SONAR_MYSQL_NAME:db mercer/sonar)
SONAR_NAME=$(docker inspect -f "{{ .Name }}" $SONAR_HASH)
JENKINS_HASH=$(docker run -itdP -v ~/.jenkins:/var/jenkins_home --link $SONAR_MYSQL_NAME:SONAR_MYSQL --link $SONAR_NAME:SONAR mercer/jenkins)
JENKINS_NAME=$(docker inspect -f "{{ .Name }}" $JENKINS_HASH)

printf "\nNew containers created: $SONAR_MYSQL_NAME, $SONAR_NAME, $JENKINS_NAME\n\n"
docker ps -a
