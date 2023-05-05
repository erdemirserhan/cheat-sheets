# kill all running containers
docker kill $(docker ps -q)

# delete all stopped containers
docker rm $(docker ps -a -q)

# get shell in docker-container
docker exec -i -t /bin/bash

# clean up and delete all unused container images
docker image prune -a

# only clean up container images that have been created over 24 hours ago
docker image prune -a --filter "=24h"
