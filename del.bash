#!/bin/bash
####
#Description: this command moves the specified file into a .waste directory. If .waste does not yet
#exist, it creates the directory
#Author: Anzhelika Nabozhina
#Date Created: 20/11/16
####
arg=$@
NOT_EXIST=2
ARG_IS_DIR=3
#If waste bin doesn not exist, create the .waste directory.
if [ ! -d ~/.waste ]
then
	mkdir -p ~/.waste
	echo "A waste directory was created."
fi
#Checks arguments were given.
if [ $# -lt 1 ]
then
	echo "Command needs arguments."
	echo "Usage: $0 file"
	exit 1
fi
#Checks each argument is a file, then moves it to waste bin.
for i in $arg
do
	if [ ! -e $i ]
	then
		echo "$i does not exist."
	elif [ -d $i ]
	then
		echo "$i is a directory. Give file names only."
	elif [ -f $i ]
	then
		mv $i ~/.waste/$i
		echo "$i was moved to waste bin."
	fi
done

exit 0
