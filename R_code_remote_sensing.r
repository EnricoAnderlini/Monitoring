install.packages("raster")

library(raster)

setwd("C:/Users/enric/Desktop/lab")


p224r63_2011 <- brick("p224r63_2011_masked.grd")   # name of the file we want to use with the brick function to create layers

plot(p224r63_2011)
# dev.off()

cl <- colorRampPalette(c('black', 'grey', 'light grey'))(100) #100 for the gradation of colors 
plot(p224r63_2011, col=cl)

#plotting one band
#solution 1
plot(p224t63_2011$B1_sre, col=cl) #putting the name

plot(p224r63_2011[[1]], col=cl)

#Exercise: change the colour ramp palette with colours from dark to light blue 
clb <- colorRampPalette(c('dark blue', 'blue', 'light blue'))(100)
plot(p224r63_2011[[1]], col=clb)

par(mfrow=c(1,2)) # 1 and 2 are coloumn and rows, we are creating new entities
plot(p224r63_2011[[1]], col=cl)
plot(p224r63_2011[[2]], col=cl)

#Exercise: multiframe with 4 images(2x2)
par(mfrow=c(2,2))
plot(p224r63_2011[[1]], col=cl)
plot(p224r63_2011[[2]], col=cl)
plot(p224r63_2011[[3]], col=cl)
plot(p224r63_2011[[4]], col=cl)




