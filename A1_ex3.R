library(tidyverse)
#exercise 3
signif <- read.csv(file = "A1_Ex3_signif.csv")
not_signif <- read.csv(file = "A1_Ex3_not_signif.csv")
                            #question 1
#Null Hypothesis H0 : β = 0            Alternative Hypothesis H1 : β =/= 0
#  beta equals zero                          beta doesn't equal 0 


                            #question 2
#a)
#signif plot a)
ggplot(signif, aes(X,Y))+
  geom_point()+
  ggtitle("plot (a) signif")

#not_signif plot a)
ggplot(not_signif, aes(X,Y))+
  geom_point()+
  ggtitle("plot (a) not_signif")
#b)
#signif plot b)
sig_model <- lm(Y~X, data = signif) 
sig_res <- resid(sig_model)
ggplot(signif, aes(fitted(sig_model), sig_res))+
  geom_point()+
  labs(x = "fitted values", y = "residuals")+
  ggtitle("plot (b)")+
  geom_hline(yintercept = 0)

#not_signif plot b)
notsig_model <- lm(Y~X, data = not_signif) 
notsig_res <- resid(notsig_model)
ggplot(not_signif, aes(fitted(notsig_model), notsig_res))+
  geom_point()+
  labs(x = "fitted values", y = "residuals")+
  ggtitle("plot (b)")+
  geom_hline(yintercept = 0)
#c)
#signif plot c)
ggplot(signif, aes(x = sig_res))+
  geom_histogram()+
  labs(x = "residuals", y = "frequency", title = "plot (c)")

#not_signif plot c)
ggplot(not_signif, aes(x = notsig_res))+
  geom_histogram()+
  labs(x = "residuals", y = "frequency", title = "plot (c)")
                            #question 3
#signif
summary(sig_model)
sig_CI_lower <- -1.33448-0.2193*qt(0.975,498)
sig_CI_upper <- -1.33448+0.2193*qt(0.975,498)
sig_CI <- c(sig_CI_lower,sig_CI_upper)
#estimated slope of beta hat = -1.33448
#degrees of freedom = 498
#t value = -60.846
#95% CI : (-1.7653473, -0.9036127)
sig_CI
#p-value = 2.2*10^(-16)

#not_signif
summary(notsig_model)
notsig_CI_lower <- 0.005873-0.013700*qt(0.975,498)
notsig_CI_upper <- 0.005873+0.013700 *qt(0.975,498)
notsig_CI <- c(notsig_CI_lower,notsig_CI_upper)
#estimated slope of beta hat = 0.005873
#degrees of freedom = 498
#t value = 0.429  
#95% CI : (-0.02104392 , 0.03278992()
notsig_CI
#p-value = 0.6683

                            #question 4
#signif 
#reject the hypothesis at 55 significance as the p-value = 2.2*10^(-16) < 0.05. 
#hence accept the alternative hypothesis that beta =/= 0

#not signif
#accept the hypothesis as no effect was observed, this is due to p-value = 0.6683 > 0.05
#hence β could equal 0 we have no evidence to say otherwise

                            #question 5
#signif 
#there is sufficient evidence to say that x and y are linearly correlated in an equation 
#y = α+βx since we have evidence to say that β cannot equal to zero. hence, there is a linear
#relationship between x and y, hence we can reliably estimate y given x and vice-versa.

#notsignif
#there is no evidence to suggest that x nd y are linearly correlated at a 95% significance level
#hence theres no evidence to suggest that changing either x or y will have a linear effect on the other variable 
