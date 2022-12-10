#!/bin/sh

ls -1 *-cases.txt | while read d; do
  cat $d | tr '\n' ' ' | sed 's/ $//'
  echo
done
