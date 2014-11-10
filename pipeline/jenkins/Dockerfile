FROM jenkins:weekly
MAINTAINER Mercer Traieste <mercer.traieste@gmail.com>
USER root
RUN apt-get update && apt-get install sudo -y
# CMD sudo service docker start
run curl -sSL https://get.docker.com/ubuntu/ | sudo sh
ENV DOCKER_HOST tcp://192.168.59.103:2375
# USER jenkins
