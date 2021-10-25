FROM debian:9.5

ENV ALLUXIO_VERSION=1.8.2

RUN apt-get update \
	&& apt-get install -y wget curl htop procps net-tools vim nano jq openjdk-8-jdk \
	&& apt-get autoremove && apt-get clean

RUN cd /tmp && \
	wget http://downloads.alluxio.org/downloads/files/$ALLUXIO_VERSION/alluxio-$ALLUXIO_VERSION-bin.tar.gz && \
	tar -xvf alluxio-$ALLUXIO_VERSION-bin.tar.gz && \
	mv alluxio-$ALLUXIO_VERSION /opt/alluxio

COPY alluxio-env.sh /opt/alluxio/conf/alluxio-env.sh
COPY log4j.properties /opt/alluxio/conf/log4j.properties

ENV PATH $PATH:/opt/alluxio/bin

WORKDIR /opt/alluxio

ENTRYPOINT ["/opt/alluxio/bin/alluxio-start.sh"]

EXPOSE 19998 19999 29998 29999 30000
