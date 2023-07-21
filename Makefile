DIR = /home/oheinzel/Documents/inception/srcs/requirements
SERVICE =

all:
	@docker compose -f ./srcs/docker-compose.yml up -d --build

nginx:
	SERVICE = nginx
	@make -i sclean
	@docker build -t nginx $(DIR)/nginx/
	@docker run --name ngnix -d -p 443:443 nginx

mariadb:
	SERVICE = mariadb
	@make -i sclean
	@docker build -t mariadb $(DIR)/mariadb/
	@docker run --name mariadb -d -p 3306:3306 mariadb

wordpress:
	SERVICE = wordpress
	@make -i sclean
	@docker build -t wordpress $(DIR)/wordpress/
	@docker run --name wordpress -d -p 3306:3306 wordpress

clean:
	@docker kill $(shell docker ps -q)

fclean:
	@make -i clean
	@docker system prune -a

sclean:
	@docker kill $(SERVICE)
	@docker rm $(SERVICE)
	@docker rmi $(SERVICE)

re: fclean all
