library(ggplot2)
library(palmerpenguins)
library(dplyr)

dados <- read.table(file = "grilo.txt", sep = ',',header = TRUE)

ggplot(data = dados, aes(x = temperatura, y = frequencia))+
  geom_point() +
  theme_minimal() +
  geom_smooth(method = "lm")

ggplot(data = dados, aes(x = frequencia)) +
  geom_histogram(bins = 10)+
  theme_minimal()

cor(dados)
  
modelo_linear <- lm(formula = frequencia ~ temperatura, data = dados)

modelo_linear
summary(dados$temperatura)

w <- data.frame(temperatura = c(21,23.6,30.9))

predict(modelo_linear, newdata = w)

dados <- penguins

dados <- na.omit(dados)

summary(dados)

ggplot(data = dados, aes(x = flipper_length_mm, y = body_mass_g, color = species))+
  geom_point()+
  geom_smooth(method = "lm") +
  theme_minimal()

cor(dados$flipper_length_mm, dados$body_mass_g)

dados |>
  filter(species == "Gentoo") |>
  select(flipper_length_mm, body_mass_g) |>
  cor()

dados |>
  filter(species == "Chinstrap") |>
  select(flipper_length_mm, body_mass_g) |>
  cor()

dados |>
  filter(species == "Adelie") |>
  select(flipper_length_mm, body_mass_g) |>
  cor()

modelo2 <- lm(formula = flipper_length_mm ~ body_mass_g + bill_length_mm, data = dados)

modelo2
summary(modelo2)
