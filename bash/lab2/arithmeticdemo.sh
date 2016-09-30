#!/bin/bash
#Create a script to prompt the user for 2 numbers. 
#Perform each of the 5 arithmetic operations on the numbers, 
#and display the results in a user-friendly way.

read -p "give me two numbers, separated by space:" firstnum secondnum


cat <<EOF
this is what i learned in class today
$firstnum plus $secondnum equals $((firstnum + secondnum))
$firstnum minus $secondnum equals $((firstnum - secondnum))
$firstnum times $secondnum equals $((firstnum * secondnum))
#$firstnum divided $secondnum equals $((firstnum / secondnum))
$firstnum divided by $secondnum $((firstnum / secondnum)) with reminder of  $((firstnum % secondnum))

EOF