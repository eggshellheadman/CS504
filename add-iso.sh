#!/bin/sh

ln=`gunzip -c un1p.csv.gz | head -n 1`
echo "iso,$ln"
gunzip -c un1p.csv.gz | tail -n+2 | while read ln; do
  c=`echo $ln | cut -d',' -f1`
  iso=`gunzip -c country.csv.gz | grep ",$c," | cut -f1 -d','`
  echo "$iso,$ln" 
done
