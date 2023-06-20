NAME	= inception

$(NAME):
	run

run:
	cd srcs
	docker compose up -c docker-compose.yml --build --force-recreate

prune:
	docker image prune
	docker volume prune

.PHONY: run prune