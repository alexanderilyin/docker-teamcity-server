PRE REQUIREMENTS
================

1. Install [Docker](https://docs.docker.com/installation/)
2. Install [Docker Compose](https://docs.docker.com/compose/install/)

DOCKER
======

Will start TeamCity container only, you will be able to use build database.

    docker run -p 8111:8111 -v=`pwd`/.TeamCity:/root/.BuildServer alexanderilyin/docker-teamcity-server
    open http://`boot2docker ip`:8111/

DOCKER COMPOSE
==============

Will start TeamCity Server, MySQL and 3 Teamcity Agents

    docker-compose up
    
Please note that `docker-compose scale ...` temporary not supported.

TODO
====

1. HTTPS
    
SALT
====

    teamcity-server-image:
      docker.pulled:
        - name: alexanderilyin/docker-teamcity-server
        - tag: latest
        - force: true
    
    teamcity-server-container:
      docker.installed:
        - image: alexanderilyin/docker-teamcity-server
        - tag: latest
        - watch:
          - docker: teamcity-server-image
    
    teamcity-server:
      docker.running:
        - container: teamcity-server-container
        - image: alexanderilyin/docker-teamcity-server
        - ports:
          - 8111: 8111
        - volumes:
          - /root/.BuildServer: /root/.BuildServer
        - watch:
          - docker: teamcity-server-container

