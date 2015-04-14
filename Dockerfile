FROM alexanderilyin/docker-java

MAINTAINER Alexander Ilyin <ailyin@anchorfree.com>

ENV TEAMCITY_SERVER_MEM_OPTS '-Xmx750m -XX:MaxPermSize=270m'
ENV TEAMCITY_SERVER_OPTS '-Dteamcity.git.fetch.separate.process=false'

RUN yum install --assumeyes tar
RUN yum install --assumeyes which
RUN curl -LOv http://download.jetbrains.com/teamcity/TeamCity-9.0.3.tar.gz
RUN tar xvf TeamCity-9.0.3.tar.gz -C /opt/
RUN rm -fv TeamCity-9.0.3.tar.gz

ENTRYPOINT JAVA_HOME=/usr/lib/jvm/jre-1.7.0-openjdk.x86_64 /opt/TeamCity/bin/runAll.sh start && tail -F /opt/TeamCity/logs/teamcity-server.log

EXPOSE 8111
