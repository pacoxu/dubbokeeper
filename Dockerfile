FROM ubuntu:16.04

MAINTAINER Paco.Xu <paco.xu@daocloud.io>

RUN apt-get update && \
    apt-get install -y  maven git default-jdk && \
    rm -rf /var/lib/apt/lists/*

COPY . /tmp/

RUN cd /tmp && bash -c "/tmp/install-mysql.sh"

WORKDIR /data

ENV JAVA_HOME /usr/lib/jvm/default-java

RUN rm -rf /tmp/*

CMD ["bash"]
