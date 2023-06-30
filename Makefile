NAME	= inception

$(NAME):
	run

run:
	docker compose -f srcs/docker-compose.yml up --build --force-recreate

prune:
	docker container prune
	docker image prune
	docker volume prune

.PHONY: run prune