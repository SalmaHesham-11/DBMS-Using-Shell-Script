#!/bin/bash

echo -e "\e[36m Enter Table Name to drop: "
  read tabName
  
  if [[ -f "$tabName.csv" ]] && [[ -f ".$tabName@meta_data" ]] 2>>/dev/null
  then
	rm -i $tabName.csv
	rm -i .$tabName@meta_data


    echo -e "\e[31m  <<Table Dropped Successfully>> \e[30m "
  else
    echo -e "\e[31m <<Error Dropping Table, the name is inncorrect>> \e[30m"
  fi

