git clone https://github.com/LMY03/mysite.git
docker compose -f ~/mysite/docker-compose.yml up --build -d
docker ps -a


git -C mysite pull origin main
docker compose -f ~/mysite/docker-compose.yml up --build -d
docker ps -a