# R_code_ggplot2.r

# R ocde for ggplot2 based graphs

# install.packages("ggplot2")

library(ggplot2)

virus <- c(10, 30, 40, 50, 60, 80)
death <- c(100, 240, 310, 470, 580, 690)

data.frame(virus, death)

d <- data.frame(virus, death)

summary(d)

ggplot(d, aes(x=virus, y=death)) + geom_point()

ggplot(d, aes(x=virus, y=death)) + 
geom_point(size=3, col="coral", pch=17)

ggplot(d, aes(x=virus, y=death)) + 
geom_line()

ggplot(d, aes(x=virus, y=death)) + 
geom_point(size=3, col="coral", pch=17) +
geom_line(col="blue")

ggplot(d, aes(x=virus, y=death)) + 
geom_polygon()

# let's use our own data!
setwd("~/lab/")

covid <- read.table("covid_agg.csv")
covid <- read.table("covid_agg.csv", header=T)

covid

summary(covid)


ggplot(covid, aes(x=lon, y=lat)) + geom_point(col="red")

ggplot(covid, aes(x=lon, y=lat, size=cases)) + geom_point(col="red")
