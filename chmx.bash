#! /bin/bash
####
#chmx takes a file or files as arguments and makes them excutable to all users
#Author: Anzhelika Nabozhina
#Date Created: 07/11/2016
####
arg=$@ #Takes any number of arguments
FILE_NOT_EXIST=2
ARG_IS_DIR=3

#Checks arguments were given, and if not then prints an error message
if [ $# -lt 1 ]
then
	echo "Command needs arguments."
	echo "Usage: $0 filename filename filename ... "
	exit 1
fi

#Checks if arguments given dont exist or if they are a directory. Processes regular files.
for i in $arg
do
	if [ ! -e $i ]
	then
		echo "$i does not exist"
	elif [ -d $i ]
	then
		echo "$i is a directory. Please enter files names only."
	elif [ -f $i ]
	then
		chmod 755 $i
	fi
done

#Print files which are now executable
for i in $arg
do
	if [ -x $i ]
	then
		echo "$i is now executable to all users."
	fi
done

exit 0
