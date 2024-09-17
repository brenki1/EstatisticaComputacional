library(rvest)
library(dplyr)
library(stringr)
library(ggplot2)

url <- "https://www.timeout.com/film/best-horror-films"

html <- read_html(url)
html

nomes <- html |>
  html_elements("h3._h3_cuogz_1") |>
  html_text2()

posicao <- str_extract_all(string = nomes,pattern = "^\\d+")

posicao <- unlist(posicao)
posicao
posicao <- as.numeric(posicao)
posicao


anos <- str_extract_all(string = nomes, pattern = "\\(\\d+\\)$")
anos
anos <- unlist(str_extract_all(anos, pattern = "\\d+"))
anos <- as.numeric(anos)

titulos <- str_remove_all(nomes, "^\\d+\\.\\s+")
titulos <- str_remove_all(titulos,"\\s+\\(\\d+\\)$")
titulos

filmes_horror <- data.frame(posicao, titulos, anos)

write.csv(filmes_horror, file = "filmeshorror.csv", row.names = FALSE)

url2 <- "https://www.bosshunting.com.au/entertainment/movies/best-movies-imdb/"

html2 <- read_html(url2)
html2

nomes1 <- html2 |>
  html_elements("ol.wp-block-list") |>
  html_elements("li") |>
  html_text2()
nomes1

titulos1 <- str_remove_all(nomes1,"^\\d+")
