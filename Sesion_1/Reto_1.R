#Leer el archivo "netflix_titles.csv" desde Github, a traves de su url.
netflix.titles <- read.csv("https://raw.githubusercontent.com/ecoronadoj/Sesion_1/main/Data/netflix_titles.csv")
dim(netflix.titles); class(netflix.titles)#dimension y tipo de objeto

#Obtener los títulos que se estrenaron después del 2015.
net.2015 <- netflix.titles[netflix.titles$release_year > 2015,] 

setwd("/home/komsal/Documentos/Proyectos/BEDU_R/Sesion_1") #cambia directorio de trabajo.

#Escribir los resultados en un archivo .csv llamado res.netflix.csv (Hint: consulta la función write.csv)
write.csv(net.2015, "res.netflix.csv") 

