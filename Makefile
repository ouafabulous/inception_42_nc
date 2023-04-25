all: 
	mkdir -p /home/omoudni/data/website
	mkdir -p /home/omoudni/data/database
	docker-compose --env-file srcs/.env -f srcs/docker-compose.yml up -d --build

clean:
	docker-compose --env-file srcs/.env -f srcs/docker-compose.yml down
	docker-compose --env-file srcs/.env -f srcs/docker-compose.yml stop 

fclean: clean
	docker stop $(shell docker ps -qa)
	docker rm $(shell docker ps -qa)
	docker rmi -f $(shell docker images -qa) 
	docker volume rm $(shell docker volume ls -q)
	docker network rm $(shell docker network ls -q)

	rm -rf /home/omoudni/data/website/
	rm -rf /home/omoudni/data/database/
	docker volume rm -f inception_website
	docker volume rm -f inception_database

re: fclean all
