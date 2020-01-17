# Imporing the dataset
Cardiotocographic <- read.csv("G:/Datasets/Cardiotocographic.csv")
# Assigning dataset to the new variable
cc<-Cardiotocographic
# To see the structure of the data set
str(cc)
# Creating another variable with nsp factors
cc$NSPF <- as.factor(cc$NSP)
# Partitioning the dataset
set.seed(123)
pd<-sample(2,nrow(cc),replace=T,prob=c(0.7,0.3))
train<-cc[pd==1,]
test<-cc[pd==2,]
# Decision TRee with party package
library(party)
tree<-ctree(NSPF~LB+AC+FM,data = train)
tree
plot(tree)
# Predicting
pred<-predict(tree,data = test)
pred

# Decision tree using rpart package
library(rpart)
tree1<-rpart(NSPF~LB+AC+FM,data = train)
library(rpart.plot)
rpart.plot(tree1,extra = 4)
# Prediction
pred1<-predict(tree1,data = test)
pred1


# Missclassification error for "train" data
tab<-table(predict(tree),train$NSPF)
print(tab)
1-sum(diag(tab))/sum(tab)

# Missclassification error for "test" data
testpred<-predict(tree,newdata=test)
tab<-table(testpred,test$NSPF)
print(tab)
1-sum(diag(tab))/sum(tab)
