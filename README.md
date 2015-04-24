PRE REQUIREMENTS
================

1. Install [Docker](https://docs.docker.com/installation/)
2. Install [Docker Compose](https://docs.docker.com/compose/install/)

RUN TEAMCITY CONTAINER ONLY
===========================

Will start TeamCity container only, you will be able to use build database.

    docker run -p 8111:8111 -v=`pwd`/.TeamCity:/root/.BuildServer alexanderilyin/docker-teamcity-server
    open http://`boot2docker ip`:8111/

RUN ALL
=======

 Will start TeamCity Server, MySQL and 3 Teamcity Agents

    docker-compose up
    docker-compose scale agent=3

