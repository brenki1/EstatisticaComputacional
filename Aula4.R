titanic <- read.table(file = "titanic.txt", sep = ",", header = TRUE)

titanic <- titanic[, -c(1,9,12)]

titanic$Survived <- as.factor(titanic$Survived)
titanic$Pclass <- as.factor(titanic$Pclass)
titanic$Sex <- as.factor(titanic$Sex)
str(titanic)
summary(titanic)

System.out.println <- print
System.out.println("Marcos Paulo botron");
ggplot(data = titanic, aes(x = Survived, fill = Sex)) + 
  geom_bar(color = "#ff00e1") + 
  labs(title = "Marcosbotron") +
  theme_minimal() + 
  scale_fill_manual(values = c("male" = "#fcc20f", "female" = "#0ffc35"))

ggplot(data = titanic, aes(x = Sex, fill = Survived)) +
  geom_bar(color = "#000") + 
  labs(title = "Maculados que foram de caixão no Titanic", x = "Sexo", y = "Frequência", fill = "Amostradinho?") + 
  theme_minimal() + 
  scale_fill_manual(values = c("0" = "#f76d00", "1" = "#2967cc"), labels = c("0" = "💀", "1" = "😁")) + 
  scale_x_discrete(labels = c("female" = "mulheres!", "male" = "homens!"))+
  facet_wrap(~Pclass)

iris
iris <- iris[sample(nrow(iris)),]
iris

n <- round(0.8*nrow(iris))
n

treinamento <- iris[1:n,]
teste <- iris[-(1:n),]
summary(teste)
ggplot(data = treinamento, aes(x = Petal.Length, y = Petal.Width, col = Species)) +
  geom_point(size = 2, alpha = 0.5)+
  theme_minimal()
