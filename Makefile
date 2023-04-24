all: 
	mkdir -p /home/omoudni/data/website
	mkdir -p /home/omoudni/data/database
	docker-compose --env-file srcs/.env -f srcs/docker-compose.yml up -d --build

clean:
	docker-compose --env-file srcs/.env -f srcs/docker-compose.yml down
	docker-compose --env-file srcs/.env -f srcs/docker-compose.yml stop 

fclean: clean
	rm -rf /home/omoudni/data/website/
	rm -rf /home/omoudni/data/database/
	docker system prune -f --all --volumes
	docker volume rm -f inception_website
	docker volume rm -f inception_database
	docker system prune -f
	docker image prune -f --filter 'label=inception'

re: fclean all
