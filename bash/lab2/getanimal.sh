#!/bin/bash
#Create an array of colours, with at least 4 colours in it. Create an associative array of animals, 
#where the keys are colours, 
#and the values are animals who are that colour. Use the colours you put into the first array. 
#Ask the user for a number and use it to display a colour from the array,
#then the corresponding animal from the associative array for that colour


colour=(red green blue yellow)


declare -A animals
animals=(["red"]="lion" ["green"]="frog" ["blue"]="fish" ["yellow"]="tigher")

echo "the colour are: ${colour[0]}, ${colour[1]}, ${colour[2]}, ${colour[3]}"
echo "the colour are: ${colour[@]}"


echo "the animals are: ${animals[red]}, ${animals[green]}, ${animals[blue]}, ${animals[yellow]}"
echo "the animals are: ${animals[@]} coloured ${!animals[@]}"


#num=0
read -p "give me a number from 0 to 3:" num
colour1=${colour[$num]} 
animal=${animals[$colour]}
echo "index $num produce a $colour1 $animal"








