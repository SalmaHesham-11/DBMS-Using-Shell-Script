#!/bin/bash
echo -e "\n\e[1;34m        =================================================================      "
echo -e "\e[1;34m        ================ Welcome to Our Database Engane =================      "
echo -e "\e[1;34m        =================================================================      \n\n" 

  echo -e "\e[1;30m~~~~ Main Menu ~~~~\n"
  echo "    1. Create DB"
  echo "    2. list all DB"
  echo "    3. Drop DB"
  echo "    4. connect"
  echo "    5. Exit "
  echo "~~~~~~~~~~~~~~~~~~~"
  echo -e "Enter Number:\c "
  read no	

	case $no in
	    1) ./createDB.sh;;
	    2) ./list_DB.sh;;
	    3) ./dropdb.sh ;;
	    4)  ./connect_to_DB.sh ;;
	    5)  exit;;
	    *) clear; echo -e "\n\n\e[1;31m                     <<<<  Wrong Choice,Try again  >>>>      " ; bash main.sh ;;
	  esac
