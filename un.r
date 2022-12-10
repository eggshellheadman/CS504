data <- read.csv("un1.csv.gz")

write.table(data,"un1a.csv",na="",sep="|",row.names=F,col.names=F,quote=F)
