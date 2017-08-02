#!/bin/bash
####
#Description: Command that takes a pattern of characters as an argument and
#finds any file names from waste bin directory that match or contain the supplied characters.
#Author:Anzhelika Nabozhina
#Date Created: 20/11/16
####
arg=$1
NO_WASTE_DIR=2
#Checks if pattern was given.
if [ $# -ne 1 ]
then
	echo "Usage: $0 pattern"
	exit 1
fi
#Checks if waste bin directory exists.
if [ ! -d ~/.waste ]
then
	echo "Waste bin directory does not exist."
	exit $NO_WASTE_DIR
fi

#Find all files what match given pattern.
echo "Files in waste that contain $ARG:"

find ~/.waste/ -type f -name \*$arg\*

exit 0


