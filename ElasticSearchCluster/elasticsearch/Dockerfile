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
RUN apt-get update && \
	apt-get install -y \
	  openjdk-8-jre \
	  apt-transport-https \
	  wget \
	  vim

RUN	cd && \
	wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-5.0.1.deb && \
	dpkg -i elasticsearch-5.0.1.deb

# Configure ElasticSearch
RUN mkdir -p /usr/share/elasticsearch/data \
		/usr/share/elasticsearch/logs \
		/usr/share/elasticsearch/config \
		/usr/share/elasticsearch/config/scripts && \
	chown -R $userdeb:$groupdeb /usr/share/elasticsearch/data \
                /usr/share/elasticsearch/logs \
                /usr/share/elasticsearch/config \
		/usr/share/elasticsearch/config/scripts

# Configure ElasticSearch
RUN echo "vm.max_map_count=262144" >> /etc/sysctl.conf

#ADD logging.yml /usr/share/elasticsearch/config/logging.yml
ADD /config/log4j2.properties /usr/share/elasticsearch/config/log4j2.properties
ADD /config/elasticsearch.yml /usr/share/elasticsearch/config/elasticsearch.yml
RUN chown -R $userdeb:$groupdeb /usr/share/elasticsearch/config/

# Install elasticsearch-x-pack plugin
#RUN /usr/share/elasticsearch/bin/elasticsearch-plugin install x-pack

USER $userdeb
EXPOSE 9200-9300

CMD ["/usr/share/elasticsearch/bin/elasticsearch"]
