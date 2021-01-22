dbinom(x = 10, size = 35, prob = 0.51)
pbinom(q = 9, size = 35, prob = 0.51)
qbinom(p = 0.5, size = 35, prob = 0.51)

set.seed(4857) # Establecemos una semilla, para poder reproducir la muestra en el futuro
muestra <- rbinom(n = 1000, size = 35, prob = 0.51)
length(muestra); muestra[1:3]

muestraFR <- as.data.frame(table(muestra)/length(muestra))

ggplot(muestraFR, aes(x = muestra, y = Freq)) + 
  geom_bar (stat="identity")
