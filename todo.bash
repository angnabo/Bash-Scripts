#!/bin/bash
####
#Description: todo.bash is a todo list tool, that will record the tasks for you, display them, and allow you remove them when they are complete.
#It has 3 options: -list, -write and -done. To add a task simply choose -write and follow with the description of the task.
#To list all tasks choose -list.
#To complete a task, use -done followed by the number of that task.
#Author: Anzhelika Nabozhina
#Date Created:02/12/16
####
USAGE="USAGE: $0 [-write/-list/-done] [string/line number]"
EMPTY=2

string="${@:2}" #assigns all args except the option to a string variable for the -write option

#checks that correct n of arguments was given
if [ $# -lt 1 ]
then
	echo $USAGE
	exit 1
fi
#creates a todolist if there isn't one already
if [ ! -e todolist.txt ]
then
	touch todolist.txt
	echo "todolist.txt was created."
fi

#counts how many lines the file has for the -list option
filelines=`cat todolist.txt | wc -l`

#Lists all tasks. Creates a numbered column file based on how many lines the todolist has.
#This makes sure that even after a task has been removed the numbers for the tasks stay in the right order.
if [ $1 == "-list" ] && [ -s todolist.txt ] #checks todolist is not empty
then
	for ((i=0; i<${filelines}; i++)) #for every line in todolist a number is added to the number_column file
	do
		one=1
        	column=$(($i + $one))
		echo "$column." >> number_column #writes the numbers into a temporary file
	done
	paste number_column todolist.txt #displays the numbers and tasks together
	rm number_column
	exit 0
elif [ $1 == "-list" ] && [ ! -s todolist.txt ] #if todolist is empty echo that it's empty
then
	echo "todolist.txt is empty."
	exit $EMPTY
fi

#done option for checking off a completed task
if [ $1 == "-done" ] && [ -s todolist.txt ]
then
	if [[ $2 == [0-9] ]]
	then
		sed -e "$2d" todolist.txt > temp_file #delete the specified line n and copy to a temporary file
		cat temp_file > todolist.txt #copied back into the todolist
		rm temp_file
		exit 0
	else
		echo "Please enter the task number you want to delete."
		exit 2
	fi
elif [ $1 == "-done" ] && [ ! -s todolist.txt ]
then
	echo "todolist.txt is empty."
	exit $EMPTY
fi

#write option to add a task
if [ $1 == "-write" ]
then
	echo "$string" >> todolist.txt
	exit 0
fi

