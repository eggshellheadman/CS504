od=read.csv(file="cluster.csv",sep=",",header=TRUE,row.names=NULL)
od=od[,-1]
od=od[,-1]

d=scale(od)

model=kmeans(na.omit(d),centers=2)

#model$cluster

d_cluster=data.frame(d,cluster=as.factor(model$cluster))

#head(d_cluster)

#(BSS=model$betweens)
#(TSS=model$totss)

#BSS/TSS*100

#print("A")
model2=kmeans(d,centers=2,nstart=10)
#100*model2$betweens/model2$totss

model3=kmeans(d,centers=2)
#100*model3$betweens/model3$totss

#install.packages("parameters")
#install.packages("see")
#install.packages("factoextra")
#install.packages("NbClust")

#library(factoextra)
#library(NbClust)

res_kmeans=parameters::cluster_analysis(d,n=3,method="kmeans")
#predict(res_kmeans)

setEPS()
postscript("which-3.eps")
#plot(summary(res_kmeans))
factoextra::fviz_nbclust(d,kmeans,method="silhouette",k.max=8)

