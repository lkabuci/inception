DB_VOLUME_DIR := /home/relkabou/data/db_volume
WP_VOLUME_DIR := /home/relkabou/data/wp_volume

.PHONY: all cp down fclean re

all:
	@mkdir -p $(DB_VOLUME_DIR)
	@mkdir -p $(WP_VOLUME_DIR)
		@docker compose -f srcs/docker-compose.yml up --build

cp:
	@docker cp webserver:/etc/ssl/nginx/inception.crt ~/ || true

down:
	@docker compose -f srcs/docker-compose.yml down || true

fclean: down
	@docker stop $$(docker ps -qa) 2>/dev/null || true
	@docker rm $$(docker ps -qa) 2>/dev/null || true
	@docker rmi -f $$(docker images -qa) 2>/dev/null || true
	@docker volume rm $$(docker volume ls -q) 2>/dev/null || true
	@docker network rm $$(docker network ls -q) 2>/dev/null || true
	@docker system prune -af || true
	@sudo rm -rf $(DB_VOLUME_DIR) $(WP_VOLUME_DIR) || true

re: down all
