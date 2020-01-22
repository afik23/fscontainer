#!/bin/bash
docker image rm fscontainer
docker build -t fscontainer .
docker run -it fscontainer bash
