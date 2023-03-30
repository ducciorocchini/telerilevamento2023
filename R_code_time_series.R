# R code for importing and analysing several images

library(raster)

setwd("~/lab/greenland") # Linux
# setwd("C:/lab/greenland") # Windows
# setwd("/Users/name/Desktop/lab/greenland") # Mac

lst_2000 <- raster("lst_2000.tif")
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
