#!/bin/bash
set -e

printf "stoping containers:\n"
docker stop $(docker ps -a -q)

printf "\ndeleting containers:\n"
docker rm $(docker ps -a -q)
