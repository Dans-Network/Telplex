#/bin/bash
#extracts numbers for input to build database
#input files should be grepped from original NANPA database, placed in root folder under the name db.txt
awk '{ print $2 }' db.txt > db2.txt
sed -i '$varname' db2.txt
sed 's/$/-/' db2.txt > list.txt