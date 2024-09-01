library(titanic)

head(titanic_train)

titanic_train <- na.omit(titanic_train) #ลบ NA
nrow(titanic_train)

#Split data
set.seed(42)
n <- nrow(titanic_train)
id <- sample(1:n , size = n*0.8)
train_dataTI <- titanic_train[id ,]
test_dataTI <- titanic_train[-id ,]

##train model
logis <- glm(Survived ~ Pclass + Age , data = train_dataTI , family = "binomial")

#หาค่า prob
train_dataTI$prob <- predict(logis,type = "response")

#หาค่า predict
train_dataTI$pred <- if_else(train_dataTI$prob < 0.5,0,1)
mean(train_dataTI$pred == train_dataTI$Survived)

-----------------------------------------------
##test model
#หาค่า prob
test_dataTI$prob <- predict(logis,newdata = test_dataTI,type = "response")

#หาค่า pred
test_dataTI$pred <- if_else(test_dataTI$prob < 0.5,0,1)

mean(test_dataTI$pred == test_dataTI$Survived)

#Accuracy
mean(train_dataTI$pred == train_dataTI$Survived)
mean(test_dataTI$pred == test_dataTI$Survived)
