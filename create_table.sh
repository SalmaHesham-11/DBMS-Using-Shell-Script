#!/bin/bash
#color
On_Cyan='\033[46m'
Color_Off='\033[0m'       # Text Reset

Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple

BBlue='\033[1;34m'        # Blue
BPurple='\033[1;35m'      # Purple

sep=","
lin_sep="\n"

echo -ne "$Blue Please enter name of the table: "
read tablename

meta_data=.$tablename@meta_data

if [[ -f $connectDB/$tablename ]]
then
    echo -ne " $Purple table already existed"
   

else
    touch $tablename.csv           #datafile
    touch $meta_data            #metadata file

    
    echo -ne "$Color_Off number of columns in the table =  " 
    read column            #column=3
    
	while [[ ! $column =~ [0-9]+ ]]
        do
            echo "Invalid Number , please try again --> "
            read column
        done
	typeset -i column
	export no_column=$column
    for((i=1 ;i<=$column ;i++))
    do

        echo -n "Enter column no.$i Name: "

        read col_name

	while [[ ! $col_name =~ [a-zA-Z]+ ]]
            do
                echo "Invalid Name , please try again -->"
                read col_name
            done

	echo -n $col_name ,  >>  $tablename.csv; 
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
    done
 
echo -e $metaData >> $meta_data
echo -e "number of columns = $column"  >> $meta_data
echo -e "$Purple table create successfully "
fi

