#cambiar la ruta del interprete

setwd("~/Cursos/Cursos/Machine learning & Data Mining/Proyectos/GPCRs/");


rm(list=ls());

library(ISLR)

#leer datos
AAC <- read.table("AAC.csv", header = TRUE,sep = ",");


summary(AAC)

modelo <- glm(class ~ x1+x2+x3  , data = AAC)
summary(modelo)


