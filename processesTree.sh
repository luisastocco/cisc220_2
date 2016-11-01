#!/bin/bash

#Question 1 for Assignment 2
#Draws a tree of the active processes showing their parent until it reaches the init daemon [systemd]

#Views processes running on the system owned by any user and outputs the ip, parent ip, start time and who owns it, in a tree form, sorted by descending pid (since init=1 and all others=0, it starts at the init)
ps axo pid,ppid,time,user --forest --sort=-pid #we couldn't figure out how to format it to print the ex[ected words befoe each piece of information
