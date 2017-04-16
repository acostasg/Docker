FROM phusion/baseimage:0.9.16
MAINTAINER Albert Costas <acostasg@uoc.edu>
ENV DEBIAN_FRONTEND noninteractive

# install the required packages
RUN apt-get update && sudo apt-get install -y \
      build-essential \
      apache2 \
      libapache2-mod-proxy-html \
      libxml2-dev

# enable the proxy modules
RUN a2enmod proxy \
	proxy_http \
	proxy_ajp \
	rewrite \
	deflate \
	headers \
	proxy_connect \
        ssl

#Copy config
ADD proxy-conf.conf /etc/apache2/sites-available/
RUN a2ensite proxy-conf.conf

#Copy SSL cert
ADD certs/POPmessage.crt /etc/apache2/ssl/POPmessage.crt
ADD certs/POPmessage.key /etc/apache2/ssl/POPmessage.key
ADD certs/bundle.crt /etc/apache2/ssl/bundle.crt
ADD certs/aws-client-cert.pem /etc/apache2/ssl/aws-client-cert.pem

EXPOSE 5000
CMD ["apachectl", "-D", "FOREGROUND"]
