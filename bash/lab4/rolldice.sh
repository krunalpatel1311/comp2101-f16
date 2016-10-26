#!/bin/bash
# this script gets 2 numbers from the user
#   a count of dice and a count of sides per die
#   it prints out the results of rolling those dice


########### created by krunal patel 200304119

# the number of dice store in $count, defaulting to 2
# the number of sides store in $sides, defaulting to 6
# start the total rolled at zero
declare -i count
count=0 #number of dies
sides=0 #number of sides from 4 to 20 only 
declare -i sides

#function

function error-msg()
{
    echo "$@" >&2
}

# Main

# Use command line for checking count and sides
while [ $# -gt 0 ]; do
    case "$1" in
    -c )
        if [[ "$2" =~ ^[1-5][0-5]*$ ]]; then
            count=$2
            shift
        else
            error-meg "bad value for '$2'"
            exit 1
        fi
        ;;
    -s )
        if [[ "$2" =~ ^[1-9][0-9]*$ ]]; then
            if [ "$2" -lt 4 -o "$2" -gt 20 ]; then
            echo " slides should be 4 to 20: " > $2
                sides=$2
                shift
            else
               error-msg "bad value for '$2'"
                exit 1
            fi
        fi
       ;;
       
       -h )
       echo "Usage: $0 [-h] [-c dices] [-s sides] [-s 4-20]"
        exit 0
       exit 2
       ;;
       
        * )
    
            error-msg "wronge input for '$1' " 
            echo "Usage: $0 [-h] [-c dices] [-s sides] [-s 4-20]"
            exit 1
        ;;    
    esac
    shift
done

until [ $count -gt 0 ]; do
  read -p "How many dice shall I roll[1-5]? " count
# ignore empty guesses

  [ -n "$count" ] || continue

done
until [ $sides -gt 3 -a $sides -lt 21 ]; do
  read -p "How many sides each have [4-20]? " sides
  
 
done
##main
# do the dice roll as many times as the user asked for
while [ $count -gt 0 ]; do

    # the roll range is based on the number of sides
    roll=$(( $RANDOM % $sides +1 ))
    
    # add the current roll total to the running total
    sum=$(( $sum + $roll ))
    
    # give the user feedback about the current roll
    echo "Rolled $roll"
    
    # the loop will end when the count of dice to roll reaches zero
    ((count--))
done

# done rolling, display the sum of the rolls
echo "Total sum of rolles dice is: $sum"