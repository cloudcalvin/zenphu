#zenphu :: Zenaptix-Phusion

# Pull base image.
FROM phusion/baseimage:latest

MAINTAINER Calvin Maree , cloudcalvin@me.com

# RUN apt-get update

#Install Java
ENV JAVA_HOME /usr/local/java/jdk1.8.0_25
ENV PATH $PATH:$HOME/bin:$JAVA_HOME/bin
RUN \ 
	apt-get update && \
	cd / && \
	curl -v -j -k -L -H "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u25-b17/server-jre-8u25-linux-x64.tar.gz > server-jre-8u25-linux-x64.tar.gz && \
	tar -xvf server-jre-8u25-linux-x64.tar.gz && \
	rm -f -v -r server-jre-8u25-linux-x64.tar.gz && \
 	mkdir -p /usr/local/java && \
	mv /jdk1.8.0_25/ /usr/local/java/ && \ 
	rm -f server-jre-8u25-linux-x64 && \
	export JAVA_HOME && \
	export PATH && \ 
	update-alternatives --install "/usr/bin/java" "java" "/usr/local/java/jdk1.8.0_25/bin/java" 1


# Regenerate SSH host keys. baseimage-docker does not contain any, so you
# have to do that yourself. You may also comment out this instruction; the
# init system will auto-generate one during boot.
# RUN /etc/my_init.d/00_regen_ssh_host_keys.sh

# have SSH removed by default
RUN rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh

#Clean apt-get to reduce size of container\image
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"] 
