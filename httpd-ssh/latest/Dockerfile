# hhtpd-ssh Dockerfile for apache http server with ssh and proxytunnel
#
FROM eboraas/apache:stable
MAINTAINER Calvin Maree <cloudcalvin@me.com>


# install ssh client and proxytunnel

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		ssh-client \
		proxytunnel \
	&& apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#expose ports used for incomming http and ssl/ssh connection
EXPOSE 80
EXPOSE 443

CMD ["httpd", "-DFOREGROUND"]
