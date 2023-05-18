# R code for species distribution modelling
# Species Distribution Modelling

# install.packages("sdm")
# install.packages("rgdal", dependencies=T)

library(sdm)
library(raster) # predictors
library(rgdal) # species

file <- system.file("external/species.shp", package="sdm")
file

species <- shapefile(file) # this function only works with the raster package
# with the terra package, make use of vect
species

plot(species, pch=19)

presences <- species[species$Occurrence == 1,]
presences
plot(presences, col="blue", pch=19)

absences <- species[species$Occurrence == 0,]
absences
plot(absences, col="red", pch=19)

# plot together pres and abs
plot(presences, col="blue", pch=19)
points(absences, col="red", pch=19)


# predictors: look at the path
path <- system.file("external", package="sdm")
path

# list the predictors
lst <- list.files(path=path,pattern='asc$',full.names = T) #
lst

preds <- stack(lst)
plot(preds)

# plot preds
cl <- colorRampPalette(c('blue','orange','red','yellow')) (100)
plot(preds, col=cl)

plot(preds$elevation, col=cl)
points(presences, pch=19)

plot(preds$temperature, col=cl)
points(presences, pch=19)

plot(preds$precipitation, col=cl)
points(presences, pch=19)

plot(preds$vegetation, col=cl)
points(presences, pch=19)

# model

datasdm <- sdmData(train=species, predictors=preds)

m1 <- sdm(Occurrence ~ temperature + elevation + precipitation + vegetation, data=datasdm, methods="glm")

p1 <- predict(m1, newdata=preds)
plot(p1, col=cl) 
points(presences, pch=19)

s1 <- stack(preds, p1)
plot(s1, col=cl)

names(s1) <- c('elevation', 'precipitation', 'temperature', 'vegetation', 'model')
# and then replot!:
plot(s1, col=cl)

# or:
names(s1[5]) <- "model"
plot(s1, col=cl)
