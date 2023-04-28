# How to reduce a multidimensional dataset

library(raster)
library(ggplot2)
library(viridis)

setwd("~/lab/") # Linux
# setwd("C:/lab/") # Windows
# setwd("/Users/name/Desktop/lab/") # Mac

sen <- brick("sentinel.png")

sen2 <- stack(sen[[1]], sen[[2]], sen[[3]])

sample <- sampleRandom(sen2, 10000)

pca <- prcomp(sample) # pca=principal component analysis

summary(pca)

pci <- predict(sen2, pca, index=c(1:3))
plot(pci)
plot(pci[[1]])

# ggplot

pcid <- as.data.frame(pci[[1]], xy=T)
pcid

ggplot() +
geom_raster(pcid, mapping=aes(x=x, y=y, fill=PC1)) +
scale_fill_viridis() # direction=-1 in case of reverse colour ramp

# focal sd
sd3 <- focal(pci[[1]], matrix(1/9, 3, 3), fun=sd)

sd3d <- as.data.frame(sd3, xy=T)

ggplot() +
geom_raster(sd3d, mapping=aes(x=x, y=y, fill=layer)) +
scale_fill_viridis()


