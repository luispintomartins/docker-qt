#!/bin/bash

# See: https://github.com/docker/docker/issues/3182

# Delete 'exited' containers
docker rm -v $(docker ps -a -q -f status=exited)
# Delete 'dangling' images
docker rmi $(docker images -f "dangling=true" -q)
# Delete 'dangling' volumes
docker volume rm $(docker volume ls -qf dangling=true)