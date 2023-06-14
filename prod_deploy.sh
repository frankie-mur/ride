#!/bin/bash
SECONDS=0

cd $HOME/app

msg () {
  echo -e "\n$1\n--------------------\n"
}

msg "Pulling from GitHub"
git pull

msg "Building Docker image"
sudo docker build --tag app .

msg "Stopping Docker container"
sudo docker stop app
sudo docker rm app

msg "Starting Docker container"
sudo docker run \
-d \
--name app \
--expose 443 \
-p 443:443 \
-v /etc/letsencrypt:/etc/letsencrypt \
-e SERVER_ENV=PROD \
app

msg "Pruning stale Docker images"
sudo docker image prune -f

duration=$SECONDS

echo
msg "Deploy finished in $(($duration % 60)) seconds."
msg "Press Enter to exit"
read
