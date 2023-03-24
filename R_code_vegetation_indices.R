# Calculating spectral indices

library(raster)

setwd("~/lab/") # Linux
# setwd("C:/lab/") # Windows
# setwd("/Users/name/Desktop/lab/") # Mac

# Exercise: import defor1_.png

l1992 <- brick("defor1_.png")

# Exercise: plot the image via plotRGB
plotRGB(l1992, r=1, g=2, b=3, stretch="Lin")

# What is NIR?
# NIR = 1
# RED = 2
# GREEN = 3

# plotRGB(l1992, r=4, g=3, b=2, stretch="Lin")
# export: 1, 2, 3

# Exercise: calculate DVI for 1992
dvi1992 = l1992[[1]] - l1992[[2]]

cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) # specifying a color scheme
plot(dvi1992, col=cl)
