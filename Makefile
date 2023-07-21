DIR = /home/oheinzel/Documents/inception/srcs/requirements

all:
	@docker compose -f ./srcs/docker-compose.yml up -d --build

clean:
	@docker kill $(shell docker ps -q)

fclean:
	@make -i clean
	@docker system prune -a

re: fclean all

nginx:
	@docker build -t nginx $(DIR)/nginx/
	@docker run --name ngnix -d -p 443:443 nginx

mariadb:
	@docker build -t mariadb $(DIR)/mariadb/
	@docker run --name mariadb -d -p 3306:3306 mariadb

wordpress:
	@docker build -t wordpress $(DIR)/wordpress/
	@docker run --name wordpress -d -p 3306:3306 wordpress
