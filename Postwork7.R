#Utilizando el manejador de BDD Mongodb Compass (previamente instalado), deberás de realizar las siguientes acciones:
#Alojar el fichero data.csv en una base de datos llamada match_games, nombrando al collection como match

#Una vez hecho esto, realizar un count para conocer el número de registros que se tiene en la base

match <- mongo("match", "match_games", url = "host")

match$count('{}')

#Realiza una consulta utilizando la sintaxis de Mongodb, en la base de datos para conocer el número de goles que metió el Real Madrid el 20 de diciembre de 2015 y contra que equipo jugó, ¿perdió o fue goleada?
  
  # si los datos de Date se guardaron en formato date, la consulta debe contener el operador $date:
  games.madrid <- match$find('{"$and": [
                           {"Date": { "$gte" : { "$date" : "2015-12-20T00:00:00Z" }}},
                           {"Date": { "$lte" : { "$date" : "2015-12-21T00:00:00Z" }}}],
                           "$or": [
                           {"AwayTeam": "Real Madrid"},
                           {"HomeTeamTeam": "Real Madrid"}]}')



if (game.madrid$AwayTeam == "Real Madrid"){
  print(game.madrid$HomeTeam)
  print(game.madrid$FTAG)
  print(game.madrid$FTR)
}else{
  print(game.madrid$AwayTeam)
  print(game.madrid$FTHG)
  print(game.madrid$FTR)
}
