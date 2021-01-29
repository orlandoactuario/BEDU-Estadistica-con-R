produccion.electricidad <- read.csv("https://raw.githubusercontent.com/beduExpert/Programacion-con-R-Santander/master/Sesion-03/Reto-03/cbe.csv")
View(produccion.electricidad)
#se crea serie de tiempo de electricidad
prod.ts <- ts(produccion.electricidad[, 3], start = 1958, freq = 12)

#descomposicion multiplicativa
prod.ts.M <- decompose(prod.ts, type = "mult")

plot(prod.ts.M, xlab = "Tiempo", 
     sub = "Datos descompuestos de producción de electricidad")

#separamos los componentes
Trend <- prod.ts.M$trend
Seasonal <- prod.ts.M$seasonal
Random <- prod.ts.M$random

ts.plot(cbind(Trend, Trend*Seasonal), xlab = "Tiempo", main = "Datos de Producción de Electricidad", 
        ylab = "Producción de electricidad", lty = 1:2,
        sub = "Tendencia con efectos estacionales multiplicativos sobrepuestos")

Trend[7]*Seasonal[7]*Random[7]
prod.ts[7]

Trend[100]*Seasonal[100]*Random[100]
prod.ts[100]
