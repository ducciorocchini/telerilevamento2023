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
