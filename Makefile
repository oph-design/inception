# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: oheinzel <oheinzel@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/07/23 17:58:24 by oheinzel          #+#    #+#              #
#    Updated: 2023/07/23 17:58:36 by oheinzel         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

DIR 			= /home/oheinzel/Documents/inception/srcs/requirements
DB_VOLUME = ~/data/wpdata
WP_VOLUME = ~/data/wpfiles
PRUNE_S		= prune_service.sh
GREEN			= \033[0;32m
WHITE 		= \033[0m

all: $(DB_VOLUME) $(WP_VOLUME)
	@docker compose -f ./srcs/docker-compose.yml up -d --build
	@echo "$(GREEN)All Services up and running!$(WHITE)"

$(DB_VOLUME):
	@mkdir -p ~/data
	@mkdir -p ~/data/wpdata

$(WP_VOLUME):
	@mkdir -p ~/data
	@mkdir -p ~/data/wpfiles

clean:
	@docker compose -f ./srcs/docker-compose.yml down
	@echo "$(GREEN)All Services got shut down!$(WHITE)"

fclean:
	@make -i clean
	@docker system prune -a -f
	@rm -f prune_service.sh
	@echo "$(GREEN)Images and Containers cleaned!$(WHITE)"

re: clean all

hardre: fclean all

mariadb: $(PRUNE_S)
	@./prune_service.sh mariadb
	@docker build -t mariadb $(DIR)/mariadb/
	@docker run --name mariadb -d -p 6603:3306 mariadb
	@echo "$(GREEN)MariaDB up and running!$(WHITE)"

wordpress: $(PRUNE_S)
	@./prune_service.sh wordpress
	@docker build -t wordpress $(DIR)/wordpress/
	@docker run --name wordpress -d -p 9000:9000 wordpress
	@echo "$(GREEN)Wordpress up and running!$(WHITE)"

nginx: $(PRUNE_S)
	@./prune_service.sh nginx
	@docker build -t nginx $(DIR)/nginx/
	@docker run --name nginx -d -p 443:443 nginx
	@echo "$(GREEN)Nginx up and running!$(WHITE)"

$(PRUNE_S):
	@echo "#!/bin/bash" > prune_service.sh
	@echo "docker kill $$" >> prune_service.sh
	@echo "docker rm $$" >> prune_service.sh
	@echo "docker rmi $$" >> prune_service.sh
	@echo "exit 0" >> prune_service.sh
	@sed -i '/docker/s/$$/1/' prune_service.sh
	@chmod +x prune_service.sh

.PHONY: all clean fclean re hardre mariadb wordpress ngnix
