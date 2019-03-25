rm(list = ls())
gc()

setwd("C:\\Users\\User\\Desktop\\19학년도 회귀분석 및 실습\\Data\\Week2 Data")

# Read aflength data
aflength = read.csv("aflength.csv", header = TRUE, stringsAsFactors = FALSE)

# summarise aflength data
head(aflength)
summary(aflength)

# The scatter plot for aflength
plot(aflength[, -3], col = factor(aflength$gender), pch = 16)

# Estimating correlation coefficient and their test
cor(aflength[, -3])
cor.test(aflength$foot, aflength$forearm)

# Least square estimates
x = aflength$forearm
y = aflength$foot
sxx = sum((x - mean(x))^2)
sxy = sum((y - mean(y)) * (x - mean(x)))
beta1 = sxy / sxx
beta0 = mean(y) - beta1 * mean(x)

# Linear regression fitting
# Linear regression can be fitted using lm function
lm_fit = lm(foot ~ forearm, data = aflength)
summary(lm_fit)

# Plotting prediction (conditional mean) line 
plot(aflength[, -3], col = factor(aflength$gender), pch = 16)

# Derive a chi-square distribution from the standard normal distribution
n = 1000
normal_sample = rnorm(n)
X2 = normal_sample^2

hist(X2, probability = TRUE)
x = seq(0, max(X2), by = 0.1)
dchi = dchisq(x, df = 1)
lines(x, dchi, ylim = c(0, 1), col = "red")

# Hardness data
hardness_dat = data.frame(Temp = rep(c(30, 40, 50, 60), c(4, 3, 3, 4)), 
                          Hardness = c(55.8, 59.1, 54.8, 54.6, 43.1, 42.2, 45.2, 31.6, 30.9, 30.8, 17.5, 20.5, 17.2, 16.9))

head(hardness_dat)

# Plotting Hardness data
plot(hardness_dat)
lm_fit_hardness = lm(Hardness ~ Temp, data = hardness_dat)
abline(lm_fit_hardness, col = "red")

# Predicted value at Temp = 55
yhat = predict(lm_fit_hardness, newdata = data.frame(Temp = 55))
