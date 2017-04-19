FROM ubuntu:16.04
MAINTAINER Albert Costas acostasg@uoc.edu

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm-256color

#Configure TimeZone
RUN ln -sf /usr/share/zoneinfo/Europe/Madrid /etc/localtime

# Install dependences for kibana
RUN apt-get update && \
	apt-get -y install \
	  wget \
	  apt-transport-https

# Add kibana repo
RUN wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add - && \
	echo "deb https://artifacts.elastic.co/packages/5.x/apt stable main" | tee -a /etc/apt/sources.list.d/elastic-5.x.list && \
	apt-get update

# Install kibana
RUN apt-get install -y \
	  kibana=5.0.1

# confgigure kibana
ADD /config/kibana.yml /etc/kibana/kibana.yml
#RUN /usr/share/kibana/bin/kibana-plugin install x-pack

EXPOSE 5601

CMD ["/usr/share/kibana/bin/kibana"]