#!/bin/bash

#Question 2 for Assignment 2
#Backs up all the file sin the repository except previous backup files
#Also pushes that backup to github repository
#Cron job command is in the following two lines:
#crontab -e vim
#00 01 * * * >> backsupLog #maybe decompress before sending to file?

#input for path
read -p-r "Enter the path to the repository folder, hit return to end:" path
#input for url
read -p-r "Enter the github URL, hit return to end:" url
#input for username
read -p "Enter your github username, hit return to end:" username
#input for password
read -p "Enter your github password, hit return to end:" -s pass

#if not a backup file
#access all files in directory and sub-directories, pipe to tar commans
#access current date and time
#backup=backupYYYYMMDDHH.tgz
#compress all files into backup
| tar czvf backup
echo Back up ${backup} created successfully!

#commit backup to local repository
git commit -m 'something' --all #?
echo Backup ${backup} commmitted to the local git repository

#push backup to remote repository
git push url -all #?
#get repository name from url=repository
#dirname command gets directory name off a path
echo Backup ${backup} pushed to the remote git repository ${repository}
