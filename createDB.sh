#!/bin/bash

echo -ne "\e[32m Please Enter DataBase Name \e[39m"
read DBname

# check if database exists before or not
if [[ -d ./DataBases/$DBname ]] 
then
    echo
    echo "Database Already Exists!"
    echo "please try again : "
    
else
    mkdir ./DataBases/$DBname
    echo
    echo "Database Created Successfully"
fi
echo

