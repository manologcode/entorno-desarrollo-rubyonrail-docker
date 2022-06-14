#!/bin/bash
source .env

docker-compose down
sleep 2
gnome-terminal --tab --title="Docker DB" -- sh -c 'docker-compose up'
sleep 2
echo "-----------------------------------------------------------"
echo "Si necesitas otro termina dentro del contenedor rails usa:"
echo ""
echo "    docker exec -it --user \$UID:\$UID ruby${APP_NAME} bash           "
echo ""
echo "-----------------------------------------------------------"
docker exec -it --user $UID:$UID ruby$APP_NAME bash
