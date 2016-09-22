#!/bin/bash
#this is script for dispaly all the setuid and setgid /usr dir trees 
#lab1 part 6
echo "setuid files"
# to easy to figure out that is the reason to write echo
echo "----------"
find /usr -type f -executable -perm -4000 -ls 

#find /usr -type f -executable -perm -2000 -ls

cat <<EOF

setGID files
---------
EOF