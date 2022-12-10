#!/bin/sh

Rscript un.r

cat un1a.csv | cut -f2-5 -d'|' | tr -d '"' | tr -d '(' | tr -d ')' | tr -d ' ' > tmp1.txt
cat tmp1.txt | awk -F'|' '$2==2022 { print $0 }' > un1.txt

cat un1.txt | tail -n+3 | cut -f3 -d'|' | sort -u > cats.txt

echo "Country,InfantMort,LifeExp,LifeExpFemale,LifeExpMale,PopInc,FertRate" > un1p.csv
gunzip -c country.csv.gz | tail -n+2 | cut -d',' -f3 | while read c; do
  grep -i "^$c|" un1.txt > /dev/null
  if [ $? -eq 0 ]; then
    printf "$c" >> un1p.csv
    cat cats.txt | while read col; do
      a=`grep -i "^$c|" un1.txt | grep "$col" | cut -f4 -d'|'`
      printf ",$a" >> un1p.csv
    done
    printf "\n" >> un1p.csv
  fi
done

rm -f un1p.csv.gz
gzip -c un1p.csv > un1p.csv.gz
