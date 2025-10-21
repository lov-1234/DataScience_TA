# Fitting Mayer data

library(HistData)
data(Mayer)
library(MASS)




#a. least squares: interpret coefficients, their significance, 
mayer.lm<-lm(Y~-1+X1+X2+X3,data=Mayer)
summary(mayer.lm)


#b. Diagnostics
par(mfrow=c(2,2))
plot(mayer.lm)






# Note: all 4 plots look good
# linearity, normality, perhaps slight decreasing variance,
# and no influential or outlying observations.

# c. stepwise AIC 
stepAIC(mayer.lm, k=2)

#######################################################


# Overfitting Galton
library(HistData)
attach(GaltonFamilies)
set.seed(1)
n<-nrow(GaltonFamilies)
p<-20
galton2<-data.frame(childHeight=childHeight,gender=gender,father=father,mother=mother, X=matrix(rnorm(n*p),ncol=p))


# a. exploratory analysis
pairs(galton2)

# b. father + mother + gender + all X
galton.lm<-lm(childHeight~ . ,data=galton2)
summary(galton.lm)

# c. Cross-validation
library(cv)
galton.cv<-cv(galton.lm)
summary(galton.cv)



library(MASS)
aic <- stepAIC(galton.lm,k=2)
bic <- stepAIC(galton.lm,k=log(n))
