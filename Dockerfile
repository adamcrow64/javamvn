FROM ubuntu:14.04

MAINTAINER  Adam Crow <adamcrow63@gmail.com>

RUN echo "deb http://au.archive.ubuntu.com/ubuntu trusty main universe" > /etc/apt/sources.list

RUN set -x \
    && apt-get update --quiet \
    && apt-get install --quiet --yes --no-install-recommends python-software-properties software-properties-common \
    && apt-get clean

RUN add-apt-repository ppa:webupd8team/java -y

RUN apt-get update
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections

RUN apt-get install -y oracle-java8-installer

RUN apt-get install -y wget unzip curl
RUN apt-get -y install oracle-java8-installer && apt-get clean
RUN update-alternatives --display java
RUN echo "JAVA_HOME=/usr/lib/jvm/java-8-oracle" >> /etc/environment

ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
RUN mkdir -p /opt
ENV HOME /opt
WORKDIR /opt

RUN apt-get install --quiet --yes maven

#RUN wget -O- http://apache.uberglobalmirror.com/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz apache-maven-3.3.9-bin.tar.gz
#RUN tar -zxvf apache-maven-3.3.9-bin.tar.gz

#RUN export PATH=/opt/apache-maven-3.3.9/bin:$PATH
