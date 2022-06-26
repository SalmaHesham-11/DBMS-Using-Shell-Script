#!/bin/bash

echo -e "\n\e[1;35m~~~~~ Tables Menu ~~~~~~\n"
  echo " 1. Show All Tables "
  echo " 2. Create New Table     "
  echo " 3. Insert Into Table    "
  echo " 4. Select From Table    "
  echo " 5. Update Table         "
  echo " 6. Delete From Table    "
  echo " 7. Drop Table           "
  echo " 8. Alter Add New Column "
  echo " 9. Back To Main Menu    "
  echo " 10. Exit                 "

  echo -e "~~~~~~~~~~~~~~~~~~~~~~~\n"
  echo -e "\e[30mEnter Number please:\c"
  read num
  case $num in
    1)  ./../../list_table.sh ;;
    2)  ./../../create_table.sh ;;
    3)  ./../../insert.sh;;
    4)  ./../../Select.sh ;;
    5)  ./../../update_table.sh;;
    6)  ./../../delete.sh;;
    7)  ./../../droptab.sh;;
    8)  ./../../Alter_add_column.sh;;
    9)  clear; ./../../main.sh;;
    10)  exit ;;
    *)  clear; echo -e "\n\n\e[1;31m              <<<< Wrong Choice,Try again >>>>           " ; bash table_menu.sh;;
  esac
