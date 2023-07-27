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

DB_VOLUME = ~/data/wp_database
WP_VOLUME = ~/data/wp_files
ENV				= srcs/.env
GREEN			= \033[0;32m
WHITE 		= \033[0m

all: $(DB_VOLUME) $(WP_VOLUME) $(ENV)
	@docker compose -f ./srcs/docker-compose.yml up -d --build
	@echo "$(GREEN)All Services up and running!$(WHITE)"

$(DB_VOLUME):
	@mkdir -p ~/data
	@mkdir -p ~/data/wp_database

$(WP_VOLUME):
	@mkdir -p ~/data
	@mkdir -p ~/data/wp_files

$(ENV):
	@./create_env.sh

clean:
	@docker compose -f ./srcs/docker-compose.yml down
	@echo "$(GREEN)All Services got shut down!$(WHITE)"

fclean:
	@make -i clean
	@docker system prune -a -f --volumes
	@rm -f prune_service.sh
	@echo "$(GREEN)Images and Containers cleaned!$(WHITE)"

re: clean all

hardre: fclean all

.PHONY: all clean fclean re hardre


