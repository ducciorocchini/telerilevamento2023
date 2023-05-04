library(raster)
library(ggplot2)
# install.packages("viridis")
library(viridis)
library(patchwork)

setwd("~/lab/") # Linux
# setwd("C:/lab/") # Windows
# setwd("/Users/name/Desktop/lab/") # Mac

sen <- brick("sentinel.png")

# band1 = NIR
# band2 = red
# band3 = green

plotRGB(sen, 1, 2, 3, stretch="Lin")

nir <- sen[[1]]

sd3 <- focal(nir, matrix(1/9, 3, 3), fun=sd)
plot(sd3)

sd3d <- as.data.frame(sd3, xy=TRUE)

# plotting with ggplot2
ggplot() +
geom_raster(sd3d, mapping=aes(x=x, y=y, fill=layer))

# plotting with ggplot2 and viridis
ggplot() +
geom_raster(sd3d, mapping=aes(x=x, y=y, fill=layer)) +
scale_fill_viridis()

# in terra, instead of layer, there is focal_sd

ggplot() +
geom_raster(sd3d, mapping=aes(x=x, y=y, fill=layer)) +
scale_fill_viridis(option="magma")

# adding title
ggplot() +
geom_raster(sd3d, mapping=aes(x=x, y=y, fill=layer)) +
scale_fill_viridis(option="magma") +
ggtitle("Standard deviation via the magma colour scale")

# Multiframe with patchwork

# viridis
p1 <- ggplot() +
geom_raster(sd3d, mapping=aes(x=x, y=y, fill=layer)) +
scale_fill_viridis() +
ggtitle("Standard deviation via the viridis colour scale")

# inferno
p2 <- ggplot() +
geom_raster(sd3d, mapping=aes(x=x, y=y, fill=layer)) +
scale_fill_viridis(option="inferno") +
ggtitle("Standard deviation via the inferno colour scale")

p1 + p2

# Exercise: plot the original image (nir) and its standard deviation

nird <- as.data.frame(nir, xy=T)

p3 <- ggplot() +
geom_raster(nird, mapping=aes(x=x, y=y, fill=sentinel_1)) +
scale_fill_viridis(option="cividis") +
ggtitle("NIR via the cividis colour scale")

p3

p3 + p1


