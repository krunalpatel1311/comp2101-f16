#!/bin/bash
#Create an array containing 11 different food names. Create two variables with random numbers in them from 1-6 each.
#Add the two numbers together and use the sum as an index to display a food from your array.


foods=(apple banana pizza wings beer steak sandwitch "pop tart" chiken ribs dirt)
diel=$((1+ $RANDOM %6))
die2=$((1+ $RANDOM %6))

dietotal=$((diel + die2))

foodindex=$((dietotal - 2))

echo "yum, i rilled $dietotal which gives me ${foods[$foodindex]}!"

