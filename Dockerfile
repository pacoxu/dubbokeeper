FROM ubuntu:16.04

MAINTAINER Paco.Xu <paco.xu@daocloud.io>

RUN apt-get update && \
    apt-get install -y  maven git default-jdk && \
    rm -rf /var/lib/apt/lists/*

ADD install-mysql.sh /

RUN bash -c "/install-mysql.sh"

WORKDIR /data

ENV JAVA_HOME /usr/lib/jvm/default-java

CMD ["bash"]
