#!/bin/bash
####
#Description: usernamepicker.bash is a user name generator that takes a letter and month as arguments
#and generates a username. Useful for when you can't think of a cool username.
#Author: Anzhelika Nabozhina
#Date created: 03/12/2016
####

#Key-value array for the first part of the user name.
declare -A LETTER
LETTER[A]=Cannonball
LETTER[B]=Lady
LETTER[C]=Peg_Leg
LETTER[D]=Flying
LETTER[E]=Old
LETTER[F]=Gunpowder
LETTER[G]=Jolly
LETTER[H]=Sneaky
LETTER[I]=One_Eyed
LETTER[J]=Two_Toes
LETTER[K]=Captain
LETTER[L]=Bloody
LETTER[M]=Captain
LETTER[N]=Rapscallion
LETTER[O]=Bowman
LETTER[P]=Don
LETTER[Q]=Sail
LETTER[R]=One_Ear
LETTER[S]=Half_Blind
LETTER[T]=Gangplank
LETTER[U]=Greasy
LETTER[V]=Stinky
LETTER[W]=Red
LETTER[X]=Scurvy
LETTER[Y]=Dirty
LETTER[Z]=Long_Beard
#Key-value array for the second part of the user name.
declare -A MONTH
MONTH[JAN]=Hook
MONTH[FEB]=Morgan
MONTH[MAR]=Beard
MONTH[APR]=Dutchman
MONTH[MAY]=Cannon
MONTH[JUN]=Willy
MONTH[JUL]=Nemo
MONTH[AUG]=O_the_sea
MONTH[SEP]=Murloc
MONTH[OCT]=Berserker
MONTH[NOV]=Sparrow
MONTH[DEC]=Hawk

echo "To generate a username please follow the instructions below."

#Getting the key to the letter associative array
letter=""
while [ "$letter" == "" ] #keeps asking for input until a valid key is entered and a value is taken from LETTER array
do
	echo "Please enter a letter."
	read input1
	letter_input=${input1^^} #converts the input to uppercase
	if [ "$letter_input" != "" ]
	then
		letter=${LETTER[$letter_input]} #when a value is found, it is assigned to a variable letter
	fi
done

#Getting the key to the month associative array
month=""
while [ "$month" == "" ] #keeps asking for input until a valid key is entered and a value is taken from MONTH array
do
	echo "Pick a month.(JAN/FEB/MAR etc.)."
	read input1
	month_input=${input1^^} #converts the input to uppercase
	if [ "$month_input" != "" ]
	then
		month=${MONTH[$month_input]} #when a value is found, it is assigned to a variable month
	fi
done

pirate_user_name=$letter"_"$month #mashes the variables together into a user_name format

echo "Your new pirate user name is: $pirate_user_name" #prints the username

exit 0
