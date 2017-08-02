#!/bin/bash
####
#Description: masher.bash accepts a string argument and counts the number of letters, digits and special characters
#that were entered. It loops asking fofr more input until a control character has been entered.
#The script stops when a control character(*) has been entered anywhere in the string.
#Author: Anzhelika Nabozhina
#Date created:22/11/16
####
letters=0
numbers=0
non_alphanumeric=0

USAGE=$'masher.bash accepts a string of any characters and an asterisk(*) when you wish to exit.\nEntering * anywhere will stop the command.'
echo "$USAGE"

string=$1

#executes the loop while user hasn't yet entered a control character
while [[ $string != [*] ]]
do
	for (( i=0; i<${#string}; i++)) #getting the length of the string and going through every single character one by one
	do
        	char=${string:$i:1} #:1 gets substring of the string, in this case each character
        	if [[ $char == [a-zA-Z] ]] #checks if it's a letter
        	then
        	        ((letters+=1))
        	elif [[ $char == [0-9] ]] #checks if it's a number
        	then
        	        ((numbers+=1))
        	elif [[ $char == [^a-zA-Z0-9*] ]] #checks if it's a special character
        	then
        	        ((non_alphanumeric+=1))
		elif [[ $char == [*] ]] #checks if it's the control character
		then
			((ctrl_position=i+1))
			echo "control value was entered at position: $ctrl_position"
        		string="*"
		fi
	done
	if [[ $string == [*] ]]
	then
		break
	fi
	echo "Enter more."
	read string

done

((total_chars=letters+numbers+non_alphanumeric))

echo "The number of letters counted in the string: $letters"
echo "The number of digits counted in the string: $numbers"
echo "The number of non-alphanumeric characters counted in the string: $non_alphanumeric"
echo "The total number of characters counted: $total_chars"


