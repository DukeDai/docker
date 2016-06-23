#!/bin/sh
echo "running entrypoint.sh"
#local_addr=$(hostname -i)
local_addr=$(hostname)
sed -i -e "s/com.dukedai.myapp.registryHost=.*$/com.dukedai.myapp.registryHost=${local_addr}/" /root/myapp/conf/server.conf
cd /root/myapp/bin
echo "starting server"
./myServer &
echo $?
echo "started server"
sleep 30
echo "starting admin"
cd /root/myapp/bin
./myAdmin & 
echo $?
echo "started admin"
echo "done"

#keep container alive
tail -f /dev/null
