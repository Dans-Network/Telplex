#!/bin/bash
##Generate Bulk, Targeted VCF & CSV Files
#Default output is zipped file containing;
# 1x *.VCF @ 10k#'s ordered NPA-NXX-xxxx
# 4x Globed & Ordered *.CSV's @2.5k per
# 1x plain text (*.TMP) ordered list @10k
#Default VCARD v2.1 {for compatibility}
#Default output directory is /fin/zips
echo ">>> generating wordlist"
crunch 4 4 0123456789 -o numbers.txt
  echo Please enter Area Code and Prefix
read -r varname
  echo ">>> working"
sed -i.bak "s/^/$varname/" numbers.txt && mv numbers.txt output.txt 
cp output.txt csv.txt
cp output.txt $(head -1 output.txt).tmp && mv *.tmp ./out/
   sleep 1.5
  echo ">>> verifying output"
  echo | head -n 5 output.txt
   sleep 0.5 
 echo | tail -n 5 output.txt
 echo ">>> ok"
   sleep 1.5
 #VCF SECTION
#If desired change VCF version below
#Edit line containing the following string;
#BEGIN:VCARD\nVERSION:2.1
#This Script also handles Emails. Ref README.
#/---> VCF SECTION BEGIN <---\
awk '{ printf( "BEGIN:VCARD\nVERSION:2.1\nN:;%s\nFN:%s\nTEL;type=CELL:%s\nREV:VCFgen\nEND:VCARD\n\n" , $1 , $1 , $1 ) }' output.txt > new.vcf
#/---> VCF SECTION END <---\
cp new.vcf $(head -1 output.txt).csv && mv *.csv ./csv
   cd ./csv 
#Verification Section
#used to check for mistakes. slower.
#prints the output HEAD|TAIL for the new CSV/VCF
#remove section or comment to silence output
#/---> VERIFICATION SECTION BEGIN <---\
  echo ">>> verifying CSV"
 echo | head -n 7 *.csv
   sleep 0.5 
 echo | tail -n 7 *.csv
  echo "> ok"
   sleep 1.5
  cd ..
  sleep 1
  echo ">>> verifying VCF"
 echo | head -n 7 new.vcf
   sleep 0.5 
 echo | tail -n 7 new.vcf
  echo ">>> ok"
   sleep 1.8
#/---> VERIFICATION SECTION END <---\
mv new.vcf $(head -1 output.txt).vcf && mv *.vcf ./out
 cd ./csv
 #The next section splits & renames the CSVs
#By default they are split into 4 files
#each containing 20k lines ( 2,500 contacts )
#to skip this & output one CSV remove or comment
#**********¡¡¡WARNING!!!**********
#this method is incompatible with Google
#Googles maximum CSV import is 3k contacts
#/---> CSV SECTION BEGIN <---\
  split *.csv --lines=20000
mv xaa xab xac xad ../ && cd ..
     rm -Rf csv && mkdir csv
mv xaa $(head -1 csv.txt)_pt1.csv
 mv xab $(head -1 csv.txt)_pt2.csv
 mv xac $(head -1 csv.txt)_pt3.csv
mv xad $(head -1 csv.txt)_pt4.csv
#/---> CSV SECTION END <---\
 mv *.csv ./out 
echo ">>> Zipping Resources"
zip -r $(head -1 output.txt).zip out
  mv *.zip ./fin
cp -r out ./fin
      rm -Rf out && mkdir out
cd ./fin && mv *.zip ./zips
 cd ./out 
  mv *.* ../ && cd ..
      rm -Rf out 
 cd ..
  echo ">>> All Finished!"
#Done