#!/bin/bash
apt-get install net-tools
#ip_address=`/sbin/ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}'`
ip_address=`/sbin/ip route|grep default| awk '{print $3}'`
#echo $ip_address
mv /etc/haproxy/haproxy.cfg /etc/haproxy/haproxy_old.cfg 
#cat haproxy.cfg | grep 'localhost'
sed "s/localhost/$ip_address/g" /etc/haproxy/haproxy_old.cfg > /etc/haproxy/haproxy.cfg
#cat haproxy_1.cfg | grep $ip_address
"/usr/sbin/haproxy" "-db"  "-f"  "/etc/haproxy/haproxy.cfg"
