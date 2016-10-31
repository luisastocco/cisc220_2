#!/bin/bash

#Question 5 Assignment 2
#Adds firewall rules

#Deletes all previous rules in a table
iptables --flush INPUT
iptables --flush FORWARD
iptables --flush OUTPUT

#Enable ssh only from computers in the range and netmask /16
#DANGER!!! Hi, make sure you've deleted this before running so it doesn't actually write to the file forever!
echo "sshd : ALL" >> /etc/hosts.deny ; echo "sshd : 130.15.{0..255}.{0..255}/16" >> /etc/hosts.allow

#Enable ssh from computers in any private network
for ip in *.*.*.*
do
	if [[ $ip==192.168.{0..255.{0..255} || $ip==172.{16..31}.{0..255}.{0..255} || $ip==10.{0..255}.{0..255}.{0..255} ]] ; then
	echo "sshd : $ip" >> /etc/hosts.allow #not sure if i can write onto this file like this
	fi
done

#Enable http and https from any IP

#Drop any other incoming tcp traffic

#Block connecting from your computer to any IP outside the range 
for ip in *.*.*.*
do 
	echo 130.15.{0..255}.{0..255} | grep -q "\<$ip\>" && continue 
	iptables -A INPUT -s "$ip" -j DROP
done

#Only allow IP 130.15.100.100 to connect to your mysql running on port 3306
sudo iptables -A INPUT -p mysql --dport 3306 -s 130.15.100.100 -j ACCEPT

#Drop outgoing ssh traffic to all other computer

#Question
