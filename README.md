# Docker para desarrollo Aplicación con ruby On Rails. 

Para el desarrollo utilizaremos docker compose con dos contenedores una para ruby y otra para postgress. inicialmente se usa las versiones Ruby 3.1.2
y Postgresql 12-alpine aunque es sencillo modificarlas cambiado el Dockerfile y el docker-compose


## El entorno docker.

El repo include un archivo .env donde se configura en una variable el nombre de los contenedores para evitar conflictos cuando se trabaje con varios proyectos

Por un lado ejecuta docker compose up para que corra los contenedores.

    docker-compose up

y en otra ventana ejecutar una instancia del terminar del contenedor de ruby para ir ejecutan las instrucciones de rails e ir viendo los errores y procesos que corren.


    docker exec -it --user $UID:$UID rubyrails_example bash


El repos incluye un archivo **railsRun.sh** que ejecuta el entorno de los dos contenedores. 


## 1ª instalado y comenzando con rails

Para construir nuestra aplicación de rails. Ejecutar dentro del contenedor de ruby

Instalar rails

    gem install rails

instalar rails

    rails new . -d postgresql

y -d para el tipo de base de datos

Ponemos la configuración de nuestra base de datos dockerizada. En el archivo config/database.yml en la sección de default: &default añadimos las siguientes lineas:

  username: root
  password: toor
  host: db
  port: 5432

creamos las bases de datos

    rails db:create

arrancamos servidor

    rails s -b 0

el -b 0 es porque estamos ejecutando desde dentro del contenedor

La aplicación corre en http://localhost:3000

Para poner por defecto que el host a 0 y evitar el tener que poner -b editar el archivo config/puma.rb y añadir

    set_default_host '0.0.0.0'

ahora y solo es necesario para correr el contenedor.

    rails s -b 0