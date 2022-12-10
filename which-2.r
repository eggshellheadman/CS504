od=read.csv(file="cluster.csv",sep=",",header=TRUE,row.names=NULL)
od=od[,-1]
od=od[,-1]
d=scale(od)

model=kmeans(na.omit(d),centers=2)

d_cluster=data.frame(d,cluster=as.factor(model$cluster))

model2=kmeans(d,centers=2,nstart=10)

model3=kmeans(d,centers=2)

res_kmeans=parameters::cluster_analysis(d,n=3,method="kmeans")
#predict(res_kmeans)

setEPS()
postscript("which-2.eps")
plot(summary(res_kmeans))
factoextra::fviz_nbclust(d,kmeans,method="wss")+ggplot2::geom_vline(xintercept=4,linetype=2)+ggplot2::labs(subtitle="Elbow method")
dummy=dev.off()

