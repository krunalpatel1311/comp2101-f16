#!/bin/bash
# this script displays how many files are in ~/Pictures,
#    how much space they use,
#    and the sizes and names of the 3 largest files
###created by krunalpatel 200304119

s=0
usage=0

function help(){
    
    echo "Usage: $0 [-c] [Path of directory] [-h]"    
 
}

function error-message(){
    
    echo "Sorry number of files should be 3 or more try again:" >&2
    
    
}


while [ $# -gt 0 ]; do
	case "$1" in
	-h| --help )
		help # help function for user
		exit 0
		;;
	-c | --count )
	 
	
	 s=1   
	 cd $2
	 
	 echo -n There are `find $2 -type f | wc -l`
     echo " number of files in the $2 directory"

    echo "The Pictures directory uses this much amount of space:"
    du -sh $2

    if [ "$3" -lt 3 ]; then 
    
        error-message
        exit 2
    else
        echo "The $3 largest files in the ~/Pictures directory are:"
         find . -type f -exec du -h {} \; | sort -h | tail -$3
	
	fi
	;;
	
	esac
	shift
done



if [ $s -eq 0 ]; then

    numfile=`find ~/Pictures -type f | wc -l`
    
    echo -n There are $numfile
    echo " files in the ~/Pictures directory are:"
    
    usage=`du -sh ~/Pictures`
    echo "The Pictures directory uses: $usage"
    
     if [ "$numfile" -lt 3 ]; then 
    
        error-message
        exit 2
    else

    echo "The 3 largest files in the ~/Pictures directory are:"

    cd ~/Pictures
    find . -type f -exec du -h {} \; | sort -h | tail -3

    fi
    fi