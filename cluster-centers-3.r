od=read.csv(file="cluster.csv",sep=",",header=TRUE,row.names=NULL)
od=od[,-1]
od=od[,-1]

d=scale(od)

model=kmeans(na.omit(d),centers=2)

d_cluster=data.frame(d,cluster=as.factor(model$cluster))

model2=kmeans(d,centers=2,nstart=10)
#100*model2$betweens/model2$totss

model3=kmeans(d,centers=2)
#100*model3$betweens/model3$totss

res_kmeans=parameters::cluster_analysis(d,n=3,method="kmeans")

setEPS()
postscript("cluster-centers-3.eps")
plot(summary(res_kmeans))
dummy=dev.off()
