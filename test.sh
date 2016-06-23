#!/bin/bash -x


docker stop myapp.dukedai.com
docker rm myapp.dukedai.com
docker rmi myapp:latest
docker build -t myapp:latest .

#docker create --hostname myapp.dukedai.com --name myapp.dukedai.com --net=host -P myapp:latest
#docker create --hostname myapp.dukedai.com --name myapp.dukedai.com --net=bridge -P myapp:latest
#docker create --name myapp.dukedai.com --net=host -P --privileged myapp:latest
#net default/host/bridge are all OK, publish 3003 for admin and 3005 for rmi registry, no way to skip 3004
docker create --name myapp.dukedai.com --net=host -p 3000-3005:3000-3005 myapp:latest
docker start myapp.dukedai.com
docker exec -ti myapp.dukedai.com /bin/bash
