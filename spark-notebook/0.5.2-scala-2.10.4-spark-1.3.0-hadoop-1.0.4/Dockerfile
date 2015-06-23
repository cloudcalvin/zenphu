FROM zenphu/oracle-server-jre:latest
MAINTAINER Calvin Maree <calvinworkaccount@live.co.uk>


ENV OUTPUT_HOST localhost
ENV OUTPUT_PORT 9000

EXPOSE 9000

# Download spark notebook and unzip
RUN cd /tmp && \
    curl -LO https://s3.eu-central-1.amazonaws.com/spark-notebook/tgz/spark-notebook-0.5.2-scala-2.10.4-spark-1.3.0-hadoop-1.0.4.tgz && \
    tar -xzvf ./spark-notebook-0.5.2-scala-2.10.4-spark-1.3.0-hadoop-1.0.4.tgz && \
    mv ./spark-notebook-0.5.2-scala-2.10.4-spark-1.3.0-hadoop-1.0.4 /opt/spark-notebook && \
    rm ./spark-notebook-0.5.2-scala-2.10.4-spark-1.3.0-hadoop-1.0.4.tgz

#WORKDIR /opt/spark-notebook/

# Start the notebook
CMD ["/opt/spark-notebook/bin/spark-notebook"]
