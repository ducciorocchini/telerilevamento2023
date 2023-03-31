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
