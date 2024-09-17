library(ggplot2)
library(class)
library(rpart)
library(rpart.plot)
library(randomForest)


cancer <- read.csv("cancer.csv")
cancer <- na.omit(cancer)
str(cancer)
cancer$diagnosis <- as.factor(cancer$diagnosis)

n <- round(0.8*nrow(cancer))
set.seed(1731)
indices_treino <- sample(1:nrow(cancer), size = n, replace = FALSE)

treino <- cancer[indices_treino,]
teste <- cancer[-indices_treino,]

treino$diagnosis <- as.factor(treino$diagnosis)
teste$diagnosis <- as.factor(teste$diagnosis)

arvore <- rpart(formula = diagnosis ~., data = treino, method = "class")
previsao.arvore <- predict(arvore, newdata = teste, type = "class")

mean(previsao.arvore == teste$diagnosis)

floresta <- randomForest(formula = diagnosis ~ . , data = treino, ntree = 200)

floresta

previsao.floresta <- predict(floresta, newdata = teste, type = "class")

previsao.floresta
mean(previsao.floresta == teste$diagnosis)
