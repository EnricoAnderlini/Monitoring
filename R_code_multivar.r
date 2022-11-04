# Community ecology example with R
# Multivariate analysis

install.packages("vegan")
library(vegan)

setwd("~/lab/")

# to upload our project use the following function:
load("biomes_multivar.RData")
ls() # to read all the arguments or data

head(biomes) # plot per species matrix

biomes
biomes_types

multivar <- decorana(biomes)
multivar # information about the analysis done

plot(multivar)
attach(biomes_types)
ordiellipse(multivar, type, col=c("black", "red", "green", "blue"), kind = "ehull", lwd = 3) # plotting the points that belong to the same biome
ordispider(multivar, type, col=c("black", "red", "green", "blue"), label = T) # same as ordiellipse but we eant to see a label

# let's save the graph out of R
pdf("myfirstoutput.pdf") 
plot(multivar)
ordiellipse(multivar, type, col=c("black", "red", "green", "blue"), kind = "ehull", lwd = 3) 
ordispider(multivar, type, col=c("black", "red", "green", "blue"), label = T)
dev.off()

#Exercise: export a pdf
# with only the multivar plot
# 5 minutes
pdf("multivarperse.pdf")
plot(multivar)
dev.off()

