#!/bin/bash

#Question 4 for Assignment 2
#Loops through Queen's IP addresses starting from 130.15.0.0 until 130.15.255.255 and prints out all the IP addresses along with the names of all cs.queensu.ca subdomains

#figure out how to get IP addresses
#figure out how to get subdomains for ips

#tmpIPfile.txt=$(mktemp) ##why is it not recognizing the file???
echo "IP Addresses" >> tmpIPfile
#for ip in ips >> tmpIPfile #one on each line

#tmpSBfile.txt=$(mktemp) #not recognizing the file!!!!
echo "Subdomains" >> tmpSBfile
#add subdomains
#for sd in subdomains >> tmpSBfile #one on each line

#print ips and subdomains
paste tmpIPfile tmpSBfile

#remove temporary files
rm "$tmpIPfile"
rm "$tmpSBfile"
