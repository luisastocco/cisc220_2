#!/bin/bash

#For Windows. Command for finding corresponding IPs and Domains presented in class does not work iin Linux
#Question 4 for Assignment 2
#Loops through Queen's IP addresses starting from 130.15.0.0 until 130.15.255.255 and prints out all the IP addresses along with the names of all cs.queensu.ca subdomains

#Writes onto/creates files to store the IPS and subdomains
echo "IP Addresses" >> IP_file.txt
echo "Subdomains" >> SD_file.txt
echo "nslookup output" >> output_file.txt

#Loops through range of ips
for ip in 130.15.{0..255}.{0..255}
do
	#Adds each IP to IP file and each corresponding subdomain to subdomain file
	echo $ip >> IP_file.txt ; nslookup $ip >> output_file.txt
	lineNumber=$(grep -n $ip output_file.txt)" #finds IP in the output file and gets the line number
	#reads the line, prints second column (separated by tab) of the line (name = ...), prints the name of the subdomain, adds subdomain to subdomain file
	sed '$lineNumber1;d' output_file.txt | awk -F "\t" '{print $2}' | awk -F " " '{print $3}' >> SD_file
done

#Adds IP and Domain files together and prints them separated by TABs
paste IP_file.txt SD_file.txt ##why is it not recognizing the paste command???

