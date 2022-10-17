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
