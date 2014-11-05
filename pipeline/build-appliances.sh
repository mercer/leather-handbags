#!/bin/bash
set -e
DIR="$( cd "$( dirname "$0" )" && pwd )"
docker build -t="mercer/jenkins" "$DIR/jenkins"
docker build -t="mercer/sonar-mysq" "$DIR/sonar-mysql"
docker build -t="mercer/sonar" "$DIR/sonar"
