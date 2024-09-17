a <- c(1,2,5)
b <- c(10,12)
d <- c(a,6)
3*a
3+a
#a+b
d + b

#Laço for em R

x <- 0

for(i in 1:20){
  x <- x + i
}

print(x)

aniversarios <- sample(x = 1:365, size = 10, replace = TRUE)
aniversarios
duplicated(aniversarios)
any(duplicated(aniversarios))


calcula_probabilidade <- function(n){
  resultados <- c()

for(j in 1:100000) {
  aniversarios <- sample(x = 1:365, size = n, replace = TRUE)
  resultados[j] <- any(duplicated(aniversarios))
}

print(mean(resultados))
}

calcula_probabilidade(n = 10)

sorteio <- sample(x = 1:60, size = 6, replace = FALSE)

bilhete <- c(4,22,12,43,21,34)
t <- c()
k <- 0

for(k in 1:10000) {
  semanas <- 0 
  acertos <- 0 

  while(acertos < 4) {
    sorteio <- sample(x = 1:60, size = 6, replace = FALSE)
    acertos <- sum(bilhete %in% sorteio)
    semanas <- semanas + 1
}

  t[k] <- semanas/52
  
}

mean(t)




