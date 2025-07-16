#!/bin/bash

DOCKER=docker
DOCKER_COMPOSE=docker-compose

if command -v $DOCKER > /dev/null && command -v $DOCKER_COMPOSE > /dev/null

then
        echo "Docker and Docker Compose is already installed"
else
        sudo apt update && sudo apt install -y docker.io docker-compose

fi


