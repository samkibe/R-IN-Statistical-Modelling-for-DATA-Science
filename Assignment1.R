install.packages("crayon")
install.packages("ggplot2")

#q1 In the malaria data set analyze the risk of Malaria with age and log-transformed antibody level as explanatory variables.
library(ISwR)
library(ggplot2)

data("malaria")
malaria
model <- glm(mal ~ age + ab, data = malaria, family = binomial(link = "logit"))
#output regression model 
summary(model)

#q3 ) In the analysis of malaria and graft.vs. host data, try using the confint function from the mass package to find the improved confidence intervals for the regression coefficients.
# Assuming you've already fitted the model for the malaria dataset as above
# Load the MASS package if not already loaded
library(MASS)
# Calculate improved confidence intervals
conf_intervals_malaria <- confint(model)
# View 
print(conf_intervals_malaria)

#q1 In the malaria data set analyze the risk of Malaria with age and log-transformed antibody level as explanatory variables.
#Scatterplot with age on the x-axis and ab on the y-axis
ggplot(malaria, aes(x = age, y = ab, color = mal)) +
  geom_point() +labs(title = "Scatterplot of Age vs. Log-Transformed Antibody Level")

#q2 Fit a logistic regression model to graft.vs. host data set predicting the gvhd response.
library(ISwR)
data(package = "ISwR")
data("graft.vs.host")
graft.vs.host 

# Fit the logistic regression model
model <- glm(gvhd ~ time, data = graft.vs.host, family = binomial(link = "logit"))
#output regression model 
summary(model)

#q3 In the analysis of malaria and graft.vs. host data, try using the confint function from the mass package to find the improved confidence intervals for the regression coefficients.
# Assuming you've already fitted the model for the graft.vs.host dataset as above
# Load the MASS package if not already loaded
library(MASS)
conf_intervals_graft.vs.host<- confint(model)
# View the improved confidence intervals
print(conf_intervals_graft.vs.host)

#q4 A probit regression is just like a logistic regression, but using a different link function. Try the analysis of the menarche variable in the juul data set with this link. Does the fit improve?
library(ISwR)
data(package = "ISwR")
data("juul")
juul
menarche
# Fit the Probit regression model
model <- glm(menarche ~ ., data = juul, family = binomial(link = "probit"))



