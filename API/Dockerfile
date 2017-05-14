FROM ubuntu:16.04
MAINTAINER Albert Costas acostasg@uoc.edu

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm-256color
ENV userdeb popmessage
ENV userid 1000
ENV groupdeb popmessage
ENV groupid 1000
ENV ES_JAVA_OPTS '-Xms1g -Xmx1g'

#Configure TimeZone
RUN ln -sf /usr/share/zoneinfo/Europe/Madrid /etc/localtime

# Add user for run elasticsearch
RUN groupadd --gid $groupid $groupdeb; useradd -m -b /home --uid $userid --gid $groupid --shell /bin/bash $userdeb
RUN chmod +rx /etc/resolv.conf
ENV HOME /home/$userdeb/

# Install Java.
RUN \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  apt-get update && \
  apt-get install -y python-software-properties && \
  apt-get install -y software-properties-common && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer


# Deploy in root folder
RUN rm -rf $HOME/POPmessage
RUN mkdir $HOME/POPmessage
COPY /jar $HOME/POPmessage/


EXPOSE 127.0.0.1:8080:8080
CMD ["/usr/bin/java", "-jar", "/home/popmessage/POPmessage/POPmessage.jar"]

