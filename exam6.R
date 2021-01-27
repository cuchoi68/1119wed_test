basket <- readLines("basket.csv")
basket
basket_trans <- strsplit(basket,",")
basket_trans <- as(basket_trans,"transactions")
inspect(basket_trans)
basket_apriori <- apriori(basket_trans, parameter = list(support = 0.1, confidence=0.8))
inspect(basket_apriori)
inspect(subset(basket_apriori,subset = lift>1.2))
inspect(subset(basket_apriori,subset = lhs %in% c("»ï°ã»ì","»ý¼ö")))
inspect(subset(basket_apriori,subset = lhs %ain% c("»ï°ã»ì","»ý¼ö")))

apple <- read.csv("apple.csv")
summary(apple)
str(apple)
boxplot(weight ~model, data=apple)
boxplot(sugar ~model, data=apple)
boxplot(acid ~model, data=apple)
ggplot(data = apple, aes(x=color,fill=model))+geom_bar()
apple
install.packages("caret")
apple_index <- createDataPartition(apple$model, p=0.8, list=F )
apple_train <- apple[apple_index, ]
apple_test <- apple[-apple_index,]
nrow(apple_test)
apple_model <- rpart(model~., data = apple_train, control = rpart.control(minsplit = 3))
apple_model
rpart.plot(apple_model)
apple_predict <- predict(apple_model, apple_test, type="class")
apple_predict <- as.factor(apple_predict)
apple_predict
actual <- as.factor(actual)
actual
confusionMatrix(actual,apple_predict, mode="everything")
confusionMatrix(actual, apple_predict, mode = "everything")
actual
apple_predict
