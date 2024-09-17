library(ggplot2)
library(class)
library(rpart)
library(rpart.plot)

cancer <- read.table(file = "cancer.csv", sep = ",", header = TRUE)
cancer <- na.omit(cancer)
str(cancer)

n <- round(0.8*nrow(cancer))
indices_treino <- sample(1:nrow(cancer), size = n, replace = FALSE)

treino <- cancer[indices_treino,]
teste <- cancer[-indices_teste,]

treino_padronizado <- scale(treino[,-1])
teste_padronizado <- scale(teste[,-1])

classe_treino <- treino$diagnosis
classe_teste <- teste$diagnosis

modelo <- knn(train = treino_padronizado, test = teste_padronizado, cl = classe_treino, k = 1)

mean(teste$diagnosis == modelo)

modelo.arvore <- rpart(formula = diagnosis~ ., data = treino, method = "class")
rpart.plot(modelo.arvore, extra = 101)

previsao <- predict(modelo.arvore, newdata = teste, type = "class")

mean(previsao == teste$diagnosis)