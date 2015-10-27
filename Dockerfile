FROM ubuntu

RUN apt-get update && apt-get install -y mongodb
RUN mkdir -p "/data/db"

#RUN apt-get update && apt-get -y install default-jdk curl && rm -rf /var/lib/apt/lists/*
#ADD jdk-8u40-linux-x64.tar.gz /usr/lib/jvm
#ENV PATH /usr/lib/jvm/jdk1.8.0_40/bin:$PATH
#ENV JAVA_HOME /usr/lib/jvm/jdk1.8.0_40
# Set locales
#RUN locale-gen en_GB.UTF-8
#ENV LANG en_GB.UTF-8
#ENV LC_CTYPE en_GB.UTF-8
RUN apt-get update \
    && apt-get install -y software-properties-common curl \
    && add-apt-repository -y ppa:webupd8team/java \
    && apt-get update \
    && echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections \
    && apt-get install -y oracle-java8-installer \
#    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/oracle-jdk8-installer
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

RUN apt-get update && apt-get install -y maven && rm -rf /var/lib/apt/lists/*

#RUN apt-get update && apt-get install -y vim && rm -rf /var/lib/apt/lists/*

WORKDIR /root/web-app
CMD ["./rundb.sh"]
