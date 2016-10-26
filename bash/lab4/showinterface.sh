#!/bin/bash
# This script displays 2 interfaces and their IPv4 addresses
#If the user gives -r or --route on the command line then it will give default route information


### created by krunal patel 200304119

# Variable


defaultroute=0 # default is to not show the default route
declare -A ips # hash of ip addresses keyed on interface name
declare -a intfs # use command line to assign array
declare -a interfaces # discovered interface names


#Functions


function help(){
    echo "Usage: $0 [-r]"
    
    
}

function error-message(){
    echo "$intf Sorry not assign an interface and ip addrresss" >&2
    
}

# Main

# check the command line for an interface name and -r|--route
while [ $# -gt 0 ]; do
    case "$1" in
    -r|--route )
        defaultroute=1 # set defaultroute to a 1
        ;;
    -h|--help )
        help
        exit 0
        ;;
    *)
        intfs+=("$1") # add unnamed parameters as interface names
        ;;
    esac
    shift
done

# Get an array of our interface names, we will have at least 2

interfaces=(`ifconfig |grep '^[A-Za-z]'|awk '{print $1}'`)


for intf in ${interfaces[@]}; do
    ips[$intf]=`ifconfig $intf|grep "inet "|sed -e 's/.*inet addr://' -e 's/ .*//'`
done

# Get default route gateway IP from the route command
gwip=`route -n|grep '^0.0.0.0'|awk '{print $2}'`

# Display the information we have gathered as requested
if [ ${#intfs[@]} -gt 0 ]; then 
    for intf in ${intfs[@]}; do 
        if [ ${ips[$intf]} ]; then 
            echo "$intf has address ${ips[$intf]}"
        else # call the error-message function
            error-message 
            exit 2
        fi
    done
else
    for intf in ${interfaces[@]}; do #display all interfaces if not specified
        echo "$intf has address ${ips[$intf]}"
    done
fi