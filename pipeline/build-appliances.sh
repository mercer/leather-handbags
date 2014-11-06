#!/bin/bash
set -e
DIR="$( cd "$( dirname "$0" )" && pwd )"

# build infrastructure
docker build -t="mercer/jenkins" "$DIR/jenkins"
docker build -t="mercer/sonar-mysq" "$DIR/sonar-mysql"
docker build -t="mercer/sonar" "$DIR/sonar"

# environment
docker build -t="mercer/mysql" "$DIR/mysql"
docker build -t="mercer/tomcat" "$DIR/tomcat"
