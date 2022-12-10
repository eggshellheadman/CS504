d=read.csv(file="country.csv.gz",sep=",",header=TRUE)

d=na.omit(d)

data.table::fwrite(d,file="slim-country.csv")
