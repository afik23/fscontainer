#!/bin/bash

#light up the container
docker-compose down -v
docker stop -qa $(docker container ls)
docker image rm fscontainer
docker build -t fscontainer .
docker-compose up
