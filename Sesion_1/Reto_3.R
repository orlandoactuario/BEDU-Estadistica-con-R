ran <- rnorm(44) #crea un array con 44 numeros aleatorios

calc <- 0

#crear un segundo array con 15 elementos calculados a partir del array original
for(i in 1:15) {
  calc[i] <- (ran[i]**2)+12 
}

#crear dataframe con ambos arrays (solo 15 elementos).
numeros <- data.frame(aleatorio = ran[1:15], calculo = calc)

#ran = for i de 1 a 15{random()}
#calc = vector[15]
#for i de 1 a 15{calc[i] = ran[i]**2+12}
#numeros = data.frame(aleatorio = ran[1:15], calculo = calc)