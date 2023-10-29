all:
	@docker compose -f srcs/docker-compose.yml up

down:
	@docker compose -f srcs/docker-compose.yml down

re: down all

