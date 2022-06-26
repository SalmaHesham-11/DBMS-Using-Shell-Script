#!/bin/bash

select del in 'Delete All Records' 'Delete One Record' 'Exit'
       do
        case $del in
        'Delete All Records')
		echo "Enter the table name want to delete from : "
                read tablename
                if [ -z "$tablename"  ]
                then
                    echo -e "\e[31m This field is required!\e[39m"
                else
                    if [ -f "$tablename.csv" ]
                    then 
                       
                        sed -i '2,$d' $tablename.csv
                        echo -e "\e[94m All records in table $tablename are successfully deleted"
			 
                       
                    else
                    echo -e "\e[31m $tablename table doesn't exist, press enter to continue"
		   
                    fi 
                fi
                ;;
               
	'Delete One Record')
                read -p "Enter name of table to delete from " tablename
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
                           echo "Enter primary key value of the record you want to delete : " 
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
                                            sed -i ''$NR'd' $tablename.csv 2>>/dev/null
                                            echo -e "\e[94m The record with is successfully deleted, press enter to continue"
					    
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
                    echo -e "\e[31m Please Select A Valid Option!";;
            esac
            done                
        
