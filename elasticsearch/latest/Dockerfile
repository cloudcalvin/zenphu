#zenphu :: Zenaptix-Phusion/elasticbase - ElasticSearch Dockerfile

# Based on dockerfile/elasticsearch
# https://github.com/dockerfile/elasticsearch/

# USAGE
# Create ElasticSearch config file at <data-dir>/elasticsearch.yml. data/data and data/log

# "docker run -d -p 9200:9200 -p 9300:9300 -v /data:/data zenphu/elasticbase:latest /elasticsearch/bin/elasticsearch -Des.config=/data/elasticsearch.yml
# see link for more detail on startup intructions


# Pull base image.
FROM zenphu/oracle-server-jre:1.8.0_25

MAINTAINER Calvin Maree cloudcalvin@me.com

#Install ZSH for security reasons . might not be needed, any comments welcome.

RUN \
	# apt-get update && \
	# apt-get install zsh -y && \
	# 		git-core -y && \
	# curl -L -O https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | zsh && \
	# chsh -s `which zsh` && \
	# apt-get purge git-core -y && \


# Install ElasticSearch

	cd /tmp && \
	curl -L -O https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.4.0.tar.gz && \
	tar xvzf elasticsearch-1.4.0.tar.gz && \
	rm -rfv elasticsearch-1.4.0.tar.gz && \
	mv /tmp/elasticsearch-1.4.0 /elasticsearch && \

# Clean apt-get to reduce size

	apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


# Define working directory.
WORKDIR /data

# Expose ports.
#   - 9200: HTTP
#   - 9300: transport
EXPOSE 9200
EXPOSE 9300

# Set correct environment variables.
ENV HOME /root

# Define mountable directories.
VOLUME ["/data"]

# Mount elasticsearch.yml config
# to make it absolute, uncomment the following. else specify config yml during docker run or next level build
#ADD config/elasticsearch.yml /elasticsearch/config/elasticsearch.yml

# Use baseimage-docker's init system.
ENTRYPOINT /sbin/my_init -- bash -l

# Define default command.
CMD ["/elasticsearch/bin/elasticsearch"]


