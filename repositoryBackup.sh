#!/bin/bash

#Luisa Aimoli 10169687
#Braedan Robinson 10188414
#Question 5 Assignment 2
#Question 2 for Assignment 2
#**Did not know how to redirect output when pushing the files**
#Assumes the user's remote repository has already been pulled to the local repository
#Backs up all the files in the repository except previous backup files
#Also pushes that backup to github repository
#Cron job command is in the following two lines:
#crontab -e vim
#00 01 * * * >> backsupLog #maybe decompress before sending to file?

#Stores arguments in variables
folder=$1
gitURL=$2
gitUser=$3
gitPass=$4
date=$(date +%Y%m%d%H)

#Stores file name to back up
backup=backup$date.tgz
#compress all files into backup excluding any previous backup files
tar czvf $backup $1 --exclude=backup*.tgz >> backupsLog 
echo Backup ${backup} created successfully!

#moves the backup created, into git local repository folder given by user
#changes directory to the local repository for push
mv $backup $folder
cd $folder

#commit backup to local repository
git add $backup >> backupLog
git commit -m $backup >> backupLog
echo Backup ${backup} committed to the local git repository

#push backup to remote repository
git push https://${gitUser}:${gitPass}@${gitURL} --all >> backupLog
echo Backup ${backup} pushed to the remote git repository $folder
