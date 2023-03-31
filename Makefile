NAME	= inception

$(NAME):
	run

run:
	cd srcs
	docker-compose up -c docker-compose.yml

prune:
	docker image prune
	docker volume prune

.PHONY: run prune