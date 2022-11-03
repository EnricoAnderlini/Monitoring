# Community ecology example with R
# Multivariate analysis

install.packages("vegan")
library(vegan)

setwd("~/lab/")

# to upload our project use the following function:
load("biomes_multivar.RData")
ls()

head(biomes) # plot per species matrix

biomes
biomes_types

multivar <- decorana(biomes)
multivar # information about the analysis done

plot(multivar)
attach(biomes_types)
ordiellipse(multivar, type, col=c("black", "red", "green", "blue"), kind = "ehull", lwd=3)
