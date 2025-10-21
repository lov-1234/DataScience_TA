###############################################
# Categorical variable

Melbourne <- read.csv("melbournehousing.csv", header = T)

table(as.factor(Melbourne$Type))
table(as.factor(Melbourne$Type))/sum(table(as.factor(Melbourne$Type)))

###############################################
# Continous variable

library(HistData)
data(Arbuthnot)
Arbuthnot
?Arbuthnot
#write.csv(Arbuthnot,"Arbuthnot.csv")

attach(Arbuthnot)
# location 
summary(Arbuthnot$Ratio)
hist(Arbuthnot$Ratio, breaks = 10) # for mode

# spread
sd(Arbuthnot$Ratio)

# skew
boxplot(Arbuthnot$Ratio,horizontal=TRUE)



###############################################
# Categorical variable

Melbourne <- read.csv("melbournehousing.csv", header = T)

# Cross-tabulation
RegionType<-table(as.factor(Melbourne$Regionname),as.factor(Melbourne$Type))
RegionType

# Normalized
RegionTypeTot<-apply(RegionType,1,sum)
RegionType/RegionTypeTot

# Townhouse sales are most popular in Southern Metropolitan (9.1%)



############################################
# Categorical and continous variable
data("Nightingale")
Nightingale
?Nightingale
#write.csv(Nightingale,"Nightingale.csv")
attach(Nightingale)
boxplot(Wounds~Month)



############################################
# Multiple continous variables

data(Armada)
Armada
?Armada
#write.csv(Armada, "Armada.csv")
attach(Armada)
plot(ships,artillery) #no obviously strong relationship (perhaps slight increase)
plot(artillery,balls) #almost perfect relationship
abline(0,50) # approximately 50 cannon balls per piece of artillery


