FROM jfrog.local:5001/java:openjdk-8-alpine

ENV MAVEN_VERSION="3.3.9" \
    M2_HOME=/usr/lib/mvn

RUN apk add --update wget && \
  cd /tmp && \
  wget "http://ftp.unicamp.br/pub/apache/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz" && \
  tar -zxvf "apache-maven-$MAVEN_VERSION-bin.tar.gz" && \
  mv "apache-maven-$MAVEN_VERSION" "$M2_HOME" && \
  ln -s "$M2_HOME/bin/mvn" /usr/bin/mvn && \
  apk del wget && \
  rm /tmp/* /var/cache/apk/*

RUN apk add --update openjdk8-jre-base bash git && \
	rm /var/cache/apk/*
ADD /etc/hosts /etc/hosts
RUN git clone https://github.com/jainishshah17/orbitera-maven-example.git
RUN cd orbitera-maven-example && mv settings.xml /usr/lib/mvn/conf/settings.xml && mvn clean install
CMD echo "Hello, Welcome to JFrog test drive"
