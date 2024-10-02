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
  html_text2()

paste0(texto)
