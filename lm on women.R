# implementing linear Regression on women dataset
View(women)
w<-women # copying women dataset to a variable w
summary(w) # to get brief details on w
plot(w) # To see the plot of w
# splitting the data set into test and train
set.seed(123) # to take randomm sample constantly
split<-sample(1:nrow(w),size = 10) # sample() function take the data randomly from dataset
train<-w[split,] # assgning the values of split to train variable
test<-w[-split,] # assgning the values of w except the values in split to test variable
#  Creating the Linear model
model<-lm(weight~height,data = train)
summary(model)
# prediction
pred<-predict(model,test)
View(pred)
# Comparing Predicted vs actual
plot(test$weight,type = "l",col="blue") # ploting the original values
lines(pred,type = "l",col="red") # ploting the predicted values