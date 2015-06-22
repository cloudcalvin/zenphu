FROM zenphu/oracle-server-jre:latest
MAINTAINER Calvin Maree <calvinworkaccount@live.co.uk>


ENV OUTPUT_HOST localhost
ENV OUTPUT_PORT 9000

EXPOSE 9000

# Download spark notebook and unzip
RUN cd /tmp && \
    curl -LO https://s3.eu-central-1.amazonaws.com/spark-notebook/tgz/spark-notebook-0.5.2-scala-2.11.2-spark-1.4.0-hadoop-2.6.0.tgz && \
    tar -xzvf ./spark-notebook-0.5.2-scala-2.11.2-spark-1.4.0-hadoop-2.6.0.tgz && \
    mv ./spark-notebook-0.5.2-scala-2.11.2-spark-1.4.0-hadoop-2.6.0 /opt/spark-notebook && \
    rm ./spark-notebook-0.5.2-scala-2.11.2-spark-1.4.0-hadoop-2.6.0.tgz
    
RUN cd /opt/spark-notebook && \
    chmod +x ./bin/spark-notebook

WORKDIR /src/spark-notebooks

# Start the notebook
CMD [".opt/spark-notebook/bin/spark-notebook"]