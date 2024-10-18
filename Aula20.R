media <- mean(sample(1:6, size = 500, replace = TRUE))

resultados <- c()
for(j in 1:1000) {
  resultados[j] <- mean(sample(1:6, size = 500, replace = TRUE))
}

hist(resultados)

dados <- data.frame(resultados)

library(ggplot2)

ggplot(dados, aes(x=resultados))+
  geom_density(color = "#05ffe6", fill = "#ff05ee")+
  theme_minimal()

populacao <- sample(0:1, size =10000, replace = TRUE, prob = c(0.9,0.1))

valor_real = mean(populacao)

amostra <- sample(populacao, size = 500, replace = FALSE)

inferiores <- c()
superiores <- c()

for(k in 1:100) {
  amostra
}
