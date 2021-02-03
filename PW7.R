#Postwork 7. Alojar el fichero a un local host de MongoDB

#install.packages("mongolite")
#install.packages("data.table")

suppressWarnings(suppressMessages(library(mongolite)))
suppressWarnings(suppressMessages(library(dplyr)))

#Utilizando el manejador de BDD Mongodb Compass (previamente instalado), deberás de realizar las siguientes acciones:

#1. Alojar el fichero data.csv en una base de datos llamada match_games, nombrando al collection como match
#Importando el archivo .csv a R
data.url <- "https://raw.githubusercontent.com/beduExpert/Programacion-con-R-Santander/master/Sesion-07/Postwork/data.csv"
data <- read.csv(data.url)



# transformo los datos a un frame que MongoDB entienda:
match = data.table::fread(data.url)
head(match, 3) #reviso el head


#realizo la conexión con MongoDB:
match_collection <- mongo(collection = "match", db = "match_test",url="mongodb+srv://Bedu_Zoe:<pass>@cluster0.89flg.mongodb.net/test?authSource=admin&replicaSet=atlas-6gzugx-shard-0&readPreference=primary&appname=MongoDB%20Compass&ssl=true")
#inserto los datos que se piden:
match_collection$insert(match)

#2. Una vez hecho esto, realizar un count para conocer el número de registros que se tiene en la base
match_collection$count()

#3. Realiza una consulta utilizando la sintaxis de Mongodb, en la base de datos para conocer el número
#de goles que metió el Real Madrid el 20 de diciembre de 2015 y contra que equipo jugó, ¿perdió ó fue goleada?

#Notemos que nuestra base de datos comienza en el lejano 2017, pero requerimos datos del aún más lejano 2015
#entonces se importarán: 

url.2015 <- "https://www.football-data.co.uk/mmz4281/1516/SP1.csv"
data.2015 <- read.csv(url.2015)
head(data.2015); str(data.2015)

#cambiamos el type de la fecha y cambio el type:

data.2015<- mutate(data.2015, Date = as.Date(Date, "%d/%m/%y"))
data.2015 <- select(data.2015,Date,HomeTeam:FTR)


#realizamos la conversión a un frame que mongo entienda: 
match.2015 = data.table::fread("fut_2015.csv")
names(match.2015) #vemos los nombres
head(match.2015) #veo los primeros elementos

#realizo la conexión a mongodb:
collection_2015 = mongo(collection = "match", db = "match_test",url="mongodb+srv://Bedu_Zoe:<pass>@cluster0.89flg.mongodb.net/test?authSource=admin&replicaSet=atlas-6gzugx-shard-0&readPreference=primary&appname=MongoDB%20Compass&ssl=true")
#cargo los datos
collection_2015$insert(match.2015)

#ahora realizo la consulta:
collection_2015$find()
collection_2015$find(query = '{"Date":"2015-12-20","HomeTeam" : "Real Madrid"}')

#Como podemos ver fue goleada por parte del Real Madrid 10 a 2 al Vallecano xD

#Por último, cierro la conexión con la BDD
rm(collection_2015); rm(match_collection)