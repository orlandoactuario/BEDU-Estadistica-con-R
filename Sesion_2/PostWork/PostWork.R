#cargamos archivos desde la red
df.1718 <- read.csv("https://www.football-data.co.uk/mmz4281/1718/SP1.csv")
df.1819 <- read.csv("https://www.football-data.co.uk/mmz4281/1819/SP1.csv")
df.1920 <- read.csv("https://www.football-data.co.uk/mmz4281/1920/SP1.csv")

#revisamos informacion de cada uno de los archivos
str(df.1718); head(df.1718); View(df.1718); summary(df.1718)
str(df.1819); head(df.1819); View(df.1819); summary(df.1819)
str(df.1920); head(df.1920); View(df.1920); summary(df.1920)

#creamos una lista con los tres archivos
lista <- list(df.1718, df.1819, df.1920)

library(dplyr)

#Recuperamos algunas de las columnas
lista <- lapply(lista, select, Date, HomeTeam:FTR)

#estandarizamos el formato de la fecha
lista <- lapply(lista, mutate, Date = as.Date(Date, "%d/%m/%Y"))

#Lo corregimos reemplazando el string “00” con el string “20”, y convertrimos de nuevo a Fecha:
lista <-lapply(lista, mutate, Date=as.Date(sub("00","20",as.character(as.Date(Date,format = "%d/%m/%Y")))))

#Concatenamos las 3 tablas en una sola
df.all = do.call(rbind, lista)

#almacenamos todo en un archivo
write.csv(df.all, "Partidos_primera_division.csv") 

