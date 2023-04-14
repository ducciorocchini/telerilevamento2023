# Classification of remote sensing data via RStoolbox

library(raster)

setwd("~/lab/") # Linux
# setwd("C:/lab/") # Windows
# setwd("/Users/name/Desktop/lab/") # Mac

so <- brick("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")

plotRGB(so, 1, 2, 3, stretch="lin")
plotRGB(so, 1, 2, 3, stretch="hist")

# 1. Get values
singlenr <- getValues(so)
singlenr

# 2. kmeans
kcluster <- kmeans(singlenr, centers = 3)
kcluster

# 3. Set values to a raster on the basis of so
soclass <- setValues(so[[1]], kcluster$cluster) # assign new values to a raster object

cl <- colorRampPalette(c('yellow','black','red'))(100)
plot(soclass, col=cl)

# class 1: highest energy level
# class 2: medium energy level
# class 3: lowest energy level

frequencies <- freq(soclass)
tot = 2221440
percentages =  frequencies * 100 / tot

# class 1: highest energy level: 21.2%
# class 2: medium energy level: 41.4%
# class 3: lowest energy level: 37.3%


