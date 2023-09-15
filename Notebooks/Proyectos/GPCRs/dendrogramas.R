
#cambiar la ruta del interprete

setwd("~/Cursos/Cursos/Machine learning & Data Mining/Proyectos/GPCRs/");


rm(list=ls());


library(cluster)
set.seed(999)

#iris2 <- iris[sample(x = 1:150,size = 50,replace = F),]

AAC <- read.table("ACC.csv", header = TRUE,sep = ",");


clrs <- rainbow(n = 7) # create palette
clrs <- clrs[AAC$class] # assign colors
#plot(x = iris$Sepal.Length,y = iris$Sepal.Width,col=clrs) # simple test colors


# cluster
dt <- cbind(AAC,clrs)
dt <- dt[sample(x ,size = 100,replace = F),] # create short dataset for visualization convenience
empty.labl <- gsub("."," ",dt$class) # create a space vector with length of names intended for  reserve place to future text labels
dst <- dist(x = scale(dt[,1:4]),method = "manhattan")
hcl <- hclust(d = dst,method = "complete")
plot(hcl,hang=-1,cex=1,labels = empty.labl, xlab = NA,sub=NA)

dt <- dt[hcl$order,] # sort rows for  order objects in dendrogramm


text(x = seq(nrow(dt)), y=-.5,labels = dt$class,srt=90,cex=.8,xpd=NA,adj=c(1,0.7),col=as.character(dt$clrs))