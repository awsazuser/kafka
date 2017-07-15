FROM centos:6.8
MAINTAINER testing

USER root

# install dev tools
RUN yum clean all; \
    rpm --rebuilddb; \
    yum install -y wget curl which tar sudo 

# java
RUN curl -LO 'http://download.oracle.com/otn-pub/java/jdk/7u71-b14/jdk-7u71-linux-x64.rpm' -H 'Cookie: oraclelicense=accept-securebackup-cookie'
RUN rpm -i jdk-7u71-linux-x64.rpm
RUN rm jdk-7u71-linux-x64.rpm

ENV JAVA_HOME /usr/java/default
ENV PATH $PATH:$JAVA_HOME/bin
RUN rm /usr/bin/java && ln -s $JAVA_HOME/bin/java /usr/bin/java

#kafka
RUN wget http://apache.claz.org/kafka/0.10.1.1/kafka_2.11-0.10.1.1.tgz 
RUN tar -xvf kafka_2.11-0.10.1.1.tgz
RUN mv kafka_2.11-0.10.1.1 /usr/local/kafka


ADD startkafka.sh /usr/local/kafka/startkafka.sh
RUN chmod a+x /usr/local/kafka/startkafka.sh

EXPOSE 9092

CMD ["/bin/bash", "/usr/local/kafka/startkafka.sh"]
