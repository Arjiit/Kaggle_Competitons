# Writing this basic script to start up the competiton.
# I have used 3 feautres and done no feautre engineering.
# Going further will analyze more feautres and add it to it.


train<-read.csv("train.csv")
LogArea<-log10(train$GrLivArea)
LogPrice<-log10(train$SalePrice)
Quality<-train$OverallQual
Neighborhood<-as.factor(train$Neighborhood)
Model<-lm(LogPrice ~ LogArea + Quality + Neighborhood)
test<-read.csv("test.csv")
LogArea<-log10(test$GrLivArea)
Quality<-test$OverallQual
Neighborhood<-as.factor(test$Neighborhood)
simplefeautres<-data.frame(LogArea,Quality,Neighborhood)
Predictions<-predict(Model, simplefeautres)
salePrice<-10.0**Predictions
Id<-test$Id
submission<-data.frame(Id, salePrice)
write.csv(submission, "submission_1.csv", row.names = F)