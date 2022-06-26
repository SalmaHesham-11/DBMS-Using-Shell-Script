#!/bin/bash
select choice in 'Select All Records In Table' 'Select Column From Table' 'Select One Row From Table' 'Exit'
do
   case $choice in

        'Select All Records In Table')
              echo "Enter the table name that you want to select from  " 
		read tablename 
                    if [ -z "$tablename.csv" ]
                    then
                        echo -e "\e[31m This field is required.\e[39m" 
                    else
                        if [ -f "$tablename.csv" ]
                        then 
                            if [ -z "$tablename.csv" ]
                            then 
                                echo -e "\e[31m Table $tablename is empty, press enter to continue"

                                exit
                            else

                            echo -e "              All records from table $tablename            "
                            cat $tablename.csv
                            
			    fi
                        else
                        echo -e "\e[31m $tablename table doesn't exist, press enter to continue"
                        fi 
                    fi
                ;;

	'Select Column From Table')
		echo -e "Enter Table Name: \c"
		read tablename
		echo -e "Enter Column num: \c"
		read col_num
		awk 'BEGIN{FS=","}{print $'$col_num'}' $tablename.csv
		;;

        'Select One Row From Table')
		echo "Enter name of table to select from " 
		read tablename
                if [ -z "$tablename.csv" ]
                then
                  echo -e "\e[31m This field is required!\e[39m"
                else
                  	if [ -f "$tablename.csv" ]
                   	then
                     	  if [ -z "$tablename.csv" ]
                      	  then
                            echo -e "\e[31m $tablename is empty, press enter to continue"

                        	else
                           echo "Enter primary key value of the record you want to select : " 
			   read pk 
                            if [ -z "$pk" ]
                            then
                                echo -e "\e[31m This field is required!\e[39m"
                            else
                               
                             NR=$(awk 'BEGIN{FS=","}{if ( $1 == "'$pk'" ) print NR}' $tablename.csv 2>>/dev/null)
                                       if [[ $NR == "" ]]; 
                                       then
                                            echo -e "\e[31m Record doesn't exist, press enter to continue"
					    
                                        else
					    echo $(awk 'BEGIN{FS=","}{if ( NR == '$NR' ) print $0 }' $tablename.csv 2>>/dev/null)
                                            echo -e "\e[94m The record with is successfully selected, press enter to continue"
					    
                                        fi
                                
                            fi
                        fi
                    else
                        echo -e "\e[31m Table doesn't exist, press enter to continue"  

                    fi
                fi
		;;

	'Exit')
            exit;;

        *)  
           echo -e "\e[31m Please Select A Valid Option!" ;;
 
  esac
done
