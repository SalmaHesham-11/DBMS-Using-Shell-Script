#!/bin/bash
#color
On_Cyan='\033[46m'
On_Yellow='\033[43m'      # Yellow
Color_Off='\033[0m'       # Text Reset

Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple

sep=","
lin_sep="\n"

echo -ne "$Blue Please enter name of the table you want to add to it : "
read $Color_off tablename

meta_data=.$tablename@meta_data

if [[ -f $tablename.csv ]] && [[ -f .$tablename@meta_data ]]
then
    echo -e "$Color_off table existed"

else 
    echo -e "table not existed"
    read tablename
fi

echo -n "Enter column Name: "
read col_name

while [[ ! $col_name =~ [a-zA-Z]+ ]]
            do
                echo "Invalid Name , please try again -->"
                read col_name
            done

	echo -n $col_name ,  >>  $tablename.csv
	echo -ne "$BBlue make $col_name primary key .. \n"
	
	select choise in yes no
	do
	case $choise in
	yes)
	     pk="pk"
	     break;;
	no)
	     pk=""
	     break;;

	esac
	done

	echo -e "$Color_Off Select the datatype of column $col_name "
	select datatype in Integer String 
        do
        case $datatype in
        Integer) 
                  type="Integer"
		  metaData+=$lin_sep$col_name$sep$pk$sep$type
		break
                  
	;;
 	String)
                 
                 type="String"
		 metaData+=$lin_sep$col_name$sep$pk$sep$type
		 break
	;;
	*) echo "not in options";;
    	esac
    	
	done 	      
  
#no_column= $no_column+1
echo -e $metaData >> $meta_data
#echo -e "number of columns = `awk -F, 'END{ print NR }' meta_data` "  >> $meta_data
#no = `wc -l $meta_data`
echo `wc -l $meta_dat` >> $meta_data

