DIR = /home/oheinzel/Documents/inception/srcs/requirements

all:
	@docker compose -f ./srcs/docker-compose.yml up -d --build

nginx:
	@make -i nxclean
	@docker build -t nginx $(DIR)/nginx/
	@docker run --name ngnix -d -p 443:443 nginx

mariadb:
	@make -i dbclean
	@docker build -t mariadb $(DIR)/mariadb/
	@docker run --name mariadb -d -p 3306:3306 mariadb

wordpress:
	@make -i wpclean
	@docker build -t wordpress $(DIR)/wordpress/
	@docker run --name wordpress -d -p 3306:3306 wordpress

clean:
	@docker kill $(shell docker ps -q)

fclean:
	@make -i clean
	@docker system prune -a

wpclean:
	@docker kill wordpress
	@docker rm wordpress
	@docker rmi wordpress

dbclean:
	@docker kill mariadb
	@docker rm mariadb
	@docker kill mariadb

nxclean:
	@docker rm nginx
	@docker rmi nginx
	@docker rmi nginx

re: fclean all

.PHONY: all clean fclean re
