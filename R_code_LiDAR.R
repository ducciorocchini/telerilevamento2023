# 3D in R

setwd("~/lab/dati/")
library(raster)
library(ggplot2)
library(viridis)
library(patchwork)

dsm_2013 <- raster("2013Elevation_DigitalElevationModel-0.5m.tif") # or terra::rast

dsm_2013d <- as.data.frame(dsm_2013, xy=T)

names(dsm_2013d) <- c("x", "y", "z")

ggplot() +
geom_raster(dsm_2013d, mapping=aes(x=x, y=y, fill=z)) +
scale_fill_viridis() +
ggtitle("dsm 2013")

dtm_2013 <- raster("2013Elevation_DigitalTerrainModel-0.5m.tif")

dtm_2013d <- as.data.frame(dtm_2013, xy=T)

names(dtm_2013d) <- c("x", "y", "z")

ggplot() +
geom_raster(dtm_2013d, mapping=aes(x=x, y=y, fill=z)) +
scale_fill_viridis(option="magma") +
ggtitle("dtm 2013")

chm2013 <- dsm_2013 - dtm_2013

chm2013d <- as.data.frame(chm2013, xy=T)

names(chm2013d)

ggplot() +
geom_raster(chm2013d, mapping=aes(x=x, y=y, fill=layer)) +
scale_fill_viridis() +
ggtitle("chm 2013")

#---

p1 <- ggplot() +
geom_raster(dsm_2013d, mapping=aes(x=x, y=y, fill=z)) +
scale_fill_viridis() +
ggtitle("dsm 2013")

p2 <- ggplot() +
geom_raster(dtm_2013d, mapping=aes(x=x, y=y, fill=z)) +
scale_fill_viridis(option="magma") +
ggtitle("dtm 2013")

p3 <- ggplot() +
geom_raster(chm2013d, mapping=aes(x=x, y=y, fill=layer)) +
scale_fill_viridis() +
ggtitle("chm 2013")

# with patchwork:
p1 + p2 + p3


