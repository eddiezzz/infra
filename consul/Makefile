leader:
        rm -rf data/*
        mkdir -p data
        docker stack deploy -c leader_compose.yml leader
down:
        docker stack rm leader agent

id=$(shell docker ps --filter="name=leader" -q)
info:
        docker exec $(id) consul info
members:
        docker exec $(id) consul members
