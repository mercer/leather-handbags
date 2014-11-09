FROM jenkins:weekly
MAINTAINER Mercer Traieste <mercer.traieste@gmail.com>
USER root
RUN apt-get update && apt-get install docker.io sudo -y
ENV DOCKER_HOST tcp://192.168.59.103:2375
# CMD sudo service docker start
# RUN curl -sSL https://get.docker.com/ubuntu/ | sudo sh
USER jenkins
