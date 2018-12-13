Para arrancar el servicio es necesario, únicamente, ejecutar el docket compose con:
docker-compose up

Se puede comprobar el estado del réplica set accediendo a cualquiera de los nodos. En caso de acceder a un esclavo, primeramente se debe de configurar el parámetro slaveOk o de lo contrario no se podrán realizar consultas a la base de datos. Para ello, en la "mongo shell" se ejecuta:
rs.slaveOk()

En el maestro no hace falta ejecutar ningún comando adicional para poder operar. Además, este será el único que permita realizar modificaciones sobre los datos.