#Se uniran los registros de cuatro tablas con distinto numero de columnas
B1.2021 <- "https://www.football-data.co.uk/mmz4281/2021/D1.csv"
B1.1920 <- "https://www.football-data.co.uk/mmz4281/1920/D1.csv"
B1.1819 <- "https://www.football-data.co.uk/mmz4281/1819/D1.csv"
B1.1718 <- "https://www.football-data.co.uk/mmz4281/1718/D1.csv"

download.file(url = B1.2021, destfile = "B1.2021.csv", mode = "wb")
download.file(url = B1.1920, destfile = "B1.1920.csv", mode = "wb")
download.file(url = B1.1819, destfile = "B1.1819.csv", mode = "wb")
download.file(url = B1.1718, destfile = "B1.1718.csv", mode = "wb")

lista <- lapply(dir(), read.csv)

#alternativa a comando lapply para cargar archivos
#fut1 <- read.csv("B1.1718.csv")
#fut2 <- read.csv("B1.1819.csv")
#fut3 <- read.csv("B1.1920.csv")
#fut4 <- read.csv("B1.2021.csv")
#lista <- list(fut1, fut2, fut3, fut4)

library(dplyr)

#Se estandarizan las columnas
lista <- lapply(lista, select, Date, HomeTeam:FTR)

#se unen las tablas
data <- do.call(rbind, lista)
head(data); tail(data)
