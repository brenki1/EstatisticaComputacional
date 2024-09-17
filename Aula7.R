library(ggplot2)
library(palmerpenguins)
library(class)

data(penguins)
pinguins <- penguins
str(pinguins)
pinguins <- pinguins [,-c(2,7,8)]
pinguins <- na.omit(pinguins)

n <- round(0.8*nrow(pinguins))
n
indices_treino <- sample(1:nrow(pinguins), size = n, replace = FALSE)

treino <- pinguins[indices_treino,]
teste <- pinguins[-indices_treino,]
treino_padronizado <- scale(treino[,-1])
teste_padronizado <- scale(teste[,-1])

classe_treino <- treino$species
classe_teste <- teste$species

modelo1 <- knn(train = treino_padronizado, test = teste_padronizado, cl = classe_treino, k = 1)

mean(modelo1 == teste$species)

taxa_acerto <- c()
for(i in 1:10) {
  
  modelo2 <- knn(train = treino_padronizado, test = teste_padronizado, cl = classe_treino, k = i)
  
  taxa_acerto[i] <- mean(modelo2 == classe_teste)
}

df <- data.frame(k = 1:10, taxa_acerto)

ggplot(data = df, aes(x = k, y = taxa_acerto)) +
  geom_line()

cor(treino[,-1])

# ------------ UTILIZANDO cancer.csv ------------ #

cancer <- read.table(file = "cancer.csv", sep = ",", header = TRUE)
cancer <- na.omit(cancer)
str(cancer)

n <- round(0.8*nrow(cancer))
indices_treino <- sample(1:nrow(cancer), size = n, replace = FALSE)

treino <- cancer[indices_treino,]
teste <- cancer[-indices_treino,]

treino_padronizado <- scale(treino[,-1])
teste_padronizado <- scale(teste[,-1])

classe_treino <- treino$diagnosis
classe_teste <- teste$diagnosis


taxa_acerto <- c()
for(i in 1:10) {
  
  modelo2 <- knn(train = treino_padronizado, test = teste_padronizado, cl = classe_treino, k = i)

  taxa_acerto[i] <- mean(modelo2 == classe_teste)
}
table(modelo2, classe_teste)
df <- data.frame(k = 1:10, taxa_acerto)

ggplot(data = df, aes(x = k, y = taxa_acerto)) +
  geom_line()