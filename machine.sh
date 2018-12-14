#!/bin/bash
#database architect script
#refer to list.sh
#powered by list.txt
while read -r varname; do
echo ">>> generating wordlist"
crunch 4 4 0123456789 -o numbers.txt
  #echo Please enter Area Code and Prefix
  #echo $varname
#read -r varname
  echo ">>> working"
sed -i.bak "s/^/$varname/" numbers.txt && mv numbers.txt output.txt 
cp output.txt csv.txt
cp output.txt $(head -1 output.txt).tmp && mv *.tmp ./out
awk '{ printf( "BEGIN:VCARD\nVERSION:2.1\nN:;%s\nFN:%s\nTEL;type=CELL:%s\nREV:VCFgen\nEND:VCARD\n\n" , $1 , $1 , $1 ) }' output.txt > new.vcf
cp new.vcf $(head -1 output.txt).csv && mv *.csv ./csv
   cd ./csv
  cd ..
mv new.vcf $(head -1 output.txt).vcf && cp *.vcf ./out
mv *.vcf ./fin
 cd ./csv
  split *.csv --lines=20000
mv xaa xab xac xad ../ && cd ..
     rm -Rf csv && mkdir csv
mv xaa $(head -1 csv.txt)_pt1.csv
 mv xab $(head -1 csv.txt)_pt2.csv
 mv xac $(head -1 csv.txt)_pt3.csv
mv xad $(head -1 csv.txt)_pt4.csv
 mv *.csv ./out 
echo "#Zipping Resources"
zip -r $(head -1 output.txt).zip out
  mv *.zip ./fin
cp -r out ./fin
      rm -Rf out && mkdir out
cd ./fin && mv *.zip ./zips
 cd ./out 
  mv *.* ../ && cd ..
      rm -Rf out 
 cd ..
  cd ./fin 
 mv *.vcf ./vcf
  rm *.tmp
 rm *.csv 
cd ..
  echo ">>> All Finished!"
  done < list.txt
  