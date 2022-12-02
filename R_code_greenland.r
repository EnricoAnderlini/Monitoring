library(raster)
library(ggplot2)
library(RStoolbox)
library(viridis)

setwd("C:/Users/enric/Desktop/lab")

lst_2000 <- raster("lst_2000.tif")
lst_2000

ggplot() +
+ geom_raster(lst_2000, mapping=aes(x=x, y=y, fill=lst_2000))
+ scale_fill_viridis(option="magma", direction=-1, alpha=0.8)
ggtitle("Temperature 2000)

# Upload all the data

lst_2005 <- raster("lst_2005.tif")
lst_2010 <- raster("lst_2010.tif")
lst_2015 <- raster("lst_2015.tif")

par(mfrow(c(2,2))
plot(lst_2000)
plot(lst_2005)
plot(lst_2010)
plot(lst_2015)

#using the lapply function
rlist <- list.files(patterns="lst")
rlist

lapply(X, FUN)
import <- lapply(rlist, raster)

#stack
Tgr <- stack(import)
Tgr
Plot(Tgr) # faster adn easier way to create +par(mfrow=c(2,2))

p1 <- ggplot() +
geom_raster(Tgr[[1]], mapping=aes(x=x, y=y, fill=lst_2000)) +
scale_fill_viridis(option="magma", direction=1, alpha=0.8) +
ggtitle("Temperature 2000")

p2 <- ggplot() +
geom_raster(Tgr[[4]], mapping=aes(x=x, y=y, fill=lst_2015)) +
scale_fill_viridis(option="magma", direction=1, alpha=0.8) +
ggtitle("Temperature 2015")
 
 p1 + p2
 
dift = Tgr[[4]] - Tgr[[1]]

p3 <- ggplot() +
geom_raster(dift, mapping=aes(x=x, y=y, fill=lst_2015)) +
scale_fill_viridis(option="inferno", direction=-1, alpha=0.8) +
ggtitle("Difference in temperature from 2000 to 2015")

