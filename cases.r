suppressMessages(library(dplyr))
suppressMessages(library(dtw))

t <- read.table("cases.txt", header=F, sep="")
sc=scale(t)

sc <- sc %>% replace(is.na(.), 0) 

distMatrix <- proxy::dist(sc, method="DTW")

hc <- hclust(distMatrix, method="average")

setEPS()
dev.new(width=16, height=5, unit="in")
postscript("cases.eps")
plot(hc, main="")
