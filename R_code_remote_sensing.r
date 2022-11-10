install.packages("raster")

library(raster)

setwd("~/lab")

p224r63_2011 <- brick("p224r63_2011_masked.grd")   # name of the file we want to use with the brick function to create layers

plot(p224r63_2011)
# dev.off()

cl <- colorRampPalette(c('black', 'grey', 'light gray'))
