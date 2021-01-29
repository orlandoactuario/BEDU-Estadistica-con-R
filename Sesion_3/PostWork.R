#Con el último data frame obtenido en el postwork de la sesión 2, elabora tablas de frecuencias
#relativas para estimar las siguientes probabilidades:

#La probabilidad (marginal) de que el equipo que juega en casa anote x goles (x=0,1,2,)

#La probabilidad (marginal) de que el equipo que juega como visitante anote y goles (y=0,1,2,)

#La probabilidad (conjunta) de que el equipo que juega en casa anote x goles y el equipo que juega como visitante anote y goles (x=0,1,2,, y=0,1,2,)

#Realiza lo siguiente:
#Un gráfico de barras para las probabilidades marginales estimadas del número de goles que anota
#el equipo de casa
#Un gráfico de barras para las probabilidades marginales estimadas del número de goles que anota
#el equipo visitante.
#Un HeatMap para las probabilidades conjuntas estimadas de los números de goles que anotan
#el equipo de casa y el equipo visitante en un partido.

#Cargamos la base de datos
base<-read.csv("Partidos_primera_division.csv")

#La probabilidad (marginal) de que el equipo que juega en casa anote x goles (x=0,1,2,)
suppressMessages(library(knitr))

prop.table(table(base$FTHG))

#La probabilidad (marginal) de que el equipo que juega como visitante anote y goles (y=0,1,2,)
prop.table(table(base$FTAG))

#La probabilidad (conjunta) de que el equipo que juega en casa anote x goles y el
#equipo que juega como visitante anote y goles (x=0,1,2,, y=0,1,2,)
prop.table(table(base$FTHG,base$FTAG))

#Un gráfico de barras para las probabilidades marginales estimadas del número de goles que anota el equipo de casa:
suppressMessages(library(ggplot2))

dfH<-as.data.frame(prop.table(table(base$FTHG)))

ggplot(dfH,aes(Var1,Freq)) + 
  geom_bar(stat = "identity",fill='blue4')+scale_color_brewer(palette = "Set2") + 
  labs(title="Probabilidades del equipo Visitante", 
       subtitle = "Masa de probabilidad", 
       x="Goles",y="Probabilidad") + 
  theme(legend.position = "top")

#Un gráfico de barras para las probabilidades marginales estimadas del número de goles que
#anota el equipo visitante.
dfA<-as.data.frame(prop.table(table(base$FTAG)))
ggplot(dfA,aes(Var1,Freq)) + 
  geom_bar(stat = "identity",fill='darkred') + 
  scale_color_brewer(palette = "Set2") + 
  labs(title="Probabilidades del equipo de Casa", 
       subtitle = "Masa de probabilidad", 
       x="Goles",y="Probabilidad") + 
  theme(legend.position = "top")

#Un HeatMap para las probabilidades conjuntas estimadas de los números de goles que
#anotan el equipo de casa y el equipo visitante en un partido.
dfHA<-as.data.frame(prop.table(table(base$FTHG,base$FTAG)))
ggplot(dfHA,aes(Var1,Var2,fill=Freq)) + 
  geom_tile() + 
  labs(title="Probabilidades Conjunta", 
       x="Equipo de Casa",y="Equipo Visitante")
