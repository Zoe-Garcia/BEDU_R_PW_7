# Sesión 7: RStudio Cloud - Github, conexiones con BDs y lectura de datos externos

## Postwork Sesión 7.

### OBJETIVO

- Realizar el alojamiento del fichero de un fichero `.csv` a una base de datos (BDD), en un local host de Mongodb a traves de `R`

#### DESARROLLO

Utilizando el manejador de BDD _Mongodb Compass_ (previamente instalado), deberás de realizar las siguientes acciones: 

- Alojar el fichero  `data.csv` en una base de datos llamada `match_games`, nombrando al `collection` como `match`

- Una vez hecho esto, realizar un `count` para conocer el número de registros que se tiene en la base

- Realiza una consulta utilizando la sintaxis de **Mongodb**, en la base de datos para conocer el número de goles que metió el Real Madrid el 20 de diciembre de 2015 y contra que equipo jugó, ¿perdió ó fue goleada?

- Por último, no olvides cerrar la conexión con la BDD
