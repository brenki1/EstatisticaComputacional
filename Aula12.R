library(httr2)
library(dplyr)
library(jsonlite)
library(httr)

url <- "https://blaze1.space/api/roulette_games/history?startDate=2024-08-14T16:43:23.553Z&endDate=2024-09-13T16:43:23.553Z&page=1"

GET(url)
dados <- content(GET(url), "text")

dados <- fromJSON(dados)
table(dados$records$color)

url_base <- "https://blaze1.space/api/roulette_games/history?startDate=2024-08-14T16:43:23.553Z&endDate=2024-09-13T16:43:23.553Z&page="

resultados <- c()

for(j in 1:50) {
  url <- paste0(url_base, j)
  dados <- content(GET(url), "text")
  dados <- fromJSON(dados)
  resultados <- c(resultados, dados$records$color)
}
prop.table(table(resultados))

library(rvest)

url <- "https://www.letras.mus.br/rage-against-the-machine/1343986/"
html <- read_html(url)

html |>
  html_elements("h1") |>
  html_text2()
  
letra <- html |>
  html_elements("div.lyric") |>
  html_elements("p") |>
  html_text2() |>
  paste(collapse = " ")

library(tidytext)
library(ggplot2)

letra <- data.frame(letra)
letra |>
  unnest_tokens(output = word, input = letra) |>
  count(word, sort = TRUE) |>
  head(n = 10) |>
  ggplot(aes(y = word, x = n)) +
  geom_col()
      
