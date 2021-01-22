#creamos array aleatorio con mil elementos
set.seed(134)
x <- round(rnorm(1000, 175, 6), 1)

library(DescTools)

#Calcular, media, mediana y moda de los valores en x
mean(x); median(x); Mode(x)

quantile(x, probs = seq(0.1, 0.9, 0.1))#calcular cuartiles
quantile(x, c(0.1, 0.5, 0.9))#calcular deciles

#rango intercuartílico, la desviación estándar y varianza muestral
IQR(x); sd(x); var(x)
