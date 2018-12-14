#!/bin/bash
#Search.sh 
#Search the NANPA NPA-NXX Databases Locally
#Prints NANPA TelCo information to screen
#Lists TelCo Name, Location, & Contact from NPA-NXX Codes
cd sort
echo "The correct syntax 000-000"
 echo "IF YOU OMIT OR INSERT ADDITIONAL HYPHENS THE RESULT WILL RETURN BLANK "
echo Please enter Area Code and Prefix
  read -r varname
grep "$varname" db
#fin