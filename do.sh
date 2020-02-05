#!/bin/bash

#This file is not mandatory for the container but you can use it if you wish.
#stop all containers and light up a fscontainer container

docker-compose down -v
docker stop -qa $(docker container ls)
docker image rm fscontainer
docker build -t fscontainer .
docker-compose up
