# To import Dataset from the external Harddrive
v<-read.csv(file.choose())
View(v) # To see the dataset
pairs(v[2:6]) # Ploting data againest each and every column
# splitting dataset on percentage basis
set.seed(123) # To keep the Random Values constantly
split<-sample(1:nrow(v),0.70*nrow(v)) #Take 70% data randomly
train<-v[split,] # Taking the data of split from v data set
test<-v[-split,] # Taking the data  from v data set except the data of split
# Implimenting the model multiple Linear Regression
model<-lm(lc~Mileage+lh,data = train) # predicting lc with mileage and lh data 
model
summary(model)
# prediction
pred<-predict(model,data = test)
pred
# Comparing predicted values  vs  actual values
plot(test$lc,type = "l",col="blue")
lines(pred,type = "l",col="red")

#########Anova#################
reduced<-lm(lc~lh,data = train)
full<-lm(lc~Mileage+lh,data = train)
anova(reduced,full)
##################################
pred1<-predict(reduced,test)
plot(test$lc,type = "l",col="blue")
lines(pred1,type = "l",col="red")
