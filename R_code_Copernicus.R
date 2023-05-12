# R ocde for downloading and visualizing Copernicus data

# install.packages("ncdf4")
library(ncdf4)
library(raster)
library(ggplot2)
library(viridis)

setwd("~/lab/") # Linux
# setwd("C:/lab/") # Windows
# setwd("/Users/name/Desktop/lab/") # Mac

# dataset: c_gls_SSM1km_202305090000_CEURO_S1CSAR_V1.2.1.nc

sc <- raster("c_gls_SSM1km_202305090000_CEURO_S1CSAR_V1.2.1.nc")
plot(sc)

# with the raster package -> RasterLayer
# with the terra package -> SpatRaster: it maintains the uncertainty data, so: 2 layers

scd <- as.data.frame(sc, xy=T)

ggplot() +
geom_raster(scd, mapping=aes(x=x, y=y, fill=Surface.Soil.Moisture)) +
ggtitle("Soil Moisture from Copernicus")

# Cropping an image
ext <- c(23, 30, 62, 68)
sc.crop <- crop(sc, ext)

# Exercise: plot via ggplot the cropped image
sc.crop.d <- as.data.frame(sc.crop, xy=T)
head(sc.crop.d)
names(sc.crop.d)

ggplot() +
geom_raster(sc.crop.d, mapping=aes(x=x, y=y, fill=Surface.Soil.Moisture)) +
ggtitle("Cropped Soil Moisture from Copernicus") +
scale_fill_viridis(option="cividis")


