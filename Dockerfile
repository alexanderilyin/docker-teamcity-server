FROM java

MAINTAINER Alexander Ilyin <alexander@ilyin.eu>

ENV TEAMCITY_DATA_PATH /root/.BuildServer
ENV TEAMCITY_SERVER_MEM_OPTS -Xmx750m -XX:MaxPermSize=270m
ENV TEAMCITY_SERVER_OPTS -Dteamcity.git.fetch.separate.process=false
ENV TEAMCITY_VERSION 9.0.3

VOLUME ${TEAMCITY_DATA_PATH}

EXPOSE 8111

ADD http://download.jetbrains.com/teamcity/TeamCity-${TEAMCITY_VERSION}.tar.gz /opt/TeamCity-${TEAMCITY_VERSION}.tar.gz
RUN tar xvf /opt/TeamCity-${TEAMCITY_VERSION}.tar.gz -C /opt/
RUN rm -fv /opt/TeamCity-${TEAMCITY_VERSION}.tar.gz

CMD /opt/TeamCity/bin/teamcity-server.sh run
