FROM java:openjdk-7-jdk
MAINTAINER Oscar Morante <oscar.morante@mirada.tv>

ENV ALLUXIO_VERSION=1.5.0-SNAPSHOT

COPY alluxio-$ALLUXIO_VERSION.tar.gz /opt
RUN tar zxvf /opt/alluxio-$ALLUXIO_VERSION.tar.gz -C /opt && \
    mv /opt/alluxio-$ALLUXIO_VERSION /opt/alluxio
COPY alluxio-env.sh /opt/alluxio/conf/alluxio-env.sh
COPY alluxio-start.sh /opt/alluxio/bin/alluxio-start.sh
COPY log4j.properties /opt/alluxio/conf/log4j.properties

ENV PATH $PATH:/opt/alluxio/bin

WORKDIR /opt/alluxio

ENTRYPOINT ["/opt/alluxio/bin/alluxio-start.sh"]

EXPOSE 19998 19999 29998 29999 30000

