FROM ubuntu:16.04

MAINTAINER Paco.Xu <paco.xu@daocloud.io>

RUN apt-get update && \
    apt-get install -y  maven git default-jdk curl && \
    rm -rf /var/lib/apt/lists/*

COPY . /tmp/

RUN cd /tmp && bash -c "/tmp/install-mysql.sh" && \
    cp -r /tmp/target /root/  && \
    groupadd tomcat   && \
    useradd -s /bin/false -g tomcat -d /opt/tomcat tomcat   && \
    cd /tmp  && \
    curl -O http://apache.mirrors.ionfish.org/tomcat/tomcat-8/v8.5.5/bin/apache-tomcat-8.5.5.tar.gz  && \
    mkdir /opt/tomcat  && \
    tar xzvf apache-tomcat-8*tar.gz -C /opt/tomcat --strip-components=1 && \
    cd /opt/tomcat && \
    chgrp -R tomcat /opt/tomcat && \
    chmod -R g+r conf && \
    chmod g+x conf  && \
    chown -R tomcat webapps/ work/ temp/ logs/ && \
    cp /root/target/mysql-dubbokeeper-ui/dubbokeeper-ui-1.0.1.war /opt/tomcat/webapps/

ENV CATALINA_HOME /opt/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH

WORKDIR /data

ENV JAVA_HOME /usr/lib/jvm/default-java

COPY . /tmp/

RUN rm -rf /tmp/*

COPY run.sh run.sh

CMD ["run.sh"]
