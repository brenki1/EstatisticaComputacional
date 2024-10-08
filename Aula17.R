library(dplyr)
library(tidytext) 
library(SnowballC) #lematização
library(quanteda) #analise quantitativa texto 
library(quanteda.textmodels) #modelagem de texto

noticias <- read.csv("noticias.csv", header = TRUE)

stopwords_pt <- data.frame(word = stopwords("pt"))

noticias [1,] |>
  unnest_tokens(word,texto) |>
  anti_join(stopwords_pt) |>
  count(word, sort = TRUE) |>
  top_n(20)

noticias [1,] |>
  unnest_tokens(word,texto) |>
  anti_join(stopwords_pt)  |>
  mutate(word = wordStem(word,"portuguese"))

noticias_tokens <- tokens(noticias$texto, remove_punct = TRUE, remove_symbols =  TRUE, remove_numbers = TRUE, remove_url = TRUE) |>
  tokens_remove(stopwords("pt")) |>
  tokens_wordstem(language = "portuguese")

matriz_frequencia <- dfm(noticias_tokens)

n <- round(0.8*nrow(noticias))
indices <- sample(1:nrow(noticias), size = n, replace = FALSE)

treino <- matriz_frequencia[indices,]
teste <- matriz_frequencia[-indices,]

modelo_nb <- textmodel_nb(treino, noticias$categorias[indices])

previsao <- predict(modelo_nb, newdata = teste)

mean(previsao == noticias$categorias[-indices])
