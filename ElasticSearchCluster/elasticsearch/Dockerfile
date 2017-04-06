FROM ubuntu:16.04
MAINTAINER Albert Costas acostasg@uoc.edu

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm-256color
ENV userdeb elasticsearch
ENV userid 1000
ENV groupdeb elasticsearch
ENV groupid 1000
ENV ES_JAVA_OPTS '-Xms1g -Xmx1g'

#Configure TimeZone
RUN ln -sf /usr/share/zoneinfo/Europe/Madrid /etc/localtime

# Add user for run elasticsearch
RUN groupadd --gid $groupid $groupdeb; useradd -m -b /home --uid $userid --gid $groupid --shell /bin/bash $userdeb
RUN chmod +rx /etc/resolv.conf
ENV HOME /home/$userdeb/

# Install dependencies
RUN 	apt-get update && \
	apt-get install -y \
	  openjdk-8-jre \
	  apt-transport-https \
	  wget \
	  vim

ENV ES_SKIP_SET_KERNEL_PARAMETERS=true
RUN	cd && \
	wget https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/deb/elasticsearch/2.4.4/elasticsearch-2.4.4.deb && \
	dpkg -i elasticsearch-2.4.4.deb

# Configure ElasticSearch
RUN mkdir -p /usr/share/elasticsearch/data \
	     /usr/share/elasticsearch/logs \
	     /usr/share/elasticsearch/config \
	     /usr/share/elasticsearch/config/scripts
RUN chown -R $userdeb:$groupdeb \
             /usr/share/elasticsearch/data \
             /usr/share/elasticsearch/logs \
             /usr/share/elasticsearch/config \
	     /usr/share/elasticsearch/config/scripts

RUN chown -R $userdeb:$groupdeb /usr/share/elasticsearch/config/

USER $userdeb
EXPOSE 9200-9300

CMD ["/usr/share/elasticsearch/bin/elasticsearch"]
