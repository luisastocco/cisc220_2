i#!/bin/bash

#Question 5 Assignment 2
#Adds firewall rules
#PS. First two functions write directly to files!

#Deletes all previous rules in a table
delete () {
sudo iptables -F INPUT
sudo iptables -F FORWARD
sudo iptables -F OUTPUT
}

#Enable ssh only from computers in the range and netmask /16 by blocking access to all IPS and then allowing it to the range
#DANGER!!! Hi, we didn't use iptables for this one!!
sshInRange () {
sudo echo "sshd : ALL" >> /etc/hosts.deny ; sudo echo "sshd : 130.15.{0..255}.{0..255}/16" >> /etc/hosts.allow
}

#Enable ssh from computers in any private network
#DANGER!!!! As well as this one!
sshInPrivate () {
for ip in *.*.*.*
do
	if [[ $ip==192.168.{0..255.{0..255} || $ip==172.{16..31}.{0..255}.{0..255} || $ip==10.{0..255}.{0..255}.{0..255} ]] ; then
	sudo echo "sshd : $ip" >> /etc/hosts.allow
	fi
done
}

#Enable http and https from any IP
httpHTTPS () {
for ip in *.*.*.*
do
	sudo iptable -A INPUT -p TCP --dport 80 -s $ip -j ACCEPT #http connection = port 80
	sudo iptable -A INPUT -p TCP --dport 443 -s $ip -j ACCEPT #https connection = port 443
done
}

#Drop any other incoming tcp traffic
droptcp () {
for ip in *.*.*.*
do
	sudo iptable -A INPUT -p TCP -s $ip -j DROP
done
}

#Block connecting from your computer to any IP outside the range [netmask /16] 
dropNotRange () {
for ip in *.*.*.*
do 
	echo 130.15.{0..255}.{0..255}/16 | grep -q "\<$ip\>" && continue 
	sudo iptables -A INPUT -d "$ip" -j DROP
done
}

#Only allow IP 130.15.100.100 to connect to my mysql running on port 3306
mysql () {
for ip in *.*.*.*
do
	if [[ $ip==130.15.100.100 ]] ; then
		sudo iptables -A INPUT -p TCP -s 130.15.100.100 --dport 3306 -j ACCEPT #allow connection to mysql connection = port 3306
	else
		sudo iptables -A INPUT -p TCP -s $ip --dport 3306 -j DROP #block connection
	fi
done
}

#Drop outgoing ssh traffic to all other computers
dropssh () {
for ip in *.*.*.*
do
	sudo iptable -A OUTPUT -p TCP -d $ip --sport 22 -j DROP #ssh connection = port 22
done
}

#Can I still ssh the VM from my host machine? Why? If I can't, how to fix it?
#No, because my VM IP is 192.168.2.120, therefore outside the range in function dropNotRange where everything outside the range specified was blocked from connecting to my computer. The solution would be to write to the iptable and allow port 22 (ssh) for the VM IP.
