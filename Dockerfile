FROM        ubuntu:16.04

MAINTAINER  Duke Dai <duke.dai.007@gmail.com>

ENV         APP_HOME=/root/myapp \
            DATA_DIR=/root/myapp/data

WORKDIR     /root

RUN         mkdir installer
COPY        installer/* installer/
COPY        entrypoint.sh entrypoint.sh
COPY        silent.txt silent.txt

RUN         chmod 755 entrypoint.sh
RUN         chmod 755 installer/myapp.bin
RUN         /root/installer/myapp.bin -f /root/silent.txt
EXPOSE      3000 3001 3002 3003 3004 3005	
VOLUME      ["${DATA_DIR}"]
ENTRYPOINT  ["/root/entrypoint.sh"]


