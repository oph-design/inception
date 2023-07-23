DIR = /home/oheinzel/Documents/inception/srcs/requirements
PRUNE = prune_service.sh

all:
	@docker compose -f ./srcs/docker-compose.yml up -d --build

mariadb: $(PRUNE)
	@./prune_service.sh mariadb
	@docker build -t mariadb $(DIR)/mariadb/
	@docker run --name mariadb -d -p 3306:3306 mariadb

wordpress: $(PRUNE)
	@./prune_service.sh wordpress
	@docker build -t wordpress $(DIR)/wordpress/
	@docker run --name wordpress -d -p 3306:3306 wordpress

nginx: $(PRUNE)
	@./prune_service.sh nginx
	@docker build -t nginx $(DIR)/nginx/
	@docker run --name nginx -d -p 443:443 nginx

$(PRUNE):
	@echo "#!/bin/bash" > prune_service.sh
	@echo "docker kill $$" >> prune_service.sh
	@echo "docker rm $$" >> prune_service.sh
	@echo "docker rmi $$" >> prune_service.sh
	@echo "exit 0" >> prune_service.sh
	@sed -i '/docker/s/$$/1/' prune_service.sh
	@chmod +x prune_service.sh

clean:
	@docker compose -f ./srcs/docker-compose.yml down

fclean:
	@make -i clean
	@docker system prune -a

re: fclean all

.PHONY: all clean fclean re
