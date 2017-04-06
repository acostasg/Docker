FROM tomcat:8-jre8

ADD tomcat/tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml

# Deploy in root folder
RUN rm -rf /usr/local/tomcat/webapps/ROOT/
ADD POPmessageApi*.war /usr/local/tomcat/webapps/ROOT.war

# Fix timezone to spain
ENV TZ=Europe/Madrid
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ENV CATALINA_OPTS "$JAVA_OPTS" \
        "-Xms1g -Xmx3g" \
        "-Duser.timezone=Europe/Madrid" \
        "-Xdebug -Xrunjdwp:transport=dt_socket,address=62911,server=y,suspend=n" \
        "-Dcom.sun.management.jmxremote=" \
        "-Dcom.sun.management.jmxremote.port=1898" \
        "-Dcom.sun.management.jmxremote.rmi.port=1898" \
        "-Dcom.sun.management.jmxremote.ssl=false" \
        "-Dcom.sun.management.jmxremote.authenticate=false" \
        "-Djava.net.preferIPv4Stack=true" \
        "-Djava.rmi.server.hostname=localhost"

# SSL certificates and config
COPY tomcat/server.xml conf/server.xml
COPY ssl/mycert1.p12 conf/POPmessage.p12

##### UPDATE & Install VIM
#RUN apt-get -y update && \
#    apt-get -y install vim

EXPOSE 1898
CMD ["catalina.sh", "run"]
