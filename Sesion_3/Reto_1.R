altura <- read.csv("https://raw.githubusercontent.com/beduExpert/Programacion-con-R-Santander/master/Sesion-03/Reto-01/BD_Altura_Alunos.csv", sep=";")
head(altura)

hist(altura$Altura, 
     breaks = 40,
     main = "Altura alumnos",
     ylab = "Frecuencia",
     xlab = "Altura", 
     col = "red")

ggplot(altura, aes(Altura))+
  geom_histogram(binwidth = 1, col="red") + 
  ggtitle("Altura alumnos") +
  ylab("Frecuencia") +
  xlab("Altura")

#ambos metodos son faciles de entender e implementar, ggplot es un poco mas dificil de usar
#pero taambien es mas flexible, pero cada uno se adaptará mejor deacuerdo al contexto.
