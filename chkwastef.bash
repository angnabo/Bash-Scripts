#! /bin/bash
####
#Description: chkwastef takes a file and lists the first few lines of that file
#and asks if the file can be permanently deleted.
#Author: Anzhelika Nabozhina
#Date Created: 17/11/16
####
arg=$1
file=~/.waste/$arg
NO_WASTE_DIR=2
FILE_NOT_EXIST=3
#Check argument was given.
if [ $# -ne 1 ]
then
	echo "Command needs an argument."
	echo "Usage: $0 filename"
	exit 1
fi
#Check if waste bin exists.
if [ ! -d ~/.waste ]
then
	echo "Waste bin has not been created."
	exit $NO_WASTE_DIR
fi
#check if file exists and is a file. If both are true, lists first four lines of file.
if [ -e $file ] && [ -f $file ]
then
	head -4 $file
elif [ ! -e $file ] || [ ! -f $file ]
then
	echo "$arg is not a suitable type or does not exist."
	exit $FILE_NOT_EXIST
else
	echo "Error."
	exit 4
fi
#Take user input if file is to be deleted.
echo "Delete $arg? Type Y/N."
read input
u_input=${input^^}
if [ $u_input == "Y" ]
then
	rm $file
	echo "$arg was deleted."
else
	echo "$arg was not deleted."
fi

exit 0
