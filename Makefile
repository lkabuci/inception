all:
	@mkdir -p /home/relkabou/data/db_volume
	@mkdir -p /home/relkabou/data/wp_volume
	@docker compose -f srcs/docker-compose.yml up --build

cp:
	docker cp webserver:/etc/ssl/nginx/inception.crt ~/

down:
	@docker compose -f srcs/docker-compose.yml down

fclean: down
	@docker stop $(shell docker ps -qa) 2>/dev/null || true
	@docker rm $(shell docker ps -qa) 2>/dev/null || true
	@docker rmi -f $(shell docker images -qa) 2>/dev/null || true
	@docker volume rm $(shell docker volume ls -q) 2>/dev/null || true
	@docker network rm $(shell docker network ls -q) 2>/dev/null || true
	@docker system prune -af || true
	@sudo rm -rf /home/relkabou/data/db_volume || true
	@sudo rm -rf /home/relkabou/data/wp_volume || true

re: down all
