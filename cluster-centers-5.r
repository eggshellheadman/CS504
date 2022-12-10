od=read.csv(file="cluster.csv",sep=",",header=TRUE,row.names=NULL)
od=od[,-1]
od=od[,-1]

d=scale(od)

model=kmeans(na.omit(d),centers=2)

res_kmeans=parameters::cluster_analysis(d,n=5,method="kmeans")

setEPS()
postscript("cluster-centers-5.eps")
plot(summary(res_kmeans))
dummy=dev.off()
