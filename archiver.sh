#!/bin/bash

#VARIABLES
SUDO='sudo'
DIR=$PWD #Save current directory
LOGDIR=/var/log #LOG Directory

$SUDO cp -r $LOGDIR $DIR/log_files && $SUDO chown -R $USER:$USER $DIR/log_files #Copy contents of log folder and set ownership to current user
cd $DIR/log_files && $SUDO find -L "$(pwd)" -type f | $SUDO xargs wc -lc > log_summary.txt #Create a file summary containing the number of lines and file size of each log
$SUDO chmod 444 -R $DIR/log_files/ #Change permission of all the log files to read-only for all owner types
cd /opt/ && $SUDO tar cvfz log_files.tar.gz $DIR/log_files/ && $SUDO chmod 555 log_files.tar.gz #Create a zip archive from the (log_files) folder and save it in /opt/ and everyone should have read and execute access to the archive.