df.1718 <- read.csv("https://www.football-data.co.uk/mmz4281/1718/SP1.csv")
df.1819 <- read.csv("https://www.football-data.co.uk/mmz4281/1819/SP1.csv")
df.1920 <- read.csv("https://www.football-data.co.uk/mmz4281/1920/SP1.csv")

str(df.1718); head(df.1718); View(df.1718); summary(df.1718)
str(df.1819); head(df.1819); View(df.1819); summary(df.1819)
str(df.1920); head(df.1920); View(df.1920); summary(df.1920)

lista <- list(df.1718, df.1819, df.1920)

library(dplyr)
lista <- lapply(lista, select, Date, HomeTeam:FTR)

lista <- lapply(lista, mutate, Date = as.Date(Date, "%d/%m/%Y"))

df.all = do.call(rbind, lista)

write.csv(df.all, "Partidos_primera_division.csv") 

