# R code for importing and analysing several images

library(raster)

setwd("~/lab/greenland") # Linux
# setwd("C:/lab/greenland") # Windows
# setwd("/Users/name/Desktop/lab/greenland") # Mac

lst_2000 <- raster("lst_2000.tif") # rast for those using the terra package
plot(lst_2000)

# Exercise: import all the data
lst_2005 <- raster("lst_2005.tif")
lst_2010 <- raster("lst_2010.tif")
lst_2015 <- raster("lst_2015.tif")

ls()

rlist <- list.files(pattern="lst")
rlist

import <- lapply(rlist, raster)
import

TGr <- stack(import) # in terra::c
TGr

plotRGB(TGr, r=1, g=2, b=3, stretch="lin") 
plotRGB(TGr, r=2, g=3, b=4, stretch="lin") 

# difference:
dift = TGr[[2]] - TGr[[1]]

cl <- colorRampPalette(c("blue","light blue","pink","red"))(100)
plot(TGr, col=cl)

#----- Exercise 2: Eurpean NO2

setwd("~/lab/en") # Linux
# setwd("C:/lab/en") # Windows
# setwd("/Users/name/Desktop/lab/en") # Mac

# importing a file
en_first <- raster("EN_0001.png")

cl <- colorRampPalette(c('red','orange','yellow'))(100) #
plot(en_first, col=cl)

rlist <- list.files(pattern="EN")
rlist

import <- lapply(rlist, raster)
import

EN <- stack(import) # in terra::c
EN

plot(EN, col=cl)

# check
par(mfrow=c(1,2))
plot(en_first, col=cl)
plot(EN[[1]], col=cl)

# check 2
difcheck = en_first - EN[[1]]
difcheck
plot(difcheck)

# first and last data
par(mfrow=c(1,2))
plot(EN[[1]], col=cl)
plot(EN[[13]], col=cl)

difen = EN[[1]]-EN[[13]]
cldif <- colorRampPalette(c('blue','white','red'))(100) #
plot(difen, col=cldif)

# plotRGB
plotRGB(EN, 1, 7, 13, stretch="lin")
plotRGB(EN, 1, 7, 13, stretch="hist")
