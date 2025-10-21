# Tutorial 6

# a. The pollster is interested in estimating the 
#    fraction of people in the ENTIRE country supporting T
#   
#    p = (24+16)/100 = 0.4
#   
# b. E[\hat p] = (EX_r+EX_b)/10 = (5 x 0.8 + 5 x 0.3)/10 = 0.55
#    So the estimator is NOT unbiased.
#
# c. c = 0.4/0.55 =  0.73 (easy to check)
#    w = 0.2, because
#        0.4 = E[\hat p_2b] 
#            = w (EX_r/5)+(1-w)(EX_b/5) = 
#            = w x 0.8 + (1-w) x 0.3 
#            = 0.5 w + 0.3
#        so w = (0.4-0.3)/0.5
#
# d. strat2a is NOT a valid estimator, because it depends
#            explicitly on the true value 0.4. This is not 
#            allowed.
#    strat2b is a valid estimator, because it only depends
#            on information available at time of sampling.
#
# e. V(\hat p_strat2b) = V(0.2 X_r/5 + 0.8 X_b/5)
#                      = 0.04^2 V(X_r) + 0.16^2 V(X_b)
#                      = 0.04^2 x 5 x 0.8 x 0.2 + 0.16^2 x 5 x 0.3 x 0.7
v<-0.04^2 * 5 * 0.8 * 0.2 + 0.16^2 * 5 * 0.3 * 0.7
v
sqrt(v)
#   So the SD = 0.17 > 0.15 = SD(p_SRS)
#
# This means that stratification with non-proportional 
# sampling proportions can be worse than simple random 
# sampling!!
#
# f.

n<-10000
# simple
p.srs<-rbinom(n,10,0.4)/10
# proportional stratified
p.str<-(rbinom(n,2,0.8)+rbinom(n,8,.3))/10
# proportional stratified
p.str2b<-0.2*rbinom(n,5,0.8)/5+0.8*rbinom(n,5,.3)/5

mean(p.srs)
mean(p.str)
mean(p.str2b)
sd(p.srs)
sd(p.str)
sd(p.str2b)

# g. Apply CLT 2 times and use the fact that the sum of 
#    two normals is normal. Therefore:
#          p.str2b ~ N(0.4, 0.17^2)

# h.
hist(p.str2b,breaks=10,prob=TRUE)
x<-seq(0,1,length=100)
lines(x,dnorm(x,0.4,sqrt(v)))


            