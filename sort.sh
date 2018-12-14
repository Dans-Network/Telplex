#!/bin/bash
# generates a single .txt file containing
# all NPA-NXX #'s belonging to a valid TelCo
# all valid U.S. TelCos are listed in the telco.db 
# results use same output structure as search.sh
 cd sort
echo Please enter TelCo Name
  read -r varname
    echo "working"
   grep "$varname" db > "$varname".txt 
find . -type f -name "* *.txt" -exec rename "s/\s/_/g" {} \;
  rename "s/,//g" *.txt
 rename "s/-//g" *.txt
#fin
 