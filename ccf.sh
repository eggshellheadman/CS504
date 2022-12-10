#!/bin/sh

cat<<EOF
cases=scan("$1-cases.txt",quiet=TRUE)
deaths=scan("$1-deaths.txt",quiet=TRUE)

cases.ts=as.ts(cases)
deaths.ts=as.ts(deaths)

setEPS()
postscript("$1-ccf.eps")
v=stats::ccf(deaths.ts,cases.ts,lag=65)
#print(v)
EOF
