############################################
# Agricultural data

library(agridat)
data("rothamsted.brussels")
rb <- rothamsted.brussels

##############################
# 1a. Why not ask farmers?
# - if farmers are asked to choose their own treatment, then the poorest
#   farmers farming on the poorest land may select "none: no fertilizer",
#   whereas rich farmers farming on the most fertile land might select
#   the most expensive fertilizer.
# - In that case, "farm land fertility" and "farmer's wealth" may be two
#   (correlated) confounding variables.
#   Other forms of confounding may also be possible
# - Causal diagram:
#              fertilizer <-- farmer's wealth <--> fertility --> yield
#                  |                                               A
#                  |_______________________________________________|


# 1b How does randomization change the diagram:
#              fertilizer     farmer's wealth <--> fertility --> yield
#                  |                                               A
#                  |_______________________________________________|


# 1c. Research question:
# "What is the causal effect of fertilizer type on the average yield of
#  Brussels sprouts"

# 1d. Statistical Units: 48 lots of land on the Rothamsted agricultural
#                        research center
#     Population: All potential farmland where Brussels sprouts can be grown.


# 1e. Exploratory analysis
boxplot(yield~trt, rb, main="rothamsted.brussels")


# 1f. Formal analysis
brussels.aov1<-aov(yield~trt,data=rb)
summary(brussels.aov1)
brussels.lm1<-lm(yield~trt,data=rb)
summary(brussels.lm1)
coefficients <- coef(brussels.lm1)
sorted_treatments <- sort(coefficients[-1], decreasing = TRUE)
sorted_treatments


# 1g. plot yield variation
libs(desplot)
desplot(rothamsted.brussels, yield~col*row,
        num=trt, out1=block, cex=1, 
        main="rothamsted.brussels")

# 1h. blocks

# changes: blocks are quite variable in fertility, so accounting for this
#         changes the precision quite a bit (much higher precision now!)
# same: the actual results don't change too much. No fertilizer is still the worse.
#       High Sulphur is still the best.

text(rb$row,rb$col,labels = rb$block)

brussels.aov2<-aov(yield~trt+block,data=rb)
summary(brussels.aov2)

brussels.lm2<-lm(yield~trt+block,data=rb)
summary(brussels.lm2)


####################################
# Data lecture:
# CONFOUNDING
# ice cream <- temperature -> drownings
library(lubridate)
nday <- 365
day <- 1:nday + 54 * 365
e <- rnorm(nday + 2)
e <- e[-(1:2)] + e[-c(1, nday + 2)] + e[-c(nday + 1, nday + 2)]
temp <- 18 + 13 * sin(day / 365 * 2 * pi - pi / 1.5) + 3 * e
plot(as.Date(day), temp, type = "l")
drownings <- round(pmax(temp, 0) * .05 + rpois(nday, .1))
plot(as.Date(day), drownings, type = "l")
icecream <- round(pmax(temp, 0) * 20 + rnorm(nday, 0, 10))
plot(as.Date(day), icecream, type = "l")


pdf("drownings-icecream.pdf", width = 9, height = 4)
# Create the first plot
plot(as.Date(day), icecream,
     type = "l", col = "blue", lwd = 2,
     xlab = "Day of the Year", ylab = "Ice cream consumption",
     ylim = c(0, max(icecream))
)

# Add the second plot with `par(new = TRUE)` to overlay
par(new = TRUE)
plot(as.Date(day), drownings,
     type = "p", col = "red",
     axes = FALSE, xlab = "", ylab = "",
     ylim = c(0, max(drownings))
)

# Add the second y-axis
axis(4, col = "red", col.axis = "red")
mtext("Number of drowings", side = 4, line = 3, col = "red") # Label for the second y-axis

# Add a legend
legend("topleft", legend = c("ice cream consumption", "drownings"), col = c("blue", "red"), lwd = 2)
dev.off()

# regression does not account for confounding
summary(lm(drownings ~ icecream))

# RANDOMIZED EXPERIMENT
ice.random <- rbinom(nday, 1, .5) * 600
pdf("drownings-icerandom.pdf", width = 9, height = 4)
# Create the first plot
plot(as.Date(day), ice.random,
     type = "l", col = "blue", lwd = 2,
     xlab = "Day of the Year", ylab = "Ice cream consumption",
     ylim = c(0, max(icecream))
)
title("Randomize experiment")
# Add the second plot with `par(new = TRUE)` to overlay
par(new = TRUE)
plot(as.Date(day), drownings,
     type = "p", col = "red",
     axes = FALSE, xlab = "", ylab = "",
     ylim = c(0, max(drownings))
)

# Add the second y-axis
axis(4, col = "red", col.axis = "red")
mtext("Number of drowings", side = 4, line = 3, col = "red") # Label for the second y-axis

# Add a legend
legend("topleft", legend = c("ice cream consumption", "drownings"), col = c("blue", "red"), lwd = 2)
dev.off()


summary(lm(drownings ~ ice.random))


#############################################
# married men

n <- 214
married <- rbinom(n, 1, .5)
happiness <- 10 * rbeta(n, 5 + 4 * married, 3)
pdf("marriedmen.pdf", width = 9, height = 4)
boxplot(happiness ~ married, horizontal = TRUE)
dev.off()

summary(lm(happiness ~ married))

# Randomized experiment

married.random <- rbinom(n, 1, .5)
pdf("randommarriedmen.pdf", width = 9, height = 4)
boxplot(happiness ~ married.random, horizontal = TRUE)
dev.off()

summary(lm(happiness ~ married.random))




################################################
library(HistData)
data(CushnyPeebles)
# quick looks at the data
plot(CushnyPeebles)
boxplot(CushnyPeebles, ylab = "Hours of Sleep", xlab = "Treatment")
##########################
# Repeated measures MANOVA
CPmod <- lm(cbind(Control, L_hyoscyamine, L_hyoscine, DL_hyoscine) ~ 1, data = CushnyPeebles)
# Assign within-S factor and contrasts
Treatment <- factor(colnames(CushnyPeebles), levels = colnames(CushnyPeebles))
contrasts(Treatment) <- matrix(
     c(
          -3, 1, 1, 1,
          0, -2, 1, 1,
          0, 0, -1, 1
     ),
     ncol = 3
)
colnames(contrasts(Treatment)) <- c("Control.Drug", "L.DL", "L_hy.DL_hy")
Treats <- data.frame(Treatment)
if (require(car)) {
     (CPaov <- Anova(CPmod, idata = Treats, idesign = ~Treatment))
}
summary(CPaov, univariate = FALSE)

attach(CushnyPeebles)
sleep <- data.frame(sleep = c(Control, L_hyoscyamine, L_hyoscine, DL_hyoscine), ttt = c(rep("Control", 11), rep("L_hyoscyamine", 11), rep("L_hyoscine", 11), rep("DL_hyoscine", 11)))
sleep.aov <- aov(sleep ~ ttt, data = sleep)
summary(sleep.aov)
sleep.lm <- lm(sleep ~ ttt, data = sleep)
summary(sleep.lm)

plot(sleep.lm)

pdf("sleep.pdf", width = 7, height = 4)
boxplot(CushnyPeebles, horizontal = FALSE)
dev.off()
