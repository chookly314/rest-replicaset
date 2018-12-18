Para arrancar el servicio es necesario, únicamente, ejecutar el docket compose con:
docker-compose up

Se utilizan tres volúmenes diferentes, montando uno u otro en función del contenedor:
 - En los contenedores de MongoDB, se monta el volumen con la colección a importar (directorio data).
 - En el contenedor de configuración, se monta el volumen que contiene el fichero de configuración del replica set (directorio config), además del de la colección.
 - En el contenedor que correrá el servicio REST, se monta el volumen que contiene el código de la aplicación (directorio server).

Se puede comprobar el estado del réplica set accediendo a cualquiera de los nodos. En caso de acceder a un esclavo, primeramente se debe de configurar el parámetro slaveOk o de lo contrario no se podrán realizar consultas a la base de datos. Para ello, en la "mongo shell" de dicho esclavo, se ejecuta:
rs.slaveOk()

Esto es necesario para prevenir a las aplicaciones de ejecutar lecturas sobre un nodo con consistencia eventual de forma accidental.

En el maestro no hace falta ejecutar ningún comando adicional para poder operar. Además, este será el único que permita realizar modificaciones sobre los datos.

El servidor web se ha incorporado al compose, por lo que se conecta a los contenedores de mongo a través de su nombre y su puerto de escucha, con el formato:
mongoX:27017

El servidor está mapeado al puerto 8000 del host, por lo que se puede acceder a él a través de localhost:8000.