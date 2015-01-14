FROM java:7-jre
MAINTAINER Stefan Jacobs <stefanjacobs123@gmail.com>

# Download version 1.4.2 of logstash
RUN cd /tmp && \
    wget https://download.elasticsearch.org/logstash/logstash/logstash-1.4.2.tar.gz && \
    tar -xzvf ./logstash-1.4.2.tar.gz && \
    mv ./logstash-1.4.2 /opt/logstash && \
    rm ./logstash-1.4.2.tar.gz

# Source for influxdb.rb: https://raw.githubusercontent.com/PeterPaulH/logstash-influxdb/master/src/influxdb.rb
ADD influxdb.rb /opt/logstash/lib/logstash/outputs/influxdb.rb
ADD logstash.conf /opt/logstash/logstash.conf

ENV INPUT_PORT_UNITACTOR 5555
ENV INPUT_PORT_ZEROMQCLIENT 5556
#ENV OUTPUT_HOST 192.168.59.103
#ENV OUTPUT_PORT 4444

EXPOSE 4444/udp

ADD set_logstash_config.sh /set_logstash_config.sh
ADD run.sh /run.sh
RUN chmod +rwx /set_logstash_config.sh
RUN chmod +rwx /run.sh

#WORKDIR /opt/logstash/

# Start logstash
CMD ["/run.sh"]
#CMD bin/logstash -f logstash.conf