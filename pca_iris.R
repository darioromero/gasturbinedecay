# Taking the numeric part of the IRIS data
data_iris <- iris[1:4]

# Calculating the covariance matrix
Cov_data <- cov(data_iris)
Cov_data

# Find out the eigenvectors and eigenvalues using the covariance matrix
Eigen_data <- eigen(Cov_data)
Eigen_data

# Using the inbuilt function
PCA_data <- princomp(data_iris ,cor="False")
PCA_data

# Let’s now compare the output variances
Eigen_data$values
PCA_data$sdev^2

# Comparing variance from both models
PCA_data$loadings[,1:4]
Eigen_data$vectors

# To understand the importance of every component
summary(PCA_data)

# To understand how our features are transformed we use biplot
biplot (PCA_data)

# The screeplot() function in R plots the components joined by a line
# To determine what should be an ‘ideal’ set of features we should take after using PCA
screeplot(PCA_data, type="lines")

#Select the first principal component for the second model
model2 = PCA_data$loadings[,1]
#For the second model, we need to calculate scores by multiplying our loadings with the data
model2_scores <- as.matrix(data_iris) %*% model2

#Loading libraries for naiveBayes model
library(class)
library(e1071)

#Fitting the first model over the entire data
mod1<-naiveBayes(iris[,1:4], iris[,5])
#Fitting the second model using the first principal component
mod2<-naiveBayes(model2_scores, iris[,5])

# Accuracy for the first model
table(predict(mod1, iris[,1:4]), iris[,5])

# Accuracy for the second model
table(predict(mod2, model2_scores), iris[,5])

library(skimr)
skim(iris)

