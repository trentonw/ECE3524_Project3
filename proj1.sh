#!/bin/sh


#Script for Project1
#Creating a file tree graphically

#Check number of command line arguments
if [ "$#" -ne 2 ]; then
	echo "Invalid number of arguments given"
	exit 1
fi

#Create a string for the command line arg
str="."

path=$(pwd)

#Move to the file we found
cd ~

#start the html format
echo "<!DOCTYPE html>" | cat > $2

echo "<html>" | cat >> $2

echo "<body>" | cat >> $2

echo "<h1>The directory tree structure</h1>" | cat >> $2

echo "<p>" | cat >> $2

echo "<pre>" | cat >> $2

echo "<b>" | cat >> $2

#Find the rest of the directories and write them to a file
find -type d | sed 's;[^/]*/;   ;g' | cat >> $2 

#Edit the text in the file
sed -i "s|\.|$str|g" $2

echo "</b>" | cat >> $2

echo "</pre>" | cat >> $2


echo "</p>" | cat >> $2

echo "</body>" | cat >> $2


echo "</html>" | cat >> $2


mv $2 $path
