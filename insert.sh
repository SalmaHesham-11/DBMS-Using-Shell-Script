#!/bin/bash

Color_Off='\033[0m'       # Text Reset

Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Cyan='\033[0;36m'         # Cyan

sep=","
lsep="\n"

while [ true ]
      do
        echo -ne "$Cyan please enter the table name to insert in : " 
	read tablename
	meta_data = .$tablename@meta_data 2>>/dev/null
        
	if [[ -f "$tablename.csv" ]] && [[ -f ".$tablename@meta_data" ]] 2>>/dev/null
	then
	   echo -e "$Color_Off Table Found"
           break
        
	else
           echo -ne "$Color_Off The data table or meta data is missing , try again :\n" 

        fi
done

#col_num=$(awk -F, 'END{ print NR }'.$tablename@meta_data)
col_num=`head -1 $tablename.csv | awk 'END{print NF}'`
#echo $col_num 

for(( i = 2; i <= $col_num; i++ ))
do

        # get the fields names from the table
        fieldname=$(awk 'BEGIN{FS=","}{if(NR == '$i') print $1}' .$tablename@meta_data)
        #echo $fieldname

	key=$(awk 'BEGIN{FS=","}{if(NR == '$i') print $2}' .$tablename@meta_data)
        #echo $key

	col_type=$(awk -F, '{if(NR == '$i') print $3}' .$tablename@meta_data)
	#echo $col_type
	
	echo -ne "$fieldname ($col_type) = "
	read data

	value=`cat $tablename.csv | head -$i | cut -d: -f$i`

	if [[ $key == "pk" ]]
	then 
		if [[ $data = "" ]]
		then
			echo "ERROR: PK can NOT be NULL, try again"
			break


		elif [[ $data = $value ]]
		then
			echo "ERROR: PK can NOT be repeated, try again"
			break
		fi
	fi



	if [[ $col_type == "Integer" ]]
	then

	      while [[ $data != +([0-9]) ]]
	      do
		echo -e "invalid DataType !!"
		echo -ne "$fieldname ($col_type) = "
		read data 
	     done
	fi


	if [[ $col_type == "String" ]]
	then

	      while [[ $data != +([a-zA-Z0-9]) ]]
	      do
		echo -e "invalid DataType !!"
		echo -ne "$fieldname ($col_type) = "
		read data 
	      done
	fi

if [[ $i == $col_num ]]; 
then
      row=$row$data$lsep
    else
      row=$row$data$sep
    fi


done
echo -e $row >> $tablename.csv 
if [[ $? == 0 ]]
  then
    echo "Data Inserted Successfully"
  else
    echo "Error Inserting Data into Table $tableName"
fi 
#row=""

