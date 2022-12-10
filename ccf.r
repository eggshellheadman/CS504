cases=scan("BRB-cases.txt",quiet=TRUE)
deaths=scan("BRB-deaths.txt",quiet=TRUE)

cases.ts=as.ts(cases)
deaths.ts=as.ts(deaths)

setEPS()
postscript("BRB-ccf.eps")
v=stats::ccf(deaths.ts,cases.ts,lag=65)
#print(v)
