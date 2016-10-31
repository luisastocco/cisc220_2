#!/bin/bash

#For Windows. Command for finding corresponding IPs and Domains presented in class does not work iin Linux
#Question 4 for Assignment 2
#Loops through Queen's IP addresses starting from 130.15.0.0 until 130.15.255.255 and prints out all the IP addresses along with the names of all cs.queensu.ca subdomains

IP_file="/tmp/ip_file" #temporary file with IP addresses
SD_file="/tmp/subdomain" #temporary file with IP's subdomains

echo "IP Address" >> IP_file
echo "Subdomains" >> SD_file

for ip in 130.15.{0..255}.{0.255}
do
	echo ip >> IP_file ; @nslookup ip | echo >> SD_file
done

#paste command adds IP and Domain files together and prints them separated by TABs
paste IP_file SD_file ##why is it not recognizing the paste command???

#remove temporary files
rm "IP_file"
rm "SD_file"
