#graficas de jugadores
jugadores <- read.csv("https://raw.githubusercontent.com/beduExpert/Programacion-con-R-Santander/master/Sesion-03/Reto-02/players_stats.csv")
promedio.minutos <-mean(jugadores$MIN)

library(ggplot2)

#rango minutos y promedio
ggplot(jugadores, aes(MIN))+ 
  geom_histogram(binwidth = 100, col="blue") + 
  ggtitle("Minutos de jugadores") +
  ylab("Frecuencia") +
  xlab("Minutos") +
  geom_vline(xintercept =  promedio.minutos, col = "black", lwd = 1.5, lty =2)

#rango de edad y promedio
promedio.edad <-mean(na.omit(jugadores$Age))

ggplot(jugadores, aes(Age))+ 
  geom_histogram(binwidth = 1, col="black", fill = "red")
  ggtitle("Minutos de jugadores") +
  ylab("Frecuencia") +
  xlab("Minutos") +
  geom_vline(xintercept =  promedio.edad, col = "black", lwd = 1.5, lty =2)
  
#scatter point peso y altura
p <- jugadores %>% ggplot(aes(Weight, Height)) + geom_point()
p
  
(lmnba <- coef(lm(Height ~ Weight, data = jugadores)))
  #> (Intercept)          MIN 
  #>   -136.129102   1.193261 
p + geom_abline(intercept = lmnba[1], slope = lmnba[2], col = "blue", lwd = 1.5, lty = 2)

#4. Jugador más alto
alto <- which.max(jugadores$Height)
paste("El jugador más alto es:", jugadores$Name[alto],"con una altura de:" , round(jugadores$Height[alto]/100,2), "m")

#5. Jugador más bajo
(bajito <- which.min(jugadores$Height))
paste("El jugador más bajito es:", jugadores$Name[bajito],"con una altura de:" ,round(jugadores$Height[bajito]/100,2), "m")

#6. La altura promedio, (Hint: hay que utilizar na.omit en caso de presencia de NA´s)
(altura.m <- mean(na.omit(jugadores$Height)))
paste("La altura promedio es:", round(altura.m/100,2),"m")

# 7. Scatterplot de Asistencias totales vs Puntos, con un face wrap por posición.
jugadores %>% ggplot( aes(AST.TOV, PTS )) +
  geom_point() + 
  facet_wrap("Pos")
