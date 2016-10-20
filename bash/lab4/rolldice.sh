#/bin/bash
#lab 4 script 1 
#this script prompt the user for count of dice and than ralls them
#done by krunal patel-200304119


###variables

declare -i count
count=0 #number of dies
sides=0 #number of sides from 4 to 20 only 
declare -i sides


###fuction 

function error-message {
    echo "$@" >&2 
    
}


##command line proccing 
while [ $# -gt 0 ]; do
    case "$1" in
    
    -h )
        
        echo "Usage: $0 [-h] [-c numberofdice] [-s numberofsidesperdie] [-s 4-20]"
        exit 0
        ;;    
        
    -c )
        if [[ "$2" =~ ^[1-9][0-9]*$ ]]; then    
            count=$2
            shift
        else
            error-message "you gave me '$2' as the number of dice to roll, bad plan muchcho" 
            exit 1
        fi
        
        ;;
        
     -s )
        if [[ "$2" =~ ^[1-9][0-9]*$ ]]; then    
            if [ $2 -lt 4 -o $2 -gt 20 ]; then
            echo " number of sides must be from 4 to 20 " > $2
            
            sides=$2
            shift
            
            fi
        else
            error-message "you gave me '$2' as the number of sides per die, no way that happning" 
            exit 1
        fi
        
        ;;
    * )
    
            error-message "i din't understand '$1' " 
            echo "Usage: $0 [-h] [-c numberofdice] [-s numberofsidesperdie] [-s 4-20]"
            exit 1
        ;;    
    
    esac
    shift
done

###user input

#get a valid roll count from user 

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
for (( rolls=0 ; rolls < count ; rolls++ )); do
# roll the dice
  die1=$(($RANDOM % $sides +1))
  echo "Rolled $die1"
done