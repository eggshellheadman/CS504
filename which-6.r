od=read.csv(file="cluster.csv",sep=",",header=TRUE,row.names=NULL)
od=od[,-1]
od=od[,-1]

d=scale(od)

model=kmeans(na.omit(d),centers=3)

d_cluster=data.frame(d,cluster=as.factor(model$cluster))

model2=kmeans(d,centers=2,nstart=10)

model3=kmeans(d,centers=3)

res_kmeans=parameters::cluster_analysis(d,n=4,method="kmeans")

cairo_ps(filename="which-6.eps")
factoextra::fviz_cluster(model3,data=d)

