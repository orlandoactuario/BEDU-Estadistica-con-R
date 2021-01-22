#probar funciones
str(mtcars)
summary(mtcars)
head(mtcars)
View(mtcars)

mediana(1:11)

#crear funcion que calcula mediana sin usar funcion "median"
mediana <- function(vector){
  size = length(vector)
  vector <- sort(vector)# Ordenamos los valores de menor a mayor
  if(size%%2 == 0){paste("Mediana: ", mean(vector[c(size/2, size/2+1)])) 
  } else{paste("La mediana es: ", vector[round(size/2])}
}
