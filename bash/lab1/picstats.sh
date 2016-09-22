#!/bin/bash

#how many regular files there are in the Pictures directory and how much disk space they use. 
#It should also show the sizes 
#and names of the 3 largest files in that directory.

echo -n "in the ~/pictures directory thr numbers of file is"
find ~/pictures -type f |wc -l 
# -n menas it print bith output in one line 


echo -n "those file uses this much space "
du -h ~/pictures |awk '{print $1}'


#sort comand use for sortout files as per your condition 
#tail comand use for how many output you want for examole in this case we need 3 so its -3

echo "the 3  largest files are:"
du -h ~/pictures/* |sort -h |tail -3

