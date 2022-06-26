#!/bin/bash
typeset -i flag=0 
BRed='\033[1;31m'         # Red
Green='\033[0;32m'        # Green

while [[ $flag -eq 0 ]]
do

echo -ne "$Green Enter the name of the database you want to connect with:$Green "
read DBname
	
	if [[ -d ./DataBases/$DBname ]]
	then
		
		cd ./DataBases/$DBname 2>>/dev/null
		echo "You are now connected to $DBname database"
		flag=1
			
	else
		echo -ne "\e[36m No database with name $DBname --> \e[38m "
		
	fi 
done
bash /home/user/table_menu.sh
