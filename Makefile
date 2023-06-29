NAME	= inception

$(NAME):
	run

run:
	cd srcs
	docker compose up -f docker-compose.yml --build --force-recreate

prune:
	docker container prune
	docker image prune
	docker volume prune

.PHONY: run prune