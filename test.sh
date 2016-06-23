#!/bin/bash -x


docker stop fs2.test.com
docker rm fs2.test.com
docker rmi fs2:latest
docker build -t fs2:latest .

#docker create --hostname fs2.test.com --name fs2.test.com --net=host -P fs2:latest
#docker create --hostname fs2.test.com --name fs2.test.com --net=bridge -P fs2:latest
#docker create --name fs2.test.com --net=host -P --privileged fs2:latest
#net default/host/bridge are all OK, publish 3003 for admin and 3005 for rmi registry, no way to skip 3004
docker create --name fs2.test.com --net=host -p 3000-3005:3000-3005 fs2:latest
docker start fs2.test.com
docker exec -ti fs2.test.com /bin/bash
