library(tidytext)
library(dplyr)
library(ggplot2)
library(tidyr)
library(stopwords)
library(rvest)

url <- "https://www.bbc.com/portuguese/articles/c3dv8yy3d8jo"

html <- read_html(url)
texto <- html |>
  html_elements("p.bbc-hhl7in") |>
  html_text2() |>
  paste0(collapse = " ")

conjunto <- data.frame(texto)

conjunto |>
  unnest_tokens(output = word, input = texto) |>
  count(word, sort = TRUE) |>
  top_n(10)

stopwords_br <- data.frame(word = stopwords("pt"))
conjunto |>
  unnest_tokens(output = word, input = texto) |>
  anti_join(stopwords_br) |>
  count(word, sort = TRUE) |>
      top_n(10) |>
  mutate(word = reorder(word,n)) |>
  ggplot(aes(x = n, y = word))+
  geom_col(color = "purple",fill = "#fc03e3") +
  theme_minimal()

library(janeaustenr)

stopwords_en <- data.frame(word = stopwords("en"))
livro <- prideprejudice
conjunto <- data.frame(livro)
conjunto |>
  unnest_tokens(output = word, input = livro) |>
  anti_join(stopwords_en) |>
  count(word, sort = TRUE) |>
    top_n(10) |>
  mutate(word = reorder(word,n)) |>
  ggplot(aes(x = n,y=word)) +
  geom_col(color = "yellow", fill = "red") +
  theme_minimal()
     
sentimentos <- get_sentiments("bing")
library("stringr")
livro <- data.frame(texto = livro)
capitulos <- str_detect(livro$texto, "^Chapter \\d+")
capitulos <- cumsum(capitulos)

livro |>
  mutate(capitulo = capitulos) |>
  unnest_tokens(word,texto) |>
  inner_join(sentimentos) |>
  count(capitulo,sentiment) |>
  spread(sentiment,n,fill=0) |>
  mutate(total = positive - negative) |>
  ggplot(aes(x = capitulo, y = total)) +
  geom_col(color = "black", fill = "cyan") +
  theme_minimal()

