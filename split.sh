#!/bin/bash
#Split large files alphabetically
#Outputs x# of files to same Dir
#Replace ext inside brackets
# NF      {TMP=substr($1,1,1)".txt"
echo Please enter name of file to split
  read -r var
awk '
NF      {TMP=substr($1,1,1)".txt"
         if (FN && FN != TMP) close (FN)                 
         FN=TMP
         print >> FN
        }
' "$var"
#Done
#Works on all Linux, and most Unix Distros
#Works on any system with BASH, AWK and ECHO