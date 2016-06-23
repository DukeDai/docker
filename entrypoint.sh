#!/bin/sh
echo "running entrypoint.sh"
#local_addr=$(hostname -i)
local_addr=$(hostname)
sed -i -e "s/xtrim.server.rmi.registryHost=.*$/xtrim.server.rmi.registryHost=${local_addr}/" /root/documentum/fs2/www/docs/conf/server.conf
cd /root/documentum/fs2/bin
echo "starting server"
./aOServer &
echo $?
echo "started server"
sleep 30
echo "starting admin"
cd /root/documentum/fs2/bin
./aOAdmin & 
echo $?
echo "started admin"
echo "done"

tail -f /dev/null
