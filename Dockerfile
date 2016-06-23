FROM        ubuntu:16.04

MAINTAINER  Duke Dai <duke.dai@emc.com>

ENV         DOCUMENTUM=/root/documentum \
            DATA_DIR=/root/documentum/data

WORKDIR     /root

RUN         mkdir installer
COPY        installer/* installer/
COPY        entrypoint.sh entrypoint.sh
COPY        silent.txt silent.txt

RUN         chmod 755 entrypoint.sh
RUN         chmod 755 installer/fs2Setup.bin
RUN         /root/installer/fs2Setup.bin -f /root/silent.txt
EXPOSE      3000 3001 3002 3003 3004 3005	
VOLUME      ["${DATA_DIR}"]
ENTRYPOINT  ["/root/entrypoint.sh"]


