juju <- 18
jorel <- 7
moeda <- c("cara", "coroa")

resultados <- c()

for(i in 1:10000){
  juju <- 18
  jorel <- 7
  
while(juju != 0 && jorel != 0) {
  sorteio <- sample(x = moeda, size=1, replace = FALSE)
  if(sorteio == "cara") {
    juju <- juju + 1
    jorel <- jorel - 1
  } else {
    juju <- juju - 1
    jorel <- jorel + 1
  }
}

if(jorel == 0) {
  resultados <- c(resultados,"juju")
} else {
  resultados <- c(resultados, "jorel")
  
}
}

mean(resultados == "juju")
mean(resultados == "jorel")
    
#------Exercicio2------

figurinhas <- 1:30
album <- sample(figurinhas, size = 1)
album
while(length(unique(album)) < 30) {
  album <- c(album, sample(figurinhas,size = 1))
  
}

length(album)

resultados <- c()
figurinhas <- 1:30

for(j in 1:10000) {
  album <- sample(figurinhas,size=1, prob = c(1, rep(2,times=29)))
  while(length(unique(album)) < 30) {
    album <- sample(figurinhas,size=1, prob = c(1, rep(2,times=29)))
  }
  resultados[j] <- length(album)
}
resultados
mean(resultados)
unique(album)

#------Exercicio3------
library(ggplot2)

chicago <- read.csv(file = "chicago.csv", header = TRUE, sep = ",")
chicago <- chicago[,-1]
chicago$season <- as.factor(chicago$season)

mortesCardiovasculares <- sum(chicago$cvd)

ggplot(data = chicago, aes(x = time, y= temp, color = season)) +
  geom_point()+
  theme_minimal()


