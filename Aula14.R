library(rvest)
library(dplyr)

url <- "https://www.bbc.com/portuguese/articles/cql3lwgl3ldo"

html <- read_html(url)
html

titulo <- html |>
  html_elements('h1') |>
  html_text2()

titulo <- ("Editar DNA é ético? O debate sobre tecnologia que promete revolucionar vidas")

noticia <- html |>
  html_elements("p.bbc-hhl7in") |>
  html_text2()
  
noticia <- paste(noticia, collapse= " ")

artigos <- data.frame(titulo, noticia)

library(tidytext)

