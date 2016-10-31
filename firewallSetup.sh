#!/bin/bash

#Question 5 Assignment 2

#deletes all previous rules
iptables --flush INPUT
iptables --flush FORWARD
iptables --flush OUTPUT
