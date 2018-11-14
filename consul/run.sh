#!/bin/sh
docker stop consul
docker rm consul 

docker run --name consul -d --net=host -e CONSUL_BIND_INTERFACE=eth0 consul:0.8.3 agent -dev
#consul agent -dev
