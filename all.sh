#!/bin/bash

Rscript import-owid-xlsx.r

cat owid.csv | tail -n+2 | awk -F',' '$1 ~ /^...$/ { print $1 }' | sort -u > ISO.txt
cat owid.csv | head -n1 > b.txt
cat ISO.txt | while read iso; do
  clines=`grep "^$iso," owid.csv | cut -d',' -f13 | sort -u | grep -v '^$' | wc -l`
  dlines=`grep "^$iso," owid.csv | cut -d',' -f16 | sort -u | grep -v '^$' | wc -l`
  name=`grep "^$iso," owid.csv | cut -d',' -f3 | sort -u`
  if [[ ( "$clines" -ne 0 && "$dlines" -ne 0 ) ]]; then 
    grep "^$iso," owid.csv >> b.txt
  fi
done

cat b.txt | head -n 1 | cut -d',' -f1-3,49-63,68-69 > country.csv
cat b.txt | tail -n+2 | cut -d',' -f1-3,49-63,68-69 | sort -u >> country.csv
gzip -c country.csv > country.csv.gz
rm -f country.csv

cat b.txt | cut -d',' -f1,4-48,64-67 | gzip -c > data.csv.gz

Rscript slim-country.r

Rscript import-un1-csv.r

./un1.sh

rm -f un1.csv.gz
gzip un1.csv

./add-iso.sh > cluster.csv

Rscript cluster-centers-2.r
Rscript cluster-centers-3.r
Rscript cluster-centers-4.r
Rscript cluster-centers-5.r

Rscript which-1.r
Rscript which-2.r
Rscript which-3.r
Rscript which-4.r
Rscript which-5.r
Rscript which-6.r

./process-smoothed-level.sh

./deaths.sh > deaths.txt
./cases.sh > cases.txt

Rscript cases.r
Rscript deaths.r
