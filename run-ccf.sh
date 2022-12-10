#!/bin/sh

#ROWS=`at ../Cleaning/data.csv | cut -d',' -f2 | sort -u | wc -l`

rm -f *.txt
gunzip -c country.csv.gz | tail -n+2 | cut -d',' -f1 | sort | while read iso; do
  gunzip -c data.csv.gz | grep "^$iso," | cut -d',' -f$1 | perl add-zero.pl $ROWS > $iso-cases.txt
  gunzip -c data.csv.gz | grep "^$iso," | cut -d',' -f$2 | perl add-zero.pl $ROWS > $iso-deaths.txt
  name=`gunzip -c country.csv.gz | grep "^$iso," | cut -d',' -f3`

cat<<EOF > $iso-cases.gp
set term eps
set output "$iso-cases.eps"
plot '$iso-cases.txt'
EOF
  gnuplot $iso-cases.gp 2> /dev/null
cat<<EOF > $iso-deaths.gp
set term eps
set output "$iso-deaths.eps"
plot '$iso-deaths.txt'
EOF
  gnuplot $iso-deaths.gp 2> /dev/null
  ./ccf.sh $iso > ccf.r
  Rscript ccf.r 
done

