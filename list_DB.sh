#!/bin/bash

echo -e "\e[36m                         ALL DATABASES"
echo -e "\e[36m~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
for i in `ls ./DataBases`
do
if [[ -d ./DataBases ]]
then
  echo $i
fi
done
echo -e "\e[36m~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\e[39m"


