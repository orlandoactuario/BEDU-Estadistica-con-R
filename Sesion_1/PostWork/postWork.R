df.primera_division <- read.csv('https://www.football-data.co.uk/mmz4281/1920/SP1.csv') #recuperamos informacion

df.goles <- df.primera_division[, c("FTHG", "FTAG")] #aislamos las dos columnas que usaremos.

#Probabilidad (marginal) que el equipo local anote x goles.
prop.table(table(df.goles$FTHG))

#Probabilidad (marginal) que el equipo foraneo anote x goles.
prop.table(table(df.goles$FTAG))

#Probabilidad (marginal) que el equipo local anote x goles y el equipo visitante y goles.
prop.table(table(df.goles))
