#!/bin/bash
docker-compose down -v
docker stop -qa $(docker container ls)
docker image rm fscontainer
docker build -t fscontainer .
docker-compose up
