print('hello world')

#operações
2 + 5 #soma
2 - 5 #subtração
2 * 5 #multiplicação
4 / 2 #divisão
3 ** 2 #potencia 
10 %% 3 #resto

#atribuindo valores

a <- 3*2
4*3 -> b
class(a)
class(1)

d <- TRUE
class(d)

d+a
FALSE + a
TRUE + TRUE
TRUE + FALSE/FALSE
TRUE/FALSE

#string
x <- "teste"
class(x)

#criando vetores
x1 <- c(3,10,78)
length(x1)
sum(x1)
mean(x1) #média
c(1,6,"teste") 

x1[c(2,3)] #extrair a posição

x2 <- c(x1,67,90)
x2
x2 < 70 #mostra em TRUE ou FALSE as posiçoes que são menores que 70
sum(x2 < 70)
x2[x2<70] #filtra apenas os menores que 70

dado <- sample(x=1:6, size=10000, replace = TRUE)
print(dado)
sum(dado == 3)
mean(dado == 3)  #ou sum(dado == 3)/10000
