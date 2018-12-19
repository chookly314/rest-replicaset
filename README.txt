# Autores:
	Fernando Cepeda Sordo
	Miguel Gamallo Gascon

# Instrucciones para arrancar el servicio
Descomprimir el .zip de la entrega, y desde el directorio raíz del proyecto ejecutar:
docker-compose up

Se puede comprobar el estado del réplica set accediendo a cualquiera de los nodos. En caso de acceder a un esclavo, primeramente se debe de configurar el parámetro slaveOk o de lo contrario no se podrán realizar consultas a la base de datos. Para ello, en la "mongo shell" de dicho esclavo, se ejecuta:
rs.slaveOk()

Esto es necesario para prevenir a las aplicaciones de ejecutar lecturas sobre un nodo con consistencia eventual de forma accidental.

En el maestro no hace falta ejecutar ningún comando adicional para poder operar. Además, este será el único que permita realizar modificaciones sobre los datos.

El servidor está mapeado al puerto 8000 del host, por lo que se puede acceder a él a través de localhost:8000. Se ha utilizado la imagen "apozohue10/rest-server-2018".

El script de configuración proporcionado, "configure-replica.sh", se ha modificado ligeramente para adaptar el nombre de la colección a "restaurantes".

Nota: No se han montado volúmenes persistentes en /data/db de los nodos de MongoDB. Esto significa que los datos no serán persistentes, ya que dejarán de ser accesibles cuando los contenedores caigan. Esto se ha hecho de forma consciente, para evitar generar demasiados archivos, y por tratarse de un entorno de desarrollo/pruebas. Nunca debe hacerse en entornos productivos.