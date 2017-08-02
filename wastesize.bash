#!/bin/bash
####
#Description: wastesize reports the number of files in the waste bin (.waste directory)
#Author: Anzhelika Nabozhina
#Date created: 17/11/16
####
#Finding all the files in the directory and counting how many of them there is.
waste_size=`find ~/.waste -type f | wc -l`
NO_WASTE_DIR=2

#Checks if waste bin directory exists.
if [ ! -d ~/.waste ]
then
	echo ".waste directory does not yet exist"
	exit $NO_WASTE_DIR
fi
#Reports the number of files in the waste bin.
if [ $waste_size -eq 0 ]
then
	echo "Waste bin is empty."
else
	echo "The number of files in the waste bin is: $waste_size"
fi

exit 0


