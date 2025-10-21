############################################
# SPANISH ARMADA

library(HistData)
data(Armada)


###########################################################
# 1a. A lot of the information seems related to each other:
#     The number of ships, the number of sailors, men, artillery,
#     balls and gunpowder are clearly all related to each other. 
#     It is to be expected that the information can be compressed.

# 1b. visualization 
#     As can be seen from the pairs plots, there are several variables
#     that are highly related: soldiers-men and artillery-balls. Other
#     variables are also related, but much less strong that maybe 
#     suspected apriori.

# delete character variable
armada <- Armada[,-1]
pairs(Armada)


# 1c. PCA analysis
armada.pca <- prcomp(armada, scale.=TRUE)


# 1ci. variance explained
#      The first 4 PCAs explain more than 95% of all the variation


summary(armada.pca)
plot(armada.pca)


# 1cii. Rotation
#       PC1. Has almost the same coefficients for all variables. This
#            variable measures the overall size and strength of the Armada
#       PC2. This seems to be a CONTRAST between
#                        ships, tons, soldiers
#            on the one hand and
#                        sailors, gunpowder, lead 
#            on the other. 

armada.pca$rotation

# 1ciii. Biplot
#        - A1, A3 are particularly powerful ships, whereas A8-A10 are rather weak.
#        - A9 and A1 have more sailors, gunpowder and lead, for their size, 
#          whereas A7 and A8 rather less.
biplot(armada.pca) 



##########################################################
# 2. k-means clustering of digits


# 2a. download and read
dat<-read.csv("digit10x10.csv")
dat<-as.matrix(dat)


# 2b. visualize
#     Notice that these are (rotated) digits. If you notice carefully,
#     the digit 4 is missing. 

image(z=matrix(dat[210,],ncol=10))

par(mfrow=c(10,10))
apply(dat[1:100,],1,function(x){image(matrix(x,ncol=10))})
apply(dat[101:200,],1,function(x){image(matrix(x,ncol=10))})
apply(dat[201:300,],1,function(x){image(matrix(x,ncol=10))})
apply(dat[301:366,],1,function(x){image(matrix(x,ncol=10))})

# 2c. Apply k-means
par(mfrow=c(1,1))
dat.km<-kmeans(dat,centers = 10)


# 2d. How does clustering identify digits.
#     Consider the figures given above and match them. Notice that the 
#     cluster labels are completely arbitary. 
#     - we have given 1 more cluster than there are digits (4 is missing)
#     - the extra cluster splits the cluster of zeroes. 
#     - the other clusters are quite well idenfied,except:
#       * a bit of overlap between digits 3 and 5
#       * 2 clusters of 7s
#       * a bit of overlaps between digits 3 and 8.
#       * cluster for 9s is completely missed and put in the cluster of 5s.
plot(dat.km$cluster)

