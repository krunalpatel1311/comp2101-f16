#!/bin/bash
#this  script take randomnumber from user and begins the countdown from that number until it's reach zero
#
###created by krunal patel 200304119

#Intliaize the variable 
var=0

#creating function
function clean() #This function is used for interruting signal 
{
    
    echo "Interrupt signal generated"
    echo "countdown start again"
   
}

quit() #This is for quit signal
{
    echo "You have Interrupted signal"
    exit 1
    
}
function helpme() #Help function show the syntax:
{
    echo "Usage: $0 [-h] [-c]"

}

function error-message()
{
    echo "Invalid: Number should be greater than 0 " >&2
}

trap "clean SIGINT; continue" 2 #To catch the interrupt

#trap clean SIGINT 

trap quit SIGQUIT #To catch the quit signal


#main 

while [ $# -gt 0 ]; do
	case "$1" in
	-h|--help )
		helpme # call fuction help for user
		exit 0
		;;
    -c| --count )
        
        if [[ $2 -gt 0 ]]; then
        
        b=$2
        
        #echo "Value of number is $number"
        
        else 
        
        error-message
        exit 2
    fi
        
       ;;

    esac
    shift
done

#To take random input from the user

if [ -z "$b" ]; then 
    read -p "Enter your number: " number
        a=$number
    echo "Countdown start from: $a"
    
else
    
    number=$b
    a=$b

     
           
fi


    while [ $number -gt 0 ]; 
    do
    
        if [ $var -gt 0 ];  then
            
            number=$a
            var=0
            
           
        
        fi
        
        
        sleep 1
        echo "Remaining count is $number"
        number=$(( $number - 1 ))
        if
            [ $number -lt 1 ]; then
            
            echo "THANK YOU and Good BYE!!!!!!"    
        fi
    
    done
    
#End of program
