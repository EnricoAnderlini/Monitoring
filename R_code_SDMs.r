# R code for species distribution modelling reletaed to

install.packages("sdm")
library(sdm)
install.packages("rgdal")
library(rgdal)
library(raster) # for shape file

file <- system.file("external/species.shp", package="sdm") 
file

species <- shapefile(file)
plot(species)

sat[[1]]

presences <- species[species$Occurence== 1,]

# Exercise: select the absences
absences <- species[species$Occurrence == 0,]
plot(presences, col="blue", pch=19)
points(absences, col="red",pch=19)

# predictors
path <- system.file("external", package="sdm") 
lst <- list.files(path=path,pattern='asc$',full.names = T) #
lst

preds <- stack(lst)
preds

plot(preds$elevation)
points(presences)

plot(preds$temperature)
points(presences)

plot(preds$vegetation)
points(presences)

plot(preds$precipitation)
points(presences)

# model
datasdm <- sdmData(train=species, predictors=preds)
datasdm

m1 <- currence ~ elevation + precipation + temperature + vegetation, data=datasdm, methods="glm")
m1

p1 <- predict(m1, newdata=preds) 
plot(p1)

# final stack
s1 <- stack(preds, p1)
