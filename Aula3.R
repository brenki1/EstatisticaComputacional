dados <- read.table(file = "titanic.txt", header = TRUE, sep = ",")

summary(dados)
mortos <- (length(dados[,1]) - sum(dados[,1]))
sobreviventes <- sum(dados[,1])
dados <-dados[,-11]
dados$Survived <- as.factor(dados$Survived)
dados$Sex <- as.factor(dados$Sex)
dados$Pclass <- as.factor(dados$Pclass)

summary(dados)
str(dados)

dados[c(6,10),]

homens <- dados[dados$Sex == 'male',]
summary(homens)
table(homens$Survived)
barplot(table(homens$Survived))
sum(homens$Survived == 1)
barplot(table(homens[homens$Pclass == 3,]$Survived)) # ou terceira_homens <- homens[homens$Pclass == 3]

mulheres <- dados[dados$Sex == 'female',]
summary(mulheres)
table(mulheres$Survived)
barplot(table(mulheres$Survived))

idoso <- dados[dados$Age >= 60,]
table(idoso$Survived)
barplot(table(idoso$Survived))


jovens <- dados[dados$Age <= 60,]
table(jovens$Survived)
barplot(table(jovens$Survived))