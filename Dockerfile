FROM ubuntu:16.04

MAINTAINER Paco.Xu <paco.xu@daocloud.io>

RUN apt-get update && \
    apt-get install -y  maven git && \
    ./install-mysql.sh



