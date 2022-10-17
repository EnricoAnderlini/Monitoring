# This is a code for investigating relationships among ecological variables

# We are using the sp package. To install it use:
# install.packages("sp")
library(sp) # you can also make use of require()

# We are using meuse:
# search for: "meuse dataset R sp package"
# https://cran.r-project.org/web/packages/gstat/vignettes/gstat.pdf

data(meuse)

View(meuse)

head(meuse)

names(meuse)

summary(meuse)

plot(cadmium, zinc) # error!

plot(meuse$cadmium, meuse$zinc)

cad <- meuse$cadmium
zin <- meuse$zinc
plot(cad, zin)

attach(meuse)
plot(cadmium, zinc)
# detach(meuse)

pairs(meuse)

plot(cadmium, zinc)
plot(cadmium, zinc, col='red') # col to change color
plot(cadmium, zinc, col='red', cex=2) # cex to change size of the points

meuse[,3:6] #cadmium copper lead zinc, from column 3 to 6
pol<- meuse[,3:6]
head(pol) # to show only the first rows 
pairs(pol, col='blue', cex=1.5)

pairs(cadmium + copper + lead + zinc, data=meuse)
pairs(~ cadmium + copper + lead + zinc, data=meuse)

coordinates(meuse) = ~x+y # to give the coordinates 
plot(meuse)
meuse

spplot(meuse, 'zinc', main= My graph!')

spplot(meuse, 'zinc', main='Concentration of zinc') # spplot is used to plot elements liek zinc, lead etc. spread in space

spplot(meuse, c('copper', 'zinc'))
spplot(meuse, c('copper', 'zinc','lead'))

bubble(meuse, 'zinc') # bubble means that instead of changing color, it's going to change size according to the values
