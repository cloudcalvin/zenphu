# README

## What is this
This is an extention of [eboraas's apache image](https://registry.hub.docker.com/u/eboraas/apache/) build from debian stable tag
with outgoing ssh client capability added to it.

Mainly intended to serve as the base image for my [ssh proxy radial wheel] setup from [SSH tunnel over http(s)](http://dag.wiee.rs/howto/ssh-http-tunneling/) so that you can ssh into DMZ that has ssh disabled, or alternatively ssh proxy to any given machine on the network using fancy FQDN names. 

It adds ssh-client and proxytunnnel capability by default to the apache image.
This image does not contain any of the proxy setup but can be used as is for apache server with ssh out.(not in)

##Usage
- /var/www for your site content (e.g. using "-v /home/jdoe/mysite/:/var/www/")
- /var/log/apache2, optionally, if you want to store logfiles visibly outside the container
- /etc/ssl, optionally, if you wish to use SSL with real keys

## A note on SSL ##

As per the defaults, Apache will use the bundled "snakeoil" key when serving SSL. Obviously this isn't sufficient or advisable for production, so you'll want to mount your real keys onto /etc/ssl/. If you name them "certs/ssl-cert-snakeoil.pem" and "private/ssl-cert-snakeoil.key", you'll be able to get by with the default config. Otherwise, you'll want to include a revised site definition. If you don't want to use SSL, you can avoid forwarding port 443 when launching the container (see below).

## Simple Examples ##

Assuming you have your content at /home/jdoe/mysite/, the below will be sufficient to serve it. Note that many Docker users encourage mounting data from a storage container, rather than directly from the filesyetem.

- "It works!": `docker run -p 80:80 -p 443:443 -d eboraas/apache` and browse to the host's IP address using http or https
- Serving actual content with SSL support: `docker run -p 80:80 -p 443:443 -v /home/jdoe/mysite/:/var/www/ -d eboraas/apache`
- ... without SSL support: `docker -p 80:80 -v /home/jdoe/mysite/:/var/www/ -d eboraas/apache`
- ... using non-standard ports: `docker -p 8080:80 -p 8443:443 -v /home/jdoe/mysite/:/var/www/ -d eboraas/apache`
