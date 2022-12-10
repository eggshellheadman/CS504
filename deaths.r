suppressMessages(library(dplyr))
suppressMessages(library(dtw))

t <- read.table("deaths.txt", header=F, sep="")

sc=scale(t)

sc <- sc %>% replace(is.na(.), 0)

distMatrix <- dist(sc, method="DTW")

hc <- hclust(distMatrix, method="average")

setEPS()
postscript("deaths.eps",width=16,height=5)

plot(hc, main="")
