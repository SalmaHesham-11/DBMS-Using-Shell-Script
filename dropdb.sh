#!/bin/bash
echo -e "\e[36m  Please Enter the Name of database you want to drop:  "
read Name


if [[ -d ./DataBases/$Name ]]
then
	rm -r -i ./DataBases/$Name
	echo -e "\e[31m           << Database dropped >> \e[30m " 

else
	echo -e "\e[31m   << Database not found >> \e[30m"
	
fi


