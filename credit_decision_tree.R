credit <- read.csv("d:/german_credit.csv")
str(credit)
hist(credit$Account.Balance,col="blue")
hist(credit$Purpose,col="red")
table(credit$Creditability)

set.seed(12345)
credit_rand <- credit[order(runif(1000)), ]
summary(credit$Credit.Amount)
summary(credit_rand$Credit.Amount)
credit_train <- credit_rand[1:900,]
credit_test <- credit_rand[901:1000,]
prop.table(table(credit_train$Creditability))
prop.table(table(credit_test$Creditability))
library(C50)
credit_model <- C5.0(credit_train[-21],as.factor(credit_train$Creditability))
summary(credit_model)
credit_pred <- predict(credit_model, credit_test)
library(gmodels)
CrossTable(as.factor(credit_test$Creditability), credit_pred, prop.chisq = FALSE, prop.c = FALSE, prop.r = FALSE, dnn = c('actual default', 'predicted default'))
credit_boost10 <- C5.0(credit_train[-21], as.factor(credit_train$Creditability), trials = 10)
credit_boost10
summary(credit_boost10)
credit_boost_pred10 <- predict(credit_boost10, credit_test)
CrossTable(as.factor(credit_test$Creditability), credit_pred, prop.chisq = FALSE, prop.c = FALSE, prop.r = FALSE, dnn = c('actual default', 'predicted default'))
