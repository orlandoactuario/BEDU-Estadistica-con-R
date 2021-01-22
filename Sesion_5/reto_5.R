rm(list = ls()) # Para eliminar objetos creados previamente
datos <- read.csv("https://raw.githubusercontent.com/beduExpert/Programacion-con-R-Santander/master/Sesion-05/Reto-01/datoslineal.csv")
head(datos)
attach(datos)
plot(x, y, main = "Gráfico de dispersión",
     xlab = "X", 
     ylab = "Y", pch = 1)

m1 <- lm(y~x)

summary(m1)
abline(lsfit(x, y))

par(mfrow = c(2, 2)) 
plot(m1) # 3.
