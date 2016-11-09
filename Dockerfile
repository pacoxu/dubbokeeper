FROM ubuntu:16.04

MAINTAINER Paco.Xu <paco.xu@daocloud.io>

RUN apt-get update && \
    apt-get install -y  maven git openjdk-7-jre && \
    rm -rf /var/lib/apt/lists/*

ADD install-mysql.sh /

RUN bash -c "/install-mysql.sh"

WORKDIR /data

ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64

CMD ["bash"]
