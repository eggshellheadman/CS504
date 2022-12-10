od=read.csv(file="cluster.csv",sep=",",header=TRUE,row.names=NULL)
od=od[,-1]
od=od[,-1]

d=scale(od)

res_kmeans=parameters::cluster_analysis(d,n=4,method="kmeans")

setEPS()
postscript("cluster-centers-4.eps")
plot(summary(res_kmeans))
dummy=dev.off()
