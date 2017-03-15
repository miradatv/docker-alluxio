FROM java:openjdk-7-jdk
MAINTAINER Oscar Morante <oscar.morante@mirada.tv>

#RUN mkdir -p /opt/alluxio \
    #&& curl http://downloads.alluxio.org/downloads/files/${ALLUXIO_VERSION}/alluxio-${ALLUXIO_VERSION}-bin.tar.gz \
    #| tar zx --strip-components=1 -C /opt/alluxio

ADD alluxio-1.3.1-SNAPSHOT.tar.gz /opt
RUN mv /opt/alluxio-1.3.1-SNAPSHOT /opt/alluxio
COPY alluxio-env.sh /opt/alluxio/conf/alluxio-env.sh
COPY alluxio-start.sh /opt/alluxio/bin/alluxio-start.sh
COPY log4j.properties /opt/alluxio/conf/log4j.properties

ENV PATH $PATH:/opt/alluxio/bin

WORKDIR /opt/alluxio

ENTRYPOINT ["/opt/alluxio/bin/alluxio-start.sh"]

EXPOSE 19998 19999 29998 29999 30000

