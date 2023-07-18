DIR = /home/oheinzel/Documents/srcs/requirements

all:
	@docker compose -f ./srcs/docker-compose.yml up -d --build

clean:
	@docker kill $(docker ps -q)

fclean: clean
	@docker system prune -a

nginx:
	@docker build -t nginx $(DIR)/nginx/
	@docker run -d -p 443:443 nginx

mariadb:
	@docker build -t mariadb $(DIR)/mariadb/
	@docker run -d -p 3306:3306 mariadb
