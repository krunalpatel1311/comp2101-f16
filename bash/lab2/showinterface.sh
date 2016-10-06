#!/bin/bash
#Create an array using the output of ifconfig which has the names of the network interfaces in it. 
#Use those names to extract the ip addresses of the interfaces, also using ifconfig output. 
#Also parse the output of route -n to display the ip address of the default gateway.

interfaces=(`ifconfig |grep '^[a-zA-Z]' |awk '{print $1}'`)


#echo "interfaces name found : ${interfaces[@]}"

declare -a ips

ips[0]=`ifconfig ${interfaces[0]} | grep 'inet addr' | sed -e 's/ *inet addr://' | sed -e 's/ .*//'`

ips[1]=`ifconfig ${interfaces[1]} | grep 'inet addr' | sed -e 's/ *inet addr://' | sed -e 's/ .*//'`

ips==($ip0 $ip1)

gatewayip=`route -n|grep '^0.0.0.0 '| awk '{print $2}'`

cat <<EOF
interfaces ${interfaces[0]} has ip address $ips[0]
interfaces ${interfaces[1]} has ip address ${ips[1]}

my gatewayip is $gatewayip

EOF