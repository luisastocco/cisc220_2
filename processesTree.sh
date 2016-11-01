#!/bin/bash

#Question 1 for Assignment 2
#Draws a tree of the active processes showing their parent until it reaches the init daemon [systemd]
#Just brainstorming, i got all the commands right, just need to write a code with them now
#Feel free to use it to do your own code if you have time to before me!!!

#for each active process:
#name:
#print PID:
#PPID:
#STARTED:
#by:
pstree > pstree.txt
while read p; do
   echo $p;# echo -n ps axo pid,ppid,start,user;

done<pstree.txt
#ps axo p,ppid,start,user
# --sort PID
#til it reaches init=1 and PPID=0
# --forest to construct tree

#or for constructing tree:
#for each i in ps list
#for each pid in i
#pstree
#pstree displays processes in tree format startin from init
#-p shows pid
#pid of current bash is $$
#-npu (sort pid by number, display owner
