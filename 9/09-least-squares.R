library(HistData)
data(Mayer)

#write.csv(Mayer,"mayer.csv")


# a. Solve Mayer's equations
attach(Mayer)
Y<-tapply(Mayer[,2],INDEX = Group, sum)
X<-cbind(tapply(Mayer[,3],INDEX = Group, sum),
        tapply(Mayer[,4],INDEX = Group, sum),
        tapply(Mayer[,5],INDEX = Group, sum))
pars<-solve(X,Y)
pars


# b. Solve Mayer's equations with different groupings
set.seed(2)
grp<-sample(rep(1:3,9))
YY<-tapply(Mayer[,2],INDEX = grp, sum)
XX<-cbind(tapply(Mayer[,3],INDEX = grp, sum),
         tapply(Mayer[,4],INDEX = grp, sum),
         tapply(Mayer[,5],INDEX = grp, sum))
pars2<-solve(XX,YY)
pars2


#c. least squares
mayer.lm<-lm(Y~-1+X1+X2+X3,data=Mayer)
summary(mayer.lm)

#d. Who is better? Mayer!
sum(abs(coef(mayer.lm)-pars))
sum(abs(coef(mayer.lm)-pars2))

#e. Matrix calculations
X<-model.matrix(mayer.lm)
solve(t(X)%*%X,t(X)%*%Mayer$Y)
coef(mayer.lm)



# Galton
#write.csv(GaltonFamilies,"galton.csv")

attach(GaltonFamilies)

# a. exploratory analysis
boxplot(childHeight~gender)
pairs(cbind(childHeight,father,mother))

# b. father + mother
galton.lm<-lm(childHeight~father+mother,data=GaltonFamilies)
summary(galton.lm)

# c. father + mother + gender
galton.lm<-lm(childHeight~gender+ father+mother,data=GaltonFamilies)
summary(galton.lm)
