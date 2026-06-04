COMPOSE := docker-compose -f ./srcs/docker-compose.yml
DATA_DIR := /home/mawako/data
SECRETS_DIR := secrets

all: up

up: init
	@$(COMPOSE) up -d --build --remove-orphans

init:
	@mkdir -p $(DATA_DIR)/wordpress $(DATA_DIR)/mariadb $(SECRETS_DIR)

down:
	@$(COMPOSE) down --remove-orphans

stop:
	@$(COMPOSE) stop

start:
	@$(COMPOSE) start

re: down up

status:
	@$(COMPOSE) ps
	@docker ps

.PHONY: all up init down stop start re status
