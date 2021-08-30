#!/bin/bash
docker rmi -f registry.gitlab.com/evo_g/elk_docker/elastic:latest
docker rmi -f centos7/elastic:ver1
docker system prune -f
docker pull registry.gitlab.com/evo_g/elk_docker/elastic:latest
docker tag registry.gitlab.com/evo_g/elk_docker/elastic:latest centos7/elastic:ver1
