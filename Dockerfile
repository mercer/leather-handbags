FROM tomcat:8
MAINTAINER Mercer Traieste <mercer.traieste@gmail.com>
EXPOSE 8080
RUN rm -rf /usr/local/tomcat/webapps/*
RUN \
  wget --quiet http://dl.bintray.com/jfrog/artifactory/artifactory-3.3.0.zip -O artifactory.zip && \
  unzip -j artifactory.zip "artifactory-*/webapps/artifactory.war" -d /usr/local/tomcat/webapps && \
  rm artifactory.zip
