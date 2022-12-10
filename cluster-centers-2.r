od=read.csv(file="cluster.csv",sep=",",header=TRUE,row.names=NULL)
od=od[,-1]
od=od[,-1]

d=scale(od)

model=kmeans(na.omit(d),centers=2)

d_cluster=data.frame(d,cluster=as.factor(model$cluster))

res_kmeans=parameters::cluster_analysis(d,n=2,method="kmeans")

setEPS()
postscript("cluster-centers-2.eps")
plot(summary(res_kmeans))
dummy=dev.off()
