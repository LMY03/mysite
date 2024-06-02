git clone https://github.com/LMY03/mysite.git
docker compose -f ~/CAPSTONE2240/docker-compose.yml up --build -d


git -C CAPSTONE2240 pull origin main
docker compose -f ~/CAPSTONE2240/docker-compose.yml up --build -d