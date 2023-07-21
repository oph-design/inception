DIR = /home/oheinzel/Documents/inception/srcs/requirements

all:
	@docker compose -f ./srcs/docker-compose.yml up -d --build

mariadb:
	@./prune_service.sh mariadb
	@docker build -t mariadb $(DIR)/mariadb/
	@docker run --name mariadb -d -p 3306:3306 mariadb

wordpress:
	@./prune_service.sh wordpress
	@docker build -t wordpress $(DIR)/wordpress/
	@docker run --name wordpress -d -p 3306:3306 wordpress

nginx:
	@./prune_service.sh nginx
	@docker build -t nginx $(DIR)/nginx/
	@docker run --name ngnix -d -p 443:443 nginx

clean:
	@docker kill $(shell docker ps -q)

fclean:
	@make -i clean
	@docker system prune -a

re: fclean all

.PHONY: all clean fclean re
