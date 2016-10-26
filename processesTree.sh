#!/bin/bash

#Question 1 for Assignment 2
#Draws a tree of the active processes showing their parent until it reaches the init daemon [systemd]

#for each process
#name
#print PID:
#PPID:
#STARTED:
#by:

#ps axo p,ppid,start,user
# --sort PID
#til it reaches init=1 and PPID=0
# --forest to construct tree


#for each i in ps list
#for each pid in i
# do pstree
#ps needs pid
#pstree displays processes in tree format startin from init
#-p shows pid
#pid of current bash is $$

#-npu (sort by number pid, display owner
