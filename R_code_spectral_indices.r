# Calculating vegetation indices from remote sensing

library(raster)
library(RStoolbox) # for classification

setwd("C:/Users/enric/Desktop/lab")

l1992 <- brick("defor1.png")

# bands: 1 NIR, 2 red, 3 green

plotRGB(l1992, r=1, g=2, b=3, stretch="lin")

l2006 <- brick("defor2.png")

plotRGB(l2006, r=1, g=2, b=3, stretch="lin")

par(mfrow=c(2,1))
plotRGB(l1992, r=1, g=2, b=3, stretch="lin")
plotRGB(l2006, r=1, g=2, b=3, stretch="lin")

dvi1992 <- l1992[[1]] - l1992 [[2]]

cl <- colorRampPalette(c('darkblue', 'yellow', 'red', 'black'))(100)
plot(dvi1992, col=cl)

dvi2006 <- l2006[[1]] - l2006[[2]]
plot(dvi2006, col=cl)

par(mfrow=c(2,1))
dvi1992
dvi200680

#threshold for trees
# unsupervised classification (not stating anything to the software)  

d1c <- unsuperClass(l1992, nClasse=2)
d1c # composed by model and map
plot(d1c$map)

# 1992
# class 1: human impact - 34610
# class 2: forest - 306682

freq(d1c$map)
     value  count
[1,]     1  34610
[2,]     2 306682

# forest
f1992 <- 306682 / (306682+34610)
f1992

# human impact
h1992 <- 34610 / (306682+34610)
h1992

# classification 2006
d2c <- unsuperClass(l2006, nClasse=2)

# 2006
# class 2: forest - 178795
# class 1: human impact - 163931

 freq(d2c$map)
     value  count
[1,]     1 163931
[2,]     2 178795

# forest proportion in 2006
f2006 <- 178795 / (178795+163931)
f2006
[1] 0.521685

h2006 <- 163931 / (178795+163931)
h2006
[1] 0.478315

percentages <-  data.frame
