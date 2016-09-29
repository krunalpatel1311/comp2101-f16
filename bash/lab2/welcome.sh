#!/bin/bash
#this is scrpt to print welcome using variable and command 

export MYNAME="Krunal patel"
mytitle="super man"

planet='hostname'
weekday=$(date +%A)
echo "welcome to planet $planet, $mytitle $MYNAME!"
echo "today is $weekday."

