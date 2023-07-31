# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: oheinzel <oheinzel@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/07/23 17:58:24 by oheinzel          #+#    #+#              #
#    Updated: 2023/07/31 17:16:28 by oheinzel         ###   ########.fr        #
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
	@make buildtmp
	@chmod +x tmp_script.sh
	@./tmp_script.sh
	@rm -f tmp_script.sh

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

buildtmp:
	@> tmp_script.sh echo '#!/bin/bash'
	@>> tmp_script.sh echo 'declare -a arr=("DB_HOST" "DB_NAME" "DB_USER" \'
	@>> tmp_script.sh echo '                "DB_PASS" "DB_ROOT" "WP_HOST" \'
	@>> tmp_script.sh echo '                "WP_TITLE" "WP_ADMIN_USER" \'
	@>> tmp_script.sh echo '                "WP_ADMIN_PASS" "WP_ADMIN_MAIL" \'
	@>> tmp_script.sh echo '                "WP_USER" "WP_PASS" "WP_MAIL")'
	@>> tmp_script.sh echo ''
	@>> tmp_script.sh echo 'touch srcs/.env'
	@>> tmp_script.sh echo 'for i in "$${arr[@]}"'
	@>> tmp_script.sh echo 'do'
	@>> tmp_script.sh echo '   echo -e "\033[0;34mEnter $$i:\033[0m"'
	@>> tmp_script.sh echo '   read var'
	@>> tmp_script.sh echo '   echo "$$i=$$var" >> srcs/.env'
	@>> tmp_script.sh echo 'done'


.PHONY: all clean fclean re hardre


