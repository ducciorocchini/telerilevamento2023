# My first code in Git Hub
# Let's install the raster package

install.packages("raster")

library(raster)

# Import data, setting the working directory
setwd("~/lab/") # Linux
# setwd("/Users/emma/desktop/lab") #mac
# setwd("C:/lab/") # windows

l2011 <- brick("p224r63_2011_masked.grd")

# plotting the data in a savage manner
plot(l2011)


cl <- colorRampPalette(c("red","orange","yellow"))(100) # 100 sono le sfumature
plot(l2011, col=cl)

# plotting one element
plot(l2011[[4]], col=cl)

plot(l2011$B4_sre, col=cl)

nir <- l2011[[4]] # or: nir <- l2011$B4_sre
plot(nir, col=cl)

# Exercise: change the colour gamut for all the images
cl <- colorRampPalette(c("cyan","azure","darkorchid","aquamarine"))(100) # 100 sono le sfumature
plot(l2011, col=cl)

# Exercise: plot the NIR band
# b1=blue
# b2=green
# b3=red
# b4=NIR

plot(l2011[[4]], col=cl)
plot(l2011$B4_sre, col=cl)

#dev.off() # it closes graphs

# Export graphs in R
pdf("myfirstgraph.pdf")
plot(l2011$B4_sre, col=cl)
dev.off()

# Plotting several bands in a multiframe
par(mfrow=c(2,1))
plot(l2011[[3]], col=cl)
plot(l2011[[4]], col=cl)

# Plotting the first 4 layers / bands
par(mfrow=c(2,2))

# blue
clb <- colorRampPalette(c("blue4","blue2","light blue"))(100) # 100 sono le sfumature
plot(l2011[[1]], col=clb)

clg <- colorRampPalette(c("chartreuse4","chartreuse2","chartreuse"))(100) # 100 sono le sfumature
plot(l2011[[2]], col=clg)

clr <- colorRampPalette(c("coral3","coral1","coral"))(100) # 100 sono le sfumature
plot(l2011[[3]], col=clr)

cln <- colorRampPalette(c("darkorchid4","darkorchid2","darkorchid4"))(100) # 100 sono le sfumature
plot(l2011[[4]], col=cln)






