#!/bin/bash
####
#Description: lshead will list the first few lines of all files in a directory. Allows options to list the first n lines or last n lines.
#Alternatively if just a directory name is given, output will be the default first 5 lines of every file.
#Author: Anzhelika Nabozhina
#Date created: 21/11/16
####
directory=""
lines=$2
head_or_tail=$1
USAGE="USAGE: $0 -head/-tail -n directory"
#Checks if correct number of arguments given
if [ $# -gt 3 ]
then
	echo $USAGE
	exit 1
elif [ $# -lt 1 ]
then
	echo $USAGE
	exit 1
fi
#Assigns variables according to how many arguments was given.
if [ -d $1 ] && [ $# -eq 1 ]
then
	directory=$1
elif [ $# -eq 3 ] && [ $1 == "-head" ] || [ $1 == "-tail" ]
then
	head_or_tail=$1
	lines=$2
	directory=$3
else
	echo "Invalid arguments."
	exit 1
fi
#Gets files path in order to list contents of file
files=`find $directory`
#Outputs the files first or last n lines depending on the arguments given.
for file in $files
do
	if [ -f $file ]
	then
		if [ $head_or_tail == "-head" ]
		then
			head $lines $file
		elif [ $head_or_tail == "-tail" ]
		then
			tail $lines $file
		elif [ $# -eq 1 ]
		then
			head -5 $file
		else
			echo "Something went wrong."
		fi
	fi
done
exit 0
