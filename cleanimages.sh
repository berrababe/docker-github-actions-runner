#!/bin/bash
LIST=$(docker ps -aq)
for runner in $LIST
do
  # docker exec -it $runner "docker stop $(docker ps -aq) && docker rm $(docker ps -aq) && docker rmi $(docker images -q)"
  docker exec -it $runner sh -c 'docker stop $(docker ps -aq)'
  docker exec -it $runner sh -c 'docker rm $(docker ps -aq)'
  docker exec -it $runner sh -c ' docker rmi $(docker images -q) --force'
done
