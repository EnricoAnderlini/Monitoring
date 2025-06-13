# Setting the working directory
setwd("C:/Users/Utente/Desktop/Enrico/Università/Progetto Monitoring/Congo")

# Installation of packages
install.packages(c("terra", "imageRy" "ggplot2", "viridis", "dplyr")) 

# Loading the packages 
library(terra)
library(imageRy)
library(ggplot2)
library(viridis)
library(dplyr)

# using spatial resolution from 30m, because i can use the red and NIR (near-infrared) bands, which are the most suggested to measure the vegetation health status
nir23 <- rast("Giugno 23/LC08_L2SP_182062_20230622_20230630_02_T1_SR_B5.TIF")
red23 <- rast("Giugno 23/LC08_L2SP_182062_20230622_20230630_02_T1_SR_B4.TIF")
green23 <- rast("Giugno 23/LC08_L2SP_182062_20230622_20230630_02_T1_SR_B3.TIF")
blue23 <- rast("Giugno 23/LC08_L2SP_182062_20230622_20230630_02_T1_SR_B2.TIF")
### Stacking every layer in a single raster
Congo2023 <- c(red23, green23, blue23, nir23)
### Doing it for the year 2013
nir13 <- rast("Luglio 13/LC08_L2SP_182062_20130728_20200912_02_T1_SR_B5.TIF")
red13 <- rast("Luglio 13/LC08_L2SP_182062_20130728_20200912_02_T1_SR_B4.TIF")
green13 <- rast("Luglio 13/LC08_L2SP_182062_20130728_20200912_02_T1_SR_B3.TIF")
blue13 <- rast("Luglio 13/LC08_L2SP_182062_20130728_20200912_02_T1_SR_B2.TIF")
Congo2013 <- c(red13, green13, blue13, nir13)
im.plotRGB(Congo2013, r=1, g=2, b=3) # Natural colors
im.plotRGB(Congo2013, r=4, g=2, b=3) # False color vegetation red
im.plotRGB(Congo2013, r=3, g=2, b=4) # False color vegetation green
im.plotRGB(Congo2013, r=3, g=4, b=2) # False color vegetation blue
###
par(mfrow=c(3,2))
im.plotRGB(Congo2023, r=4, g=2, b=3)
im.plotRGB(Congo2013, r=4, g=2, b=3)
im.plotRGB(Congo2023, r=3, g=2, b=4)
im.plotRGB(Congo2013, r=3, g=2, b=4)
im.plotRGB(Congo2023, r=3, g=4, b=2)
im.plotRGB(Congo2013, r=3, g=4, b=2)
# calulate DVI & NDVI
dvi2013 = Congo2013[[4]] - Congo2013[[1]]
dvi2023 = Congo2023[[4]] - Congo2023[[1]]
col_dvi <- colorRampPalette(c("yellow", "ligthblue", "darkgreen")) (100) ### select a new palette of colors
par(mfrow=c(1,2))
plot(dvi2013, col=col_dvi)
plot(dvi2023, col=col_dvi)
ndvi2013 = dvi2013 / (Congo2013[[4]] + Congo2013[[1]])
ndvi2023 = dvi2023 / (Congo2023[[4]] + Congo2023[[1]])
col_ndvi <- colorRampPalette(c("orange", "purple", "black")) (100)
par(mfrow=c(1,2))
plot(ndvi2013, col=col_ndvi)
plot(ndvi2023, col=col_ndvi)
### 
nir18 <- rast("Giugno18/LC08_L2SP_182062_20180608_20200831_02_T1_SR_B5.TIF")
red18 <- rast("Giugno18/LC08_L2SP_182062_20180608_20200831_02_T1_SR_B4.TIF")
green18 <- rast("Giugno18/LC08_L2SP_182062_20180608_20200831_02_T1_SR_B3.TIF") 
blue18 <- rast("Giugno18/LC08_L2SP_182062_20180608_20200831_02_T1_SR_B2.TIF")
Congo2018 <- c(red18, green18, blue18, nir18)
im.plotRGB(Congo2018, r=1, g=2, b=3)
par(mfrow=c(1,2))
im.plotRGB(Congo2018, r=1, g=2, b=3)
im.plotRGB(Congo2023, r=1, g=2, b=3)
dvi2018 = Congo2018[[4]] - Congo2018[[1]]
ndvi2018 = dvi2018 / (Congo2018[[4]] + Congo2018[[1]])
par(mfrow=c(2,2))
plot(dvi2018, col=col_dvi)
plot(dvi2023, col=col_dvi)
plot(ndvi2018, col=col_ndvi)
plot(ndvi2023, col=col_ndvi)
par(mfrow=c(1,3))
plot(ndvi2013, col=col_ndvi)
plot(ndvi2018, col=col_ndvi)
plot(ndvi2023, col=col_ndvi)
par(mfrow=c(1,3))
plot(dvi2013, col=col_dvi)
plot(dvi2018, col=col_dvi)
plot(dvi2023, col=col_dvi)
###
# calulate and plot the standard deviation 3 x 3
sd3nir23 <- focal(nir23, matrix(1/9, 3, 3), fun=sd)
plot(sd3nir23)
sd3nir13 <- focal(nir13, matrix(1/9, 3, 3), fun=sd)
plot(sd3nir13)
sd3nir18 <- focal(nir18, matrix(1/9, 3, 3), fun=sd)
plot(sd3nir18)
par(mfrow=c(1,3))
plot(sd3nir13)
plot(sd3nir18)
plot(sd3nir23)


# Creation of a data frame to plot an histogram with the NDVI values
ndvi_rasters <- list("2013" = ndvi2013, "2018" = ndvi2018, "2023" = ndvi2023)
rast_to_df <- function(r, anno, tipo){
+     df <- as.data.frame(r, xy = FALSE, na.rm = TRUE)
+     data.frame(value = df[,1], year = anno, type = tipo)
#
 df_ndvi <- bind_rows(lapply(names(ndvi_rasters),
+                             function(y) rast_to_df(ndvi_rasters[[y]], y, "NDVI")))
# plotting the histogram
 ggplot(df_ndvi, aes(x = value, fill = year)) +
+     geom_histogram(aes(y = ..density..), bins = 50, alpha = 0.6, position = "identity") +
+     facet_wrap(~ type, scales = "free") +
+     labs(title = "Distribution NDVI", x = "Index values", y = "Density") +
+     theme_minimal()
# to save the image
hist_ndvi <-ggplot(df_ndvi, aes(x = value, fill = year)) +
+     +     geom_histogram(aes(y = ..density..), bins = 50, alpha = 0.6, position = "identity") +
+     +     facet_wrap(~ type, scales = "free") +
+     +     labs(title = "Distribution NDVI", x = "Index values", y = "Density") +
+     +     theme_minimal()
# plotting and saving also a boxplot fo the NDVI
boxplot_ndvi <- ggplot(df_ndvi, aes(x = year, y = value, fill = year)) +
+     geom_boxplot(outlier.shape = NA, alpha = 0.6) +
+     facet_wrap(~ type, scales = "free_y") +
+     labs(title = "Boxplot NDVI by year",
+          x = "Year", y = "Index value") +
