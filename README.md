PRE REQUIREMENTS
================

1. Install [Docker](https://docs.docker.com/installation/)
2. Install [Docker Compose](https://docs.docker.com/compose/install/)

RUN CONTAINER
=============

    docker run -p 8111:8111 -v=`pwd`/.TeamCity:/root/.BuildServer alexanderilyin/docker-teamcity-server
    open http://`boot2docker ip`:8111/

